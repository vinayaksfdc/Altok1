({
    invoke : function(component, event, helper) {
        var acc=event.getParam("accName");
        console.log('acc from std_account');	
        component.set("v.val1",acc);
    },
    
})