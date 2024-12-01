using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class User
{
    public string? UserLogin { get; set; }

    public string? UserPassword { get; set; }

    public string? UserNicename { get; set; }

    public string? UserUrl { get; set; }

    public string? UserRegistered { get; set; }

    public int Id { get; set; }

    public string? UserActivationKey { get; set; }

    public string? UserStatus { get; set; }

    public string? DisplayName { get; set; }

    public virtual ICollection<Article> Articles { get; set; } = new List<Article>();

    public virtual ICollection<Originator> Originators { get; set; } = new List<Originator>();

    public virtual ICollection<ProfileImage> ProfileImages { get; set; } = new List<ProfileImage>();

    public virtual ICollection<UserAddress> UserAddresses { get; set; } = new List<UserAddress>();

    public virtual ICollection<UserGender> UserGenders { get; set; } = new List<UserGender>();

    public virtual ICollection<UserName> UserNames { get; set; } = new List<UserName>();

    public virtual ICollection<UserPhoneNumber> UserPhoneNumbers { get; set; } = new List<UserPhoneNumber>();

    public virtual ICollection<UserRole> UserRoles { get; set; } = new List<UserRole>();
}
