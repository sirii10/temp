using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformerKeyword
{
    public int PerformerKeywordId { get; set; }

    public int? KeywordId { get; set; }

    public int? PerformerId { get; set; }

    public virtual Keyword? Keyword { get; set; }

    public virtual Performer? Performer { get; set; }
}
