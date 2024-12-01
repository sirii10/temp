using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class UserPhoneNumber
{
    public int UserPhoneNumberId { get; set; }

    public string? CountryCode { get; set; }

    public ulong? IsPrimaryPhone { get; set; }

    public string? PhoneNumber { get; set; }

    public int? UserId { get; set; }

    public virtual User? User { get; set; }
}
