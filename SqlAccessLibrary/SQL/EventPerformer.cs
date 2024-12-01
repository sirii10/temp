using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class EventPerformer
{
    public int EventPerformerId { get; set; }

    public int? EventId { get; set; }

    public int? PerformerId { get; set; }

    public virtual Event? Event { get; set; }

    public virtual Performer? Performer { get; set; }
}
