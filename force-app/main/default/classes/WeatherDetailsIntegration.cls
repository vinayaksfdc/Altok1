public class WeatherDetailsIntegration {
     public String city{get;set;}
   // public static HttpResponse getforecast(){
    
    public HttpResponse getforecast(){
        
      
        
       // console.log('city1'+city1);
        string key = '8a62aa3ce1814780b32113405190707';
       city=city;
        // city='manchester';
        integer numberofdays = 2;
        string url = 'http://api.apixu.com/v1/forecast.json?key='+key+'&q='+city;
        //+'&days='+numberofdays
        Http ht = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url);
        request.setMethod('GET');
        HttpResponse response = ht.send(request);
        system.debug(response);
        system.debug(response.getBody());
        return response;
    }
}