using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Event: ISearchable
{
    public int EventId { get; set; }

    public string? Name { get; set; }

    public DateTime StartDate { get; set; }

    public DateTime EndDate { get; set; }

    public string? Description { get; set; }

    public string? Location { get; set; }

    public int? Attendance { get; set; }

    public ulong IsPublic { get; set; }

    public string? ProgramPath { get; set; }

    public virtual ICollection<EventKeyword> EventKeywords { get; set; } = new List<EventKeyword>();

    public virtual ICollection<EventPerformance> EventPerformances { get; set; } = new List<EventPerformance>();

    public virtual ICollection<EventPerformer> EventPerformers { get; set; } = new List<EventPerformer>();

    public virtual ICollection<FeaturedEvent> FeaturedEvents { get; set; } = new List<FeaturedEvent>();

    public virtual ICollection<PerformerBiography> PerformerBiographies { get; set; } = new List<PerformerBiography>();
}
