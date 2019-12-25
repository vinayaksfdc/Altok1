({
	doInit: function(component, event, helper) {
         console.log(5);
 		
            
    		
        },
    doSearch:function(component, event, helper) {
       var params = event.getParam('arguments');
         var params1 = JSON.stringify(params);
      console.log('params in carsearch Results-->doSearch are'+params1);
          //params in carsearch Results-->doSearch are{"formData":"Sedan"} 
        helper.onSearch(component,event);
        
    },
    search: function(component, event, helper){
      
        var params = event.getParam('arguments');
              var params4 = JSON.stringify(params);
      
     
         console.log('params in carsearch Results-->search are'+params);
        console.log('entered this step');
        console.log('params value'+params);
        console.log('formData value'+params.formData);
        
        component.set("v.carTypeId1", params.formData);
		        
        helper.onSearch(component,event);
        console.log('entred line 22');
        return "search complete.";
    },
    onCarSelect: function(component, event, helper){
        
        var carId = event.getParam("carId");
        var carId1 = JSON.stringify(carId);
        console.log('carId on car select is'+carId);
        component.set("v.selectedcarId", carId);
       
    }
})