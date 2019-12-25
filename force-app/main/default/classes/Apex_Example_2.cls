public class Apex_Example_2 {
 
                @AuraEnabled
                public static String getName(String City,String Condition){
                    String name='Your Name :'+City+':'+Condition;
                    return name;
                }
	 

}