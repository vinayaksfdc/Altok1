({
	
    onFullDetails: function(component, event, helper) {
        console.log(1);
        // debugger
 
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
          "recordId":  component.get("v.car.Id")

        });
        navEvt.fire();
    },
                    doInit1 : function(component, event, helper) {
                    console.log('success');
                    // Read the value of firstname and lastname
                     var cty=component.get("v.car.City__c").value
                   console.log(cty);
                        console.log('success');
                    var fname=component.find("fname").get("v.value");
                    // Invoke the method from apex class 
                    var action=component.get("c.getName");
                    // Pass the parameters in the form key value pair 
                    action.setParams({"City":lname,"Condition":fname});
                    //define callback action
                    action.setCallback(this,function(response){
                        var state=response.getState();
                        if(state==='SUCCESS'){
                            var result=response.getReturnValue();
                            component.set("v.empName",result);
                            console.log(result);
                        }else{
                            console.log('Error');
                        }
                    });
                    $A.enqueueAction(action);

                }

    
})