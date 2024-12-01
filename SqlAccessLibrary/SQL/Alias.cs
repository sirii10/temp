using System;
using System.Collections.Generic;

namespace SqlAccessLibrary.SQL;

public partial class Alias
{
    public int AliasId { get; set; }

    public int? AttributeId { get; set; }

    public int? SubjectId { get; set; }

    public int? DomainId { get; set; }

    public int? KeywordId { get; set; }

    public int? Rank { get; set; }

    public int? Searchcount { get; set; }

    public DateTime? Lastsearch { get; set; }

    public virtual IscAttribute? Attribute { get; set; }

    public virtual IscDomain? Domain { get; set; }

    public virtual Keyword? Keyword { get; set; }

    public virtual IscSubject? Subject { get; set; }
}
