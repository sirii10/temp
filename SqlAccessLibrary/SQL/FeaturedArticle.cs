using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class FeaturedArticle
{
    public int FeaturedArticleId { get; set; }

    public int? ArticleId { get; set; }

    public int? AboutPageId { get; set; }

    public virtual AboutPage? AboutPage { get; set; }

    public virtual Article? Article { get; set; }
}
