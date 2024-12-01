using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class ProfileImage
{
    public int ProfileImageId { get; set; }

    public string? ImageName { get; set; }

    public string? ImagePath { get; set; }

    public string? ImageType { get; set; }

    public int? UserId { get; set; }

    public virtual User? User { get; set; }
}
