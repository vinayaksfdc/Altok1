public class Returns{  
   public String choosenText{get;set;}  
   public Returns(){  
  choosenText = 'Hi Salesforce' + '\n' + ' This is a Salesforce Techie Blog.' + '\n' + 'Please share your Feedback';  
       system.debug('chosen text is '+choosenText);
   }  
  }