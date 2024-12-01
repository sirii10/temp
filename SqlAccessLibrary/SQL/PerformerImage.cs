using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformerImage
{
    public int PerformerImageId { get; set; }

    public string? ImagePath { get; set; }

    public string? ImageType { get; set; }

    public int? PerformerId { get; set; }

    public virtual Performer? Performer { get; set; }
}
