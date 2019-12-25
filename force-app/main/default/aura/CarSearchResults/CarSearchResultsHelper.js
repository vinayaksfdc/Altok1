({
 onSearch : function(component) {
        var x=component.get("v.carTypeId1");
     	console.log('entered this step in helper'+ x);
        var action = component.get("c.getCars");
        if(x=='All Types'){
            x='';
        }
		 	var action = component.get("c.getCars");
        	action.setParams({
          	"CarTypeId":x
        	});
        	
    		action.setCallback(this, function(response) {
               
                var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    
                    component.set("v.car", response.getReturnValue());
                  console.log('entered this step line 19');
                }
                else {
                    console.log("Failed with state1: " + state);
                }
        	});
    		$A.enqueueAction(action);
	}
})