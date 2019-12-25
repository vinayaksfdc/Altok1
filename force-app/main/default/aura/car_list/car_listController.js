({
    doInit : function(component) {        
        var pickvar = component.get("c.getPickListValuesIntoList");
        pickvar.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS'){
                var list = response.getReturnValue();
                component.set("v.picvalue", list);
            }
            else if(state === 'ERROR'){
                //var list = response.getReturnValue();
                //component.set("v.picvalue", list);
                alert('ERROR OCCURED.');
            }
        })
        $A.enqueueAction(pickvar);
    },
    handleCompanyOnChange:function(component,event,elementId)
    //Iterate the declared var opts to the lenght of picklist values
    {   
        var indutry = component.get("v.picvalue.CarType_Values__c");
        alert(indutry);
        //alert(event.getsource().get("v.value"));
        component.set("v.carTypeId", indutry);
        
    },
    
    echo : function(component, event, helper) {
         var action = component.get("c.getCars");
         var expname = component.get("v.carTypeId");
        alert(expname);
        console.log('selected cartype is'+expname);
        action.setParams({carTypeId :expname});
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            
            if (state === "SUCCESS") 
            {
                
                alert("From server: " + response.getReturnValue());
                
                component.set('v.ListOfcars', response.getReturnValue());
                
            }
            
            else if (state === "INCOMPLETE") {
                
            }
            
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                        errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        
        $A.enqueueAction(action);
    },
    oncarClick : function(component, event, helper) {
         
    var eventSource=event.getSource();
      var car_id=(eventSource.get('v.name'));
        console.log(car_id);
        
        component.set('v.carid',car_id);
        
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
          "recordId":  v.carid

        });
        navEvt.fire();
    }
    
})