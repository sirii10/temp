using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class TranscriptionRecording
{
    public int TranscriptionRecordingId { get; set; }

    public int? TranscriptionId { get; set; }

    public int? PerformanceRecordingId { get; set; }

    public virtual PerformanceRecording? PerformanceRecording { get; set; }

    public virtual TranscriptionSrt? Transcription { get; set; }
}
