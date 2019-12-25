public class httpcall1 {
    public string res{set;get;}
    public String[] csvFileLines{get;set;}
    public List<string> accs{set;get;}
    public List<account> accList{set;get;}
    public list<sobject> sObjList{set;get;}
    public httpcall1()
    {
        csvFileLines = new String[]{};
            acclist = New List<Account>();
    }
    
    public void httpcallout(){
        try{
            Http http1 = new Http();
            HttpRequest request1 = new HttpRequest();
            request1.setEndpoint('');
            request1.setMethod('GET');
            HttpResponse response = http1.send(request1);
            //System.debug('****'+response.getBody());
            //System.debug('****  '+response.getStatusCode() );
            res=response.getBody();
            System.debug('****  '+res);
            csvFileLines = res.split('\n');
            for(Integer i=1;i<csvFileLines.size();i++){
                Account accObj = new Account() ;
                string[] csvRecordData = csvFileLines[i].split(',');
                accObj.Name = csvRecordData[0] ;            
                accObj.Phone = csvRecordData[1];
                accObj.Industry = csvRecordData[2];
                accObj.Rating = csvRecordData[3];  
                Contact c=new Contact();
                c.lastname='sbs';
                c.AccountId=accObj.id;
                acclist.add(accObj);  
            }
            Database.SaveResult[] lsr = Database.insert(acclist,true) ;
            for (Database.SaveResult sr : lsr) {
                if (sr.isSuccess()) {
                    // Operation was successful, so get the ID of the record that was processed
                    System.debug('Successfully inserted account. Account ID: ' + sr.getId());
                }
                else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : sr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('Account fields that affected this error: ' + err.getFields());
                    }
                }
            }
        }
        catch (Exception e)
        {
            ApexPages.Message errorMessage = new ApexPages.Message(ApexPages.severity.ERROR,'An error has occured while importin data Please make sure input csv file is correct');
            ApexPages.addMessage(errorMessage);
        }  
        
    }
    
    
}