using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class FeaturedPerformer
{
    public int FeaturedPerformerId { get; set; }

    public int? TitlePageId { get; set; }

    public string? FeaturedPerformerImagePath { get; set; }

    public string? PerformerName { get; set; }

    public virtual TitlePage? TitlePage { get; set; }
}
