({
	doInit : function(component, event, helper) {
	var action = component.get("c.fetchuser");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
               // set current user information on userInfo attribute
               console.log('response.getReturnValue()'+response.getReturnValue());
                component.set("v.userInfo", storeResponse);
                	var act  = component.get("v.userInfo");
                    console.log(' userInfo Values'+act);
            }
        });
        $A.enqueueAction(action);
    },
    
    itemsChange: function(component,event,helper){
         console.log('itemsChange event clicked');
        var usrnme=component.find("body").get("v.value");  
        console.log('name in shw1 is'+usrnme); 
        //name in shw1 is Andy Young
        component.set("v.nme",usrnme);
        var action = component.get("c.serverEcho");
        action.setParams({ filterName : usrnme });
        
        // Create a callback that is executed after 
        // the server-side action returns
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                var frmsrver=response.getReturnValue();
                alert("From server: " + response.getReturnValue());
                console.log('response.getReturnValue()'+frmsrver);
                //response.getReturnValue()0032v00002pEXL5AAO
                
                var myJSON = JSON.stringify(frmsrver);
                component.set("v.Accid", frmsrver);
                //debugger;
            }
        });
         $A.enqueueAction(action);
    }
   
})