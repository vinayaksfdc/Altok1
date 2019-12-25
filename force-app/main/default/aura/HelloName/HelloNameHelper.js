({
	loadData : function(component,event) {

        var action=component.get('c.getUserName');
        action.setParams({
            'filter':filter
        });
        action.setCallback(this,function(response){
            component.set('v.username',response.getReturnValue());
            
            
        });
        $A.enqueueAction(action);
	}
})