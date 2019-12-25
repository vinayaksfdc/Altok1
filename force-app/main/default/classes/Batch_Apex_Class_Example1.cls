global class Batch_Apex_Class_Example1 implements Database.Batchable<SObject>,Database.Stateful {

    public list<Car_Service__c> listofcarswithoutservice{set;get;}
  	global Database.QueryLocator start(Database.BatchableContext bc){
        String query ='select id, name, createdDate, Car__r.Name, car__r.Next_Service_Date__c from Car_Service__c limit 10';
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
        system.debug('List of carserivecs finish'+listofcarswithoutservice);
        Messaging.SingleEmailMessage msg =new Messaging.SingleEmailMessage();
        /*for(Car_Service__c c:listofcarswithoutservice)
        {
            {!c.Name}


			Extra ';', at '}'.
		Expecting '}' but was: '<EOF>'
	!		 operator can only be applied to boolean expressions

            
        }
			*/
        List<String> toadd=new List<String>{'vinayakb2@gmail.com'};
        msg.setToAddresses(toadd);
        msg.setSubject('Test Mail');
         msg.setTemplateId('00X6F000001GnyU'); 
        String body=('List of carserivecs finish'+listofcarswithoutservice);
         
        msg.setHtmlBody(body);
        Messaging.Email[] emails =new Messaging.Email[]{msg};
        Messaging.sendEmail(emails);                  

   }
}