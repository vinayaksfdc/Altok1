public class httpcall2 {
    public string res{set;get;}
    public String[] csvFileLines{get;set;}
    public List<Contact> conListtoUpdate{set;get;}
    public Map<string,contact> lstcon;
    list<account> acclist;
   public list<sobject> sobj;
         
    public httpcall2()
    {
         acclist = New List<Account>();
        csvFileLines = new String[]{};
        lstcon=new Map<string,contact>();
         sobj=new List<sobject>();
      
    }
    
    public void httpcallout(){
        try{
            Http http1 = new Http();
            HttpRequest request1 = new HttpRequest();
          //  request1.setHeader('Authorization','OAuth ' + access_Token);
            request1.setEndpoint('https://public.dm.files.1drv.com/y4mQ5NLOaffndoelUtpF8cBGYjK6NCx76fWKVmXQoNf4RTfSlPQa86HwxGjQLq4akhzUMsgud5yH9ZsIVZ7xleK6vs9TpLw8q84PCwIAHOf251siTZ16Je38kdIHnebzDyuAZ6oyPT7_zCP8_8EIpGudu4zA96Oy-ciy2y-eKRpznwqXN87sqfYm0IXPws1ntc-QagLycubLWdakD_xpAT9cfYqHXO-ifCi7xmVhAldtZczWskdjzmNTFKBp9sy3FVNY93F-uoytevpjlk0kk0XlhFXdR3aAYeej9TUXZHkVSI');

            request1.setMethod('GET');
            HttpResponse response = http1.send(request1);
          //  System.debug('Response ****'+response.getBody());
           // System.debug('Status   ****  '+response.getStatusCode() );
            res=response.getBody();
            System.debug('****  '+res);
             csvFileLines = res.split('\n');
            for(Integer i=1;i<csvFileLines.size();i++){
                Account accObj = new Account() ;
                 Contact conObj = new Contact() ;
                string[] csvRecordData = csvFileLines[i].split(',');
                accObj.Name = csvRecordData[0] ;            
                accObj.Phone = csvRecordData[1];
                accObj.Industry = csvRecordData[2];
                accObj.Rating = csvRecordData[3]; 
                acclist.add(accObj);
                sobj.add(accObj);
                conObj.FirstName=csvRecordData[4]; 
                conObj.LastName= csvRecordData[5]; 
                 lstcon.put(accObj.Name, conObj);
                System.debug('hello acclist'+lstcon);
            }
               insert acclist;
           }    
        	catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importing data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
            
     
     
         
        
        
        
        
    }
    
    
}