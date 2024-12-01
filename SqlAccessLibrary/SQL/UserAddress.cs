using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class UserAddress
{
    public int UserAddressId { get; set; }

    public string? StreetAddress1 { get; set; }

    public string? StreetAddress2 { get; set; }

    public string? City { get; set; }

    public string? Country { get; set; }

    public string? RegionalDivision { get; set; }

    public string? PrimaryAddress { get; set; }

    public int UserId { get; set; }

    public virtual User User { get; set; } = null!;
}
