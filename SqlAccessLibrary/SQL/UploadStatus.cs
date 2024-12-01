namespace SqlAccessLibrary.SQL;

public partial class UploadStatus
{
    public int Id { get; set; }

    public int Progress { get; set; }

    public string? Status { get; set; } 
    
    public DateTime? Last_Updated { get; set; }
    
    public string? FileName { get; set; } 
    
    
}