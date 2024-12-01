using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class IscDomain
{
    public int DomainId { get; set; }

    public string? Term { get; set; }

    public virtual ICollection<Alias> Aliases { get; set; } = new List<Alias>();

    public virtual ICollection<Originator> Originators { get; set; } = new List<Originator>();

    public virtual ICollection<RecordingSearch> RecordingSearches { get; set; } = new List<RecordingSearch>();
}
