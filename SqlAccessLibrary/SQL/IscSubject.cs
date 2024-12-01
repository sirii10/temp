using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class IscSubject
{
    public int SubjectId { get; set; }

    public string? Term { get; set; }

    public virtual ICollection<Alias> Aliases { get; set; } = new List<Alias>();

    public virtual ICollection<Article> Articles { get; set; } = new List<Article>();
}
