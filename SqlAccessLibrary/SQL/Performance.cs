using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Performance: ISearchable
{
    public int PerformanceId { get; set; }

    public string? Name { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? EndDate { get; set; }

    public DateTime? StartTime { get; set; }

    public DateTime? EndTime { get; set; }

    public bool? HasAdultContent { get; set; }

    public int? Attendance { get; set; }

    public bool? IsPublic { get; set; }

    public string? Performancescol { get; set; }

    public string? Description { get; set; }

    public virtual ICollection<EventPerformance> EventPerformances { get; set; } = new List<EventPerformance>();

    public virtual ICollection<PerformanceKeyword> PerformanceKeywords { get; set; } = new List<PerformanceKeyword>();

    public virtual ICollection<PerformancePerformer> PerformancePerformers { get; set; } = new List<PerformancePerformer>();

    public virtual ICollection<PerformanceRecording> PerformanceRecordings { get; set; } = new List<PerformanceRecording>();
}
