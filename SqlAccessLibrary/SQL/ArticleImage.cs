using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class ArticleImage
{
    public int ArticleImageId { get; set; }

    public int? ArticleId { get; set; }

    public string? ImageUrl { get; set; }

    public string? ImageDir { get; set; }

    public string? ImageName { get; set; }

    public string? Description { get; set; }

    public string? ImageType { get; set; }

    public virtual Article? Article { get; set; }
}
