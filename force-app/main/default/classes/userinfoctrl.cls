public class userinfoctrl {
	@AuraEnabled
    public static user fetchuser(){
        user userinfo = [SELECT id, name, username, country, email
                        FROM User
                        WHERE id =: userinfo.getuserId()];
        return userinfo;
    }
}