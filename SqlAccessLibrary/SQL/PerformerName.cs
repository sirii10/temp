using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformerName
{
    public int PerformerNameId { get; set; }

    public int? PerformerId { get; set; }

    public string? FirstName { get; set; }

    public string? MiddleName { get; set; }

    public string? LastName { get; set; }

    public string? Honorifics { get; set; }

    public string? Qualifiers { get; set; }

    public DateTime StartTime { get; set; }

    public DateTime? EndTime { get; set; }

    public virtual Performer? Performer { get; set; }
}
