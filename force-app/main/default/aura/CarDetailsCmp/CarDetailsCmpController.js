({
    init: function(component, event, helper) {
        component.set("v.enableFullDetails", $A.get("e.force:navigateToSObject"));
    },
	onCarSelected : function(component, event, helper) {
        var CarSelected=event.getParam("car");
        console.log('value of car is '+CarSelected);
        component.set("v.id",CarSelected.Id);
        component.find("service").reloadRecord() ;
		
	},
   
})