using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformanceRecording
{
    public int PerformanceRecordingId { get; set; }

    public int? PerformanceId { get; set; }

    public string? RecordingName { get; set; }

    public string? RecordingPath { get; set; }

    public string? Format { get; set; }

    public int? PlayCount { get; set; }

    public TimeSpan? Runtime { get; set; }

    public int? SequenceNumber { get; set; }

    public bool? PermissionToRelease { get; set; }

    public bool? ReadyForRelease { get; set; }

    public string? AudioOrVideo { get; set; }

    public virtual Performance? Performance { get; set; }

    public virtual ICollection<RecordingSearch> RecordingSearches { get; set; } = new List<RecordingSearch>();

    public virtual ICollection<TranscriptionRecording> TranscriptionRecordings { get; set; } = new List<TranscriptionRecording>();
}
