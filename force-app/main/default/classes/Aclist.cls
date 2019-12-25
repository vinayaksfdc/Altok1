public class Aclist {
 	@AuraEnabled
    public static List<Account> accs()
        {
            return [select name,phone,industry,rating,billingstreet from Account where name like '%parent%'];
        }
}