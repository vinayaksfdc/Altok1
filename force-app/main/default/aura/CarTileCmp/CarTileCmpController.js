({
	oncarClick : function(component, event, helper) {
		
  		var myEvent = component.getEvent("CarSelect");
        var car=component.get("v.car");
        myEvent.setParams({"carId": car.Id});
        console.log('entered this line'+myEvent+car);
        myEvent.fire();
        
        
        var appEvent = $A.get("e.c:CarSelected");
          
        appEvent.setParams({
            "car": car
        });
        appEvent.fire();   

    }  
})