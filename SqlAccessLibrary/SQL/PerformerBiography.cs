using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformerBiography
{
    public int PerformerBiographyId { get; set; }

    public int? PerformerId { get; set; }

    public int? EventId { get; set; }

    public string? Biography { get; set; }

    public virtual Event? Event { get; set; }

    public virtual Performer? Performer { get; set; }
}
