public class calc {
         
    public string a{set;get;}
    public string b{set;get;}
    public string c{set;get;}
    public string d{set;get;}
    public string e{set;get;}
    public string f{set;get;}
    public string g{set;get;}
    public string h{set;get;}
    public string i{set;get;}
    public string j {set;get;}
    public string k {set;get;}
    public string l {set;get;}
    Public string  num{set;get;}
    Public integer result{set;get;}
    public void val1() 
    {
        a='1'; 
        num=num+a;
    }
    public void val2() 
    {
        b='2';
        num=num+b;
    }
    public void val3() 
    {
        c='3';
        num=num+c;
    }
    public void val4() 
    {
        d='4';
        num=num+d;
    }
    public void val5() 
    {
        e='5';
        num=num+e;
    }
    public void val6() 
    {
        f='6';
        num=num+f;
    }
    public void val7() 
    {
        g='7';
        num=num+g;
    }
    public void val8() 
    {
        h='8';
        num=num+h;
    }
    public void val9() 
    {
        i='9';
        num=num+i;
    }
    public void add() 
    {
        j='+';
        num=num+j;
    }
    public void sub() 
    {
        k='-';
        num=num+k;
    }
    public void mul() 
    {
        l='*';
        num=num+l;
    }
    
 public void eqls()
    {
     /* String str='123+456+789=';
        String inputExprn = str.removeEnd('=');
        system.debug('inputExprn: '+inputExprn); 
      
       // inputExprn: (123, 456, 789)  
       // const calculate = (n1, operator, n2) => {
  let result = ''
  if (operator === 'add') {
    result = firstNum + parseFloat(n2)
  } else if (operator === 'subtract') {
    result = parseFloat(n1) - parseFloat(n2)
  } else if (operator === 'multiply') {
    result = parseFloat(n1) * parseFloat(n2)
  } else if (operator === 'divide') {
    result = parseFloat(n1) / parseFloat(n2)
  }
  
  return result
}
       // 
       // 
       // 
       // 
       // 
       // 
       // 
       // 
       // */
 
        If (num.contains('+'))
        {
            List<String> lst = num.split('\\+',-2);
            system.debug('lst:'+lst);
            //lst: 123+456+789
            result=0;
            for (String s: lst)
            {
                result=result+Integer.valueof(s);
            }
            num=String.valueof(result);
            system.debug('result: '+result);
            //result: 1368
        }  
    }
}