using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Keyword
{
    public int KeywordId { get; set; }

    public string? Keyword1 { get; set; }

    public string? KeywordType { get; set; }

    public virtual ICollection<Alias> Aliases { get; set; } = new List<Alias>();

    public virtual ICollection<EventKeyword> EventKeywords { get; set; } = new List<EventKeyword>();

    public virtual ICollection<PerformanceKeyword> PerformanceKeywords { get; set; } = new List<PerformanceKeyword>();

    public virtual ICollection<PerformerKeyword> PerformerKeywords { get; set; } = new List<PerformerKeyword>();
}
