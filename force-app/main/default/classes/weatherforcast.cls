public class weatherforcast  {
 
public class Condition {
		public String text{get;set;}
		public String icon;
		public Integer code;
	}

	public Location location{get;set;}
    public Current current{get;set;}

	public class Current {
		public Integer last_updated_epoch;
		public String last_updated;
		public Double temp_c{get;set;}
		public Double temp_f;
		public Integer is_day;
        public Condition condition{get;set;}
		public Double wind_mph;
		public Double wind_kph;
		public Integer wind_degree;
		public String wind_dir;
		public Double pressure_mb;
		public Double pressure_in;
		public Double precip_mm;
		public Double precip_in;
		public Integer humidity;
		public Integer cloud;
		public Double feelslike_c{get;set;}
		public Double feelslike_f;
		public Double vis_km;
		public Double vis_miles;
		public Double uv;
		public Double gust_mph;
		public Double gust_kph;
	}

	public class Location {
		public String name{get;set;}
		public String region;
		public String country;
		public Double lat;
		public Double lon;
		public String tz_id;
		public Integer localtime_epoch;
		public String localtime;
	}

	
	public static weatherforcast parse(String json) {
		return (weatherforcast) System.JSON.deserialize(json, weatherforcast.class);
	}


 
}