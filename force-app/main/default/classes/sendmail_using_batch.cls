global class sendmail_using_batch implements Database.Batchable<SObject>,Database.Stateful {

    public list<Car_Service__c> listofcarswithoutservice{set;get;}
    public string emailBody;
    global Database.QueryLocator start(Database.BatchableContext bc){
        String query ='select id, name, createdDate, Car__r.Name, car__r.Next_Service_Date__c from Car_Service__c';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc,list<Car_Service__c> carlist){
        system.debug('carlist execute is'+carlist);
          listofcarswithoutservice = new list<Car_Service__c>();
        for(Car_Service__c c: carlist){
            if(c.car__r.Next_Service_Date__c > c.createdDate){
                listofcarswithoutservice.add(c);
               	}
            system.debug('listofcarswithoutservice execute is'+carlist);
        }  
    }
    global void finish(Database.BatchableContext bc)
    {
        //system.debug('List of carserivecs finish'+listofcarswithoutservice);
         integer size;
        	size=listofcarswithoutservice.size();
        System.debug('size is'+size);	
       // for(Car_Service__c c:listofcarswithoutservice)
        //{
            for(integer i=0;i<size;i++)
            {
				emailBody='</br>'+listofcarswithoutservice[i]+'</br> ';                
            }    
        //}   
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
         List<String> toadd=new List<String>{'vinayakb2@gmail.com'};
        msg.setToAddresses(toadd);
        msg.setSubject('Test Mail');
        msg.setHtmlBody(emailBody);
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);                  

   }
}