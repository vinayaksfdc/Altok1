public class createcontact {
@AuraEnabled
    public static string createcont(contact contObj)
    {
        insert contObj;
        return contObj.id;
    }
}