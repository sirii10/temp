using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class TranscriptionSrt
{
    public int TranscriptionId { get; set; }

    public string? SrtFilepath { get; set; }

    public int? SequenceNumber { get; set; }

    public DateTime? SrtTimestamp { get; set; }

    public string? SrtCaption { get; set; }

    public string? LineByLine { get; set; }

    public string? FromFile { get; set; }

    public int? SequenceStart { get; set; }

    public int? SequenceEnd { get; set; }

    public ulong? PermissionToRelease { get; set; }

    public ulong? ReadyForRelease { get; set; }

    public virtual ICollection<TranscriptionRecording> TranscriptionRecordings { get; set; } = new List<TranscriptionRecording>();
}
