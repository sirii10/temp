
using System.Text;
using ClosedXML.Excel;
using Microsoft.EntityFrameworkCore;
using SqlAccessLibrary.SQL;

using Microsoft.AspNetCore.Hosting;


namespace SqlAccessLibrary.DataEntry
{
    //This class is very tightly coupled to a format defined by a specific Excel file, 2022 ISC festivate data workboook updated.xlsx
    //In the future, we're going to want to consider a less tightly coupled means for data entry. A well designed admin interface would be a good start.
    public class ExcelImportService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;
        private readonly IWebHostEnvironment _webHostEnvironment;

        public ExcelImportService(IDbContextFactory<IscDatabaseContext> applicationDbContextFactory, IWebHostEnvironment  webHostEnvironment)
        {
            _applicationDbContextFactory = applicationDbContextFactory;
            _webHostEnvironment = webHostEnvironment;
        }

        public void ImportExcel(string path, UploadStatus status)
        {
            status.Status = "PENDING";
            status.Last_Updated = DateTime.Now;
            var dbContext = _applicationDbContextFactory.CreateDbContext();
            dbContext.UploadStatus.Update(status);
            dbContext.SaveChanges();
            var excelDirectory = Path.GetDirectoryName(path);

            IXLWorksheet? festivalParticipants = null;
            IXLWorksheet? performances = null;
            using (var workbook = new XLWorkbook(path))
            {
                foreach (IXLWorksheet worksheet in workbook.Worksheets)
                {
                    switch (worksheet.Name)
                    {
                        case "Festival Participants":
                            festivalParticipants = worksheet;
                            break;
                        case "Performances":
                            performances = worksheet;
                            break;
                        default:
                            throw new System.ArgumentException("Unexpected worksheet name: " + worksheet.Name);

                    }

                }

                //We must put the performers in the database first, as events refer to performers
                //TODO: There's no error checking here. If performances refers to performers that don't exist, entityFrameworkCore will fail
                if (festivalParticipants != null)
                {
                    ImportFestival_Participants(festivalParticipants, _applicationDbContextFactory, excelDirectory);

                }

                if (performances != null)
                {
                    ImportPerformances(performances, _applicationDbContextFactory, excelDirectory);
                }
                status.Status = "COMPLETED";
                status.Last_Updated = DateTime.Now;
                dbContext.UploadStatus.Update(status);
                dbContext.SaveChanges();

            }
        }

        private void ImportFestival_Participants(IXLWorksheet worksheet, IDbContextFactory<IscDatabaseContext> databaseContextFactory, string excelDirectory)
        {
            var rows = worksheet.Rows().Skip(1);
            foreach (var row in rows)
            {
                Performer performer = new Performer();
                var dbContext = databaseContextFactory.CreateDbContext();
                dbContext.Performers.Add(performer);
                dbContext.SaveChanges(); //This gives the performer an ID - TODO: If we're given an empty row, we'll end up creating a floating performer that probably will need to be deleted. Consider refactor or clean incoming excel sheet.

                var hasFirstName = row.Cell(1).TryGetValue(out string firstName);
                var hasMiddleName = row.Cell(2).TryGetValue(out string middleName);
                var hasLastName = row.Cell(3).TryGetValue(out string lastName);
                var hasPerformingGroup = row.Cell(4).TryGetValue(out string performingGroup);
                if (hasFirstName || hasMiddleName || hasLastName)
                {
                    PerformerName performerName = new PerformerName();
                    performerName.FirstName = firstName;
                    performerName.MiddleName = middleName;
                    performerName.LastName = lastName; //TODO: If they have a name, performing group is ignored
                    performerName.PerformerId = performer.PerformerId;
                    dbContext.PerformerNames.Add(performerName);
                }
                else if (hasPerformingGroup)
                {
                    var performerName = new PerformerName();
                    performerName.LastName = performingGroup;//TODO: This is probably the wrong way in the database to handle performing Groups
                    performerName.PerformerId = performer.PerformerId;
                    dbContext.PerformerNames.Add(performerName);
                }

                
                if (row.Cell(6).TryGetValue(out string biography))
                {
                    PerformerBiography performerBiography = new PerformerBiography();
                    performerBiography.Biography = biography;
                    performerBiography.PerformerId = performer.PerformerId;
                    dbContext.PerformerBiographies.Add(performerBiography);
                }
                
                if (row.Cell(7).TryGetValue(out string imagePath) && File.Exists(Path.Combine(excelDirectory, imagePath)))
                {
                    Directory.CreateDirectory(Path.Combine(_webHostEnvironment.WebRootPath, "profileImages"));
                    var imageRelativeDestination =  Path.Combine("profileImages", Path.GetFileName(imagePath));
                    var imageAbsoluteDestination = Path.Combine(_webHostEnvironment.WebRootPath, imageRelativeDestination);
                    File.Copy(Path.Combine(excelDirectory,imagePath), imageAbsoluteDestination, true); //TODO: no error handling
                    PerformerImage performerImage = new PerformerImage();
                    performerImage.ImagePath = imageRelativeDestination;
                    performerImage.PerformerId = performer.PerformerId;
                    dbContext.PerformerImages.Add(performerImage);
                }

                dbContext.SaveChanges();
            }
        }


        private void ImportPerformances(IXLWorksheet worksheet, IDbContextFactory<IscDatabaseContext> databaseContextFactory, string excelDirectory)
        {
            var rows = worksheet.Rows().Skip(1);
            foreach (var row in rows)
            {
                var dbContext = databaseContextFactory.CreateDbContext();
                Performance performance = new Performance();
                dbContext.Performances.Add(performance);
                dbContext.SaveChanges(); //This gives the performance an ID - TODO: If we're given an empty row, we'll end up creating a floating performance that probably will need to be deleted. Consider refactor or clean incoming excel sheet.

                if (row.Cell(1).TryGetValue(out string dateString))
                {
                    if (DateTime.TryParse(dateString, out DateTime date))
                    {
                        performance.StartDate = date;
                        performance.EndDate = date; //TODO: Currently the Excel format doesn't support end dates. We'll need to update the DB - for now StartDate and EndDate are the same


                        //TODO: Bad nesting here, but if we can't parse Date, StartTime, and Duration, we can't get EndTime. If problems occur, just don't set any values (needs logging?)
                        if (row.Cell(2).TryGetValue(out string startTimeString))
                        {
                            //For some reason, Excel Times are actually DateTimes. Only need TimeOfDay here, but must parse as DateTime
                            if (DateTime.TryParse(startTimeString, out DateTime startTime))
                            {
                                performance.StartTime = date + startTime.TimeOfDay;

                                if (row.Cell(3).TryGetValue(out string durationString))
                                {
                                    if (int.TryParse(durationString, out int durationMinutes))
                                    {
                                        var duration = new TimeSpan(0, durationMinutes, 0);
                                        performance.EndTime = performance.StartTime + duration;
                                    }
                                }
                            }

                        }
                        
                    }
                }

                if (row.Cell(4).TryGetValue(out string venue))
                {
                    //TODO: Right now on the excel sheet, Performances and Events are conflated. We need to define events in the excel format for their own entry, so we're ignoring this field for now
                }

                if (row.Cell(5).TryGetValue(out string performanceTitle))
                {
                    performance.Name = performanceTitle;
                }

                if (row.Cell(6).TryGetValue(out string performanceType))
                {
                    //TODO: This is the performance type. This would be defined in PerformanceKeywords, but is not implemented yet
                }

                if (row.Cell(7).TryGetValue(out string performanceDescription))
                {
                    performance.Description = performanceDescription;
                }

                List<string> performers = new List<string>();
                
                
                //Columns I-Q, or 10-18 are all possible performers
                for (int i = 10; i <= 18; i++)
                {
                    if (!row.Cell(i).TryGetValue(out string performerName)) continue;

                    //TODO: This doesn't account for multiple performers with the same name exactly, it just takes the first match. If there are two performers with the same name, it will pick the first performer. It also may be slow.
                    Performer? performer = Enumerable.FirstOrDefault(
                        dbContext.Performers.Include(p => p.PerformerNames).Where(perf => perf.PerformerNames.Count > 0), 
                        perf => GetFullName(perf.PerformerNames.First()) == performerName);
                    if (performerName != "")
                    {
                        performers.Add(performerName);
                    }
                    
                    
                    if (performer == null) continue;
                    
                    PerformancePerformer performancePerformer = new PerformancePerformer();
                    performancePerformer.PerformerId = performer.PerformerId;
                    performancePerformer.PerformanceId = performance.PerformanceId;
                    dbContext.PerformancePerformers.Add(performancePerformer);
                }

                dbContext.SaveChanges();
                if (row.Cell(8).TryGetValue(out string recordingPath) && File.Exists(Path.Combine(excelDirectory, recordingPath)))
                {
                    Directory.CreateDirectory(Path.Combine(_webHostEnvironment.WebRootPath, "recordings"));
                    var recordingRelativeDestination = Path.Combine("recordings", Path.GetFileName(recordingPath));
                    var recordingAbsoluteDestination = Path.Combine(_webHostEnvironment.WebRootPath, recordingRelativeDestination);
                    File.Copy(Path.Combine(excelDirectory, recordingPath), recordingAbsoluteDestination, true); //TODO: no error handling
                    PerformanceRecording performanceRecording = new PerformanceRecording();
                    performanceRecording.RecordingPath = recordingRelativeDestination;
                    performanceRecording.PerformanceId = performance.PerformanceId;
                    //TODO: these are all the properties needed for a recording MVP, but we may need to fill out more values into the database entry
                    dbContext.PerformanceRecordings.Add(performanceRecording);
                    dbContext.SaveChanges();

                    
                    //In database, must have recording entry to have corresponding transcript. May need to be changed
                    if (row.Cell(9).TryGetValue(out string transcriptPath) && File.Exists(Path.Combine(excelDirectory, transcriptPath)))
                    {
                        Directory.CreateDirectory(Path.Combine(_webHostEnvironment.WebRootPath, "transcriptions"));
                        var transcriptRelativeDestination = Path.Combine("transcriptions", Path.GetFileName(transcriptPath));
                        var transcriptAbsoluteDestination = Path.Combine(_webHostEnvironment.WebRootPath, transcriptRelativeDestination);
                        File.Copy(Path.Combine(excelDirectory, transcriptPath), transcriptAbsoluteDestination, true);
                        //TODO: no verification transcription path is valid
                        TranscriptionSrt transcriptionSrt = new TranscriptionSrt();
                        dbContext.SaveChanges(); //This gives the transcription recording an ID
                        transcriptionSrt.SrtFilepath = transcriptRelativeDestination;
                        string transcriptionText = File.ReadAllText(Path.Combine(excelDirectory, transcriptPath)); //TODO: Needs error handling
                        string searchSpeakers = "SPEAKER_";
                        HashSet<string> uniqueSpeakers = new HashSet<string>();
                        string[] words = transcriptionText.Split(new[] { ' ', '\n', '\r'}, StringSplitOptions.RemoveEmptyEntries);
                        foreach (string word in words)
                        {
                            if (word.StartsWith(searchSpeakers))
                            {
                                uniqueSpeakers.Add(word);
                            }
                        }

                        List<string> listOfSpeakers = new List<string>();
                        listOfSpeakers.AddRange(uniqueSpeakers);

                        for (int i = 0; i < performers.Count(); i++)
                        {
                            transcriptionText = transcriptionText.Replace(listOfSpeakers[i], performers[i] + ":");
                        }
                        transcriptionSrt.LineByLine = transcriptionText;

                        dbContext.TranscriptionSrts.Add(transcriptionSrt);
                        dbContext.SaveChanges();
                        TranscriptionRecording transcriptionRecording = new TranscriptionRecording();
                        transcriptionRecording.PerformanceRecordingId = performanceRecording.PerformanceRecordingId;
                        transcriptionRecording.TranscriptionId = transcriptionSrt.TranscriptionId;
                        dbContext.TranscriptionRecordings.Add(transcriptionRecording);
                        dbContext.SaveChanges();
                    }
                }
            }
        }

        private string GetFullName(PerformerName performerName)
        {
            StringBuilder fullName = new StringBuilder();
            if (performerName.FirstName != null)
            {
                fullName.Append(performerName.FirstName);
            }

            if (performerName.MiddleName != null)
            {
                if (fullName.Length > 0)
                {
                    fullName.Append(" ");
                }
                fullName.Append(performerName.MiddleName);
            }

            if (performerName.LastName != null)
            {
                if (fullName.Length > 0)
                {
                    fullName.Append(" ");
                }
                fullName.Append(performerName.LastName);
            }
            return fullName.ToString();
        }
    }
}
