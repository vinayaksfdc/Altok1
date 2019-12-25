({
    
    onFormSubmit: function(component, event, helper){
        console.log(3);
        console.log("event received by CarSearchController.js");
        var formData = event.getParam("formData");
        var CarTypeId = formData.formData;
        
        console.log("formData extracted: "+formData);
        
        var CSRcmp = component.find("CSRcmp");
        var auraMethodResult = CSRcmp.search(formData);
        console.log("auraMethodResult: " + auraMethodResult);
        
        //helper.onSearch(component,event);
    },
    
    search: function(component, event, helper){
        console.log("CSRController: search called");
        var params = event.getParam('arguments');
        console.log("CarTypeId extracted: " + params.CarTypeId);
        component.set("v.CarTypeId", params.CarTypeId);
        helper.onSearch(component,event);
        return "search complete.";
    }
    
})