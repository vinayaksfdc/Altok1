({
    doInit : function(component, event, helper) {
        var action = component.get("c.fetchuser");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var storeResponse = response.getReturnValue();
                // console.log('store response is '+storeResponse);
                //Country: "USA" Email: "vinayakb2@gmail.com" Id: "0052v00000auLB7AAM" Name: "Andy Young" Username: "a_young@dickenson.com"
                
                var myJSON = JSON.stringify(storeResponse)
                console.log('myJSON response is '+myJSON);
                alert(' doinit myJSON'+myJSON);
                // set current user information on userInfo attribute
                component.set("v.userInfo", storeResponse);
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
                component.set("v.id_of_cont", frmsrver);
                //debugger;
            }
        });
         $A.enqueueAction(action);
    },
    
    onFormSubmit:function(component, event, helper) {
        
        console.log(component.get("v.id_of_cont"));
        
        var AccId = component.get("v.id_of_cont");
        console.log("Search button pressed at line 54"+AccId);
        
        /*
        var formSubmit = component.getEvent("formsubmit");
        console.log("formData at line 56" + formSubmit);
        formSubmit.setParams({"formData" : AccId
        });
        console.log("formData at line 58" + formSubmit);
        
        formSubmit.fire();
      
      
      */
     },
    //var accid = component.get("v.id_of_cont");
   fireComponentEvent : function(component, event, helper) {
       			console.log('firecomponent event fired');
                var name=component.get('v.id_of_cont');
                console.log(name);
                var evt=$A.get("e.c:secondEvent");
                evt.setParams({"accName":name});
                evt.fire();
     		  console.log('event fired');
            },
   
    
    ddd : function (component, event, helper) {
         console.log('key Check event clicked');
    }
    
    
})