using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class RoleType
{
    public int RoleTypeId { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
}
