using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class AboutPage
{
    public int AboutPageId { get; set; }

    public string? Heading { get; set; }

    public string? Subheading { get; set; }

    public string? VideoLink { get; set; }

    public virtual ICollection<FeaturedArticle> FeaturedArticles { get; set; } = new List<FeaturedArticle>();
}
