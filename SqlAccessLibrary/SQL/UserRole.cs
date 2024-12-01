using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class UserRole
{
    public int UserId { get; set; }

    public int UserRoleId { get; set; }

    public DateTime? EndTime { get; set; }

    public DateTime? StartTime { get; set; }

    public int RoleId { get; set; }

    public virtual RoleType Role { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
