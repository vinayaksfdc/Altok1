({
 doInit: function(component, event, helper) {
  //call apex class method
  var action = component.get('c.fetchAccount');
  action.setCallback(this, function(response) {
   //store state of response
   var state = response.getState();
   if (state === "SUCCESS") {
    //set response value in ListOfAccount attribute on component.
    component.set('v.ListOfAccount', response.getReturnValue());
      var myJSON = JSON.stringify(response.getReturnValue());
       console.log('Json.stringify(response.getReturnValue())'+myJSON);
   }
  });
  $A.enqueueAction(action);
 },
})