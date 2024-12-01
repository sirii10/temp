using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class EventPerformance
{
    public int EventPerformanceId { get; set; }

    public int? EventId { get; set; }

    public int? PerformanceId { get; set; }

    public virtual Event? Event { get; set; }

    public virtual Performance? Performance { get; set; }
}
