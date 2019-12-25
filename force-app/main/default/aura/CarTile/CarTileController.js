({
	oncarClick : function(component, event, helper) {
		 console.log(6);
  		var myEvent = component.getEvent("CarSelect");
        //alert('CarTileController.js is'+myEvent);
        alert('CarTileController.js is'+myEvent);
        var car=component.get("v.car");
        alert('CarTileController.js car is'+car);
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