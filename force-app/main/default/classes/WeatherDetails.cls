public class WeatherDetails {
    public WeatherApexClass wc{get;set;}
    HttpResponse response = WeatherDetailsIntegration.getforecast();
    public WeatherDetails(){
        if(response.getStatusCode() == 200){
            string data = response.getBody();
            wc = WeatherApexClass.parse(data);
        }
    }
}