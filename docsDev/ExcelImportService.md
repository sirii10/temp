# ExcelImportService

Our stakeholders require mass data entry for the storytelling website. This is a difficult workflow considering the depth and breadth of data that must be considered.

As a stop-gap to allow following students to set up a development enviornment, ExcelImportSerivce.cs was implemented in the SqlAccessLibrary. This class is not sufficient to meet stakeholder requirments, but it should prove helpful to show how the IscDatabaseContext can be leveraged to create data entries in the MySQL database.

The class has significant issues. First and foremost, API takes a single parameter, which is the path to a directory containing an Excel file. Worse still, the excel file contains paths to assets that must be uploaded into the website, like performer images and transcription files. This is very rigid, and very error prone with insufficient error handling. This workflow is not meant to act as a final product and merely a means for following developers to get a foothold working on the functionality.

This class is also very tightly coupled to DataImportPage.razor in StorytTellingWebsite.

DataImportPage expects the user to supply a .zip file containing the correctly formatted excel file and all other assets. It will upload the .zip file into the server, unzip it into a temporary directory, delete the orginal .zip file, and point ExcelImportService to the temporary directory where the files were unzipped. Note at this point no assets can be used unless they are placed inside StoryTellingWebsite -> WWWRoot, which should be fixed later.

The ExcelImportService.ImportExcel method takes the path to the temporary directory and reads through the excel doc using the ClosedXML library. It expects the excel doc in that directory to contain two pages, one named "Festival Participants" and another named "Performances". It will read through the "Festival Participants" page first, creating the proper rows in the MySQL database and copying the proper files into StoryTellingWebiste -> WWWRoot. Then it will do the same for the "Performances" page. This class has little to no error handling and must be improved. It may be better to break up the workflow into multiple steps for the user.

If there is any deviation in the shape of the Excel document, the resulting data uploaded to the MySQL server will likely be mangled.

The `Festival Participants` page must be the first in the .xlsx file, with these columns exactly

| First Name    | Middle Name | Last Name | Performing Group | Participant Full Name | Biography | Image |
| -------- | ------- |  ------- |  ------- |  ------- |  ------- |  ------- |

The `Performance` page must be the second in the .xlsx file, with these columns exactly

| Date    | Start Time | Duration (minutes) | Venue | Title |Type | Description | Recording | Transcription | Performer | Performer | Performer | Performer | Performer | Performer | Performer | Performer | Performer |
| -------- | ------- |  ------- |  ------- |  ------- |  ------- |  ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- |

There 9 performer columns in case a performance has many performers. Often these are expected to be blank entries.

The `Image`, `Recording`, and `Transcription` columns are expected to be paths to files inside the uploaded .zip file. These file will be copied into StoryTellingWebsite -> WWWRoot and managed there for the proper MySqlDatabase Entries.

It should once again be reiterated that this implementation is a **prototype**. There are numerous flaws, including expecting users to be able to properly assemble .zip files with paths to other asset files and the swaths of missing data. This excel sheet is simplified compared to all the data stakeholders would like put into the webiste. The database's schema is also awkward in places, as one will see reviewing the code to construct the proper C# classes to upload into the MySQL database.

Note that classes are saved in a particular order, as you cannot create an entry in a table and another entry that points to it using a forign key in the same transaction.