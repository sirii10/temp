using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class RecordingSearch
{
    public int RecordingSearchId { get; set; }

    public int? PerformanceRecordingId { get; set; }

    public int? AttributeId { get; set; }

    public int? DomainId { get; set; }

    public int? OriginatorId { get; set; }

    public virtual IscAttribute? Attribute { get; set; }

    public virtual IscDomain? Domain { get; set; }

    public virtual Originator? Originator { get; set; }

    public virtual PerformanceRecording? PerformanceRecording { get; set; }
}
