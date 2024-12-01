using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformanceKeyword
{
    public int PerformanceKeywordId { get; set; }

    public int? KeywordId { get; set; }

    public int? PerformanceId { get; set; }

    public virtual Keyword? Keyword { get; set; }

    public virtual Performance? Performance { get; set; }
}
