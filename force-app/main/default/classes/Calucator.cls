public class Calucator
{
    
    public string value1{get;set;}
    public string value2{get;set;}
    public string outputvalue{get;set;}
    
    public String selectedvalue1{get;set;}
    
    public void callMethodinController()
    {
        if(selectedvalue1 == 'add')
        {
            outputvalue = value1+value2;
        }
      /* else
       *  if(selectedvalue1 == 'sub')
        {
            outputvalue = value1-value2;
        }else
        if(selectedvalue1 == 'mul')
        {
            outputvalue = value1*value2;
        }else
        if(selectedvalue1 == 'div')
        {
            outputvalue = value1/value2;
        }
        */
    }
    public List<SelectOption> getAllvalues() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption('--','--'));
        options.add(new SelectOption('add','ADD'));                           
        options.add(new SelectOption('sub','SUB'));
        options.add(new SelectOption('mul','MUL'));
        options.add(new SelectOption('div','DIV'));
        return options;
    }
}