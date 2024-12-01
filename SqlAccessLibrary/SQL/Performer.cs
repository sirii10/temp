using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Performer: ISearchable
{
    public int PerformerId { get; set; }

    public virtual ICollection<EventPerformer> EventPerformers { get; set; } = new List<EventPerformer>();

    public virtual ICollection<PerformancePerformer> PerformancePerformers { get; set; } = new List<PerformancePerformer>();

    public virtual ICollection<PerformerBiography> PerformerBiographies { get; set; } = new List<PerformerBiography>();

    public virtual ICollection<PerformerImage> PerformerImages { get; set; } = new List<PerformerImage>();

    public virtual ICollection<PerformerKeyword> PerformerKeywords { get; set; } = new List<PerformerKeyword>();

    public virtual ICollection<PerformerName> PerformerNames { get; set; } = new List<PerformerName>();
}
