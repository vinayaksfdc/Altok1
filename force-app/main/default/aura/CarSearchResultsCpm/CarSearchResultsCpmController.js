({
	doInit: function(component, event, helper) {
 		
            
    		
        },
    doSearch:function(component, event, helper) {
       var params = event.getParam('arguments');
      
        helper.onSearch(component,event);
        
    },
    search: function(component, event, helper){
      
        var params = event.getParam('arguments');
        console.log('entered this step');
        console.log('params value'+params);
        console.log('formData value'+params.formData);
        
        component.set("v.carTypeId1", params.formData);
		        
        helper.onSearch(component,event);
        console.log('entred line 22');
        return "search complete.";
    },
    onCarSelect: function(component, event, helper){
        
        var carId = event.getParam("carId");
        component.set("v.selectedcarId", carId);
       
    }
})