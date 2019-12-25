public class HelloWorldClass {
    public String str {get;set;}
    public String inputExprn {get;set;}
    public  Integer result {set;get;}
    public List<String> lst {get;set;}
    //public String operator{get;set;}
    //public double result{get;set;}
    //public String inputExprn = '123+456=';  
    
    public void Calc()
    {
        String str='123+456+789=';
        String inputExprn = str.removeEnd('=');
        system.debug('inputExprn: '+inputExprn);
        
       // inputExprn: (123, 456, 789)

	


        If (inputExprn.contains('+'))
        {
            List<String> lst = inputExprn.split('\\+',-2);
            system.debug('lst:'+lst);
            //lst: 123+456+789
            result=0;
            for (String s: lst)
            {
                result=result+Integer.valueof(s);
            }
            system.debug('result: '+result);
            //result: 1368
        }  
    }
}