using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class EventKeyword
{
    public int EventKeywordId { get; set; }

    public int? EventId { get; set; }

    public int? KeywordId { get; set; }

    public virtual Event? Event { get; set; }

    public virtual Keyword? Keyword { get; set; }
}
