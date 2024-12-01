using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Article
{
    public int ArticleId { get; set; }

    public int? OriginatorId { get; set; }

    public int? AttributeId { get; set; }

    public int? SubjectId { get; set; }

    public DateTime? PostDate { get; set; }

    public DateTime? PostDateGmt { get; set; }

    public string? PostContent { get; set; }

    public string? PostTitle { get; set; }

    public string? PostExcerpt { get; set; }

    public string? PostStatus { get; set; }

    public string? PostName { get; set; }

    public DateTime? PostLastModified { get; set; }

    public int? UserId { get; set; }

    public virtual ICollection<ArticleImage> ArticleImages { get; set; } = new List<ArticleImage>();

    public virtual IscAttribute? Attribute { get; set; }

    public virtual ICollection<FeaturedArticle> FeaturedArticles { get; set; } = new List<FeaturedArticle>();

    public virtual Originator? Originator { get; set; }

    public virtual IscSubject? Subject { get; set; }

    public virtual User? User { get; set; }
}
