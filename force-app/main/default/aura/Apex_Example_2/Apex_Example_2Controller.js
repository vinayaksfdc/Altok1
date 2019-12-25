({
                invoke : function(component, event, helper) {
                    console.log('success');
                    // Read the value of firstname and lastname
                    var lname=component.find("lname").get("v.value");
                    console.log('city is'+lname);
                    var fname=component.find("fname").get("v.value");
                    console.log('city is'+fname);
                    // Invoke the method from apex class 
                    var action=component.get("c.getName");
                    // Pass the parameters in the form key value pair 
                    action.setParams({"City":lname,"Condition":fname});
                    //define callback action
                    action.setCallback(this,function(response){
                        var state=response.getState();
                         console.log('state is'+state);
                        if(state==='SUCCESS'){
                            var result=response.getReturnValue();
                            console.log('result is'+result);
                            component.set("v.empName",result);
                            console.log(result);
                        }else{
                            console.log('Error');
                        }
                    });
                    $A.enqueueAction(action);

                }
			})