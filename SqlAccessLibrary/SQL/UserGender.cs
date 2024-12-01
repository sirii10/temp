using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class UserGender
{
    public int UserGenderId { get; set; }

    public string? Gender { get; set; }

    public DateTime? StartTime { get; set; }

    public DateTime? EndTime { get; set; }

    public int? UserId { get; set; }

    public virtual User? User { get; set; }
}
