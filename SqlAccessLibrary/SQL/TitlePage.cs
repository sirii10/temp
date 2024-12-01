using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class TitlePage
{
    public int TitlePageId { get; set; }

    public string? Subheading { get; set; }

    public string? PageDescription { get; set; }

    public string? ReadMoreLink { get; set; }

    public string? TitleImagePath { get; set; }

    public virtual ICollection<FeaturedEvent> FeaturedEvents { get; set; } = new List<FeaturedEvent>();

    public virtual ICollection<FeaturedPerformer> FeaturedPerformers { get; set; } = new List<FeaturedPerformer>();
}
