({
	invoke : function(component, event, helper) {
		 var CarSelected=event.getParam("recordId");
        console.log('value of car is '+CarSelected);
        component.set("v.id",CarSelected.Id);
        component.find("service").reloadRecord() ;
	}
})