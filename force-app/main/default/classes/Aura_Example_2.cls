public class Aura_Example_2 {
                @AuraEnabled
                public static String getName(String lastName,String firstName){
                    String name='Your Name :'+lastName+':'+firstName;
                    return name;
                }
			}