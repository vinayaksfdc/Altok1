public class userCntrl {
    @AuraEnabled
    public static user fetchuser(){
        user userinfo = [SELECT id, name, username, country, email
                         FROM User
                         WHERE id =: userinfo.getuserId()];
        return userinfo;
    }
    
    @AuraEnabled
    public static String serverEcho(String filterName) { 
        system.debug('filterName'+filterName);
        /* return ('Hello from the server, ' + filterName);  */
        list<contact> conid=[SELECT accountid  FROM contact  WHERE name =: filterName];
        system.debug('conid'+conid);
        id id1 = conid[0].accountid;
        system.debug('id1 is'+id1);
        return id1;
    }
    
}