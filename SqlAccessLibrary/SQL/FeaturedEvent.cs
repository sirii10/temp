using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class FeaturedEvent
{
    public int FeaturedEventId { get; set; }

    public string? ArticleLink { get; set; }

    public int? EventId { get; set; }

    public int? TitlePageId { get; set; }

    public virtual Event? Event { get; set; }

    public virtual TitlePage? TitlePage { get; set; }
}
