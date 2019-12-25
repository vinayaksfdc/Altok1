public class HelloNameAura{
    @AuraEnabled
    public static string getUserName(){
        return UserInfo.getUserName();
    }
    @AuraEnabled
    public static string dummyMethod(string filterParam,String otherParam){
        string dummy='';
        
        //list<contact> cts=[select id from contact where :filterParam];
        return dummy;
    }
    
    
    
    
}