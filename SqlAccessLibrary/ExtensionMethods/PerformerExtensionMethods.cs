using SqlAccessLibrary.SQL;
using System.Text;

namespace SqlAccessLibrary.ExtensionMethods;

public static class PerformerExtensionMethods
{
    public static string GetFullPerformerName(this PerformerName performerName)
    {
        StringBuilder fullName = new StringBuilder(performerName.FirstName);
        if (performerName.LastName != null)
            fullName.Append(" " + performerName.LastName);
        return fullName.ToString();
    }
}