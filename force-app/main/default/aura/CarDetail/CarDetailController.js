({
    init: function(component, event, helper) {
        console.log(2);
        component.set("v.enableFullDetails", $A.get("e.force:navigateToSObject"));
    },
	onCarSelected : function(component, event, helper) {
        var CarSelected=event.getParam("car");
        console.log('CarSelected=event.getParam("car") is'+CarSelected);
        console.log('value of car is '+CarSelected);
        component.set("v.id",CarSelected.Id);
        component.find("service").reloadRecord() ;
		
	},
   
})