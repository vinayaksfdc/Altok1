public class  DisplayAcc 
{
    @AuraEnabled
    Public static Account getacc(String firstName)
    {
        return [select id,name,phone,industry,(select name,email,phone,RecordType.Name from contacts) from Account where name=:firstName];
    }
}