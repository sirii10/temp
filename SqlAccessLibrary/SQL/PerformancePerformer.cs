using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class PerformancePerformer
{
    public int PerformancePerformerId { get; set; }

    public int? PerformanceId { get; set; }

    public int? PerformerId { get; set; }

    public virtual Performance? Performance { get; set; }

    public virtual Performer? Performer { get; set; }
}
