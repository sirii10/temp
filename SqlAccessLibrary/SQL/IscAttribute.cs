using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class IscAttribute
{
    public int AttributeId { get; set; }

    public string? Term { get; set; }

    public virtual ICollection<Alias> Aliases { get; set; } = new List<Alias>();

    public virtual ICollection<Article> Articles { get; set; } = new List<Article>();

    public virtual ICollection<Originator> Originators { get; set; } = new List<Originator>();

    public virtual ICollection<RecordingSearch> RecordingSearches { get; set; } = new List<RecordingSearch>();
}
