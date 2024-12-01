using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Originator
{
    public int OriginatorId { get; set; }

    public int? DomainId { get; set; }

    public int? AttributeId { get; set; }

    public string? OriginatorType { get; set; }

    public int? UserId { get; set; }

    public virtual ICollection<Article> Articles { get; set; } = new List<Article>();

    public virtual IscAttribute? Attribute { get; set; }

    public virtual IscDomain? Domain { get; set; }

    public virtual ICollection<RecordingSearch> RecordingSearches { get; set; } = new List<RecordingSearch>();

    public virtual User? User { get; set; }
}
