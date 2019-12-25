({
	doInit : function(component, event, helper) {
        var action=component.get("c.accs");
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='Success')
            {
                console.log('success');
                var val=response.getReturnValue();
                alert(json.stringify(val));
                console.log('val is'+val);
            }
        });
        $A.enqueueAction(action);
	}
})