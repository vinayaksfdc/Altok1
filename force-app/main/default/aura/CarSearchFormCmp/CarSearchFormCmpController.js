({
	doInit: function(component, event, helper) {
 var createNewcar = $A.get("e.force:createRecord");
        if (createNewcar) {
            component.set("v.showNewButton", true);
        }else{
             component.set("v.showNewButton", false);
        }
    var action = component.get("c.getcartypes");

    // Add callback behavior for when response is received
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            //debugger
            console.log("responce : " + response.getReturnValue());
            component.set("v.ctypes", response.getReturnValue());
        }
        else {
            console.log("Failed with state: " + state);
        }
    });

    // Send action off to be executed
    $A.enqueueAction(action);
	},
    createcar: function (component) 
     {
            console.log('inside controller');
            var createRecordEvent = $A.get('e.force:createRecord');
            if (createRecordEvent) 
            {
                    var typeName = component.find('typeSelect').get('v.value');
                    //var typeMap = component.get('v.searchOptionToIdMap');
                    var typeId = null;
                    if (typeName) 
                    {
                            typeId = typeName;
                    }
                    createRecordEvent.setParams({
                        'entityApiName': 'car__c',
                        'defaultFieldValues': {
                            'car__c': typeId
                        }
                    });
                    createRecordEvent.fire();
            }
       },
    onFormSubmit:function(component, event, helper) {
       	
        console.log("selectType at line 51 "+ component.get("v.selectedType") );
        
        var carTypeId = component.get("v.selectedType");
         console.log("Search button pressed at line 54" + carTypeId);
       
        var formSubmit = component.getEvent("formsubmit");
        console.log("formData at line 56" + formSubmit);
        formSubmit.setParams({"formData" : carTypeId
        });
        console.log("formData at line 58" + formSubmit);
        
        formSubmit.fire();
        },
    handleChange:function(component, event, helper) {
        var y=component.find("CarTypes").get("v.value");
        
        console.log("val :  "+ y);
        
        component.set("v.selectedType",y);
        
    }
    
})