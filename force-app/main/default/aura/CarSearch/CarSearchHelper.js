({
	onSearch : function(component,event) {
        	
            var formData = event.getParam("formData");
        console.log("param :"+formData.CarTypeId);
        	var x = formData.CarTypeId;
        if(x=='All Types'){
            x='';
        }
		 	var action = component.get("c.getCartypes");
        	action.setParams({
          	"CarTypeId":x
        	});
        	 debugger
    		action.setCallback(this, function(response) {
               
                var state = response.getState();
                if (component.isValid() && state === "SUCCESS") {
                    //debugger
                    console.log("responce : " + response.getReturnValue());
                    component.set("v.cars", response.getReturnValue());
                    
                }
                else {
                    console.log("Failed with state1: " + state);
                }
        	});
    		$A.enqueueAction(action);
	}
})