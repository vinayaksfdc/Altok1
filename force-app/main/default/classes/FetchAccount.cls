@RestResource(urlMapping='/v1/getAccounts/*')
global with sharing class FetchAccount {
@HttpGet
global static list<account> fetchAccount(){
RestRequest req = RestContext.request;
RestResponse res = Restcontext.response;
List<account> listAccount =[select name,phone,industry,rating,billingstreet from Account where name like '%parent%'];
return listAccount ;
}
}