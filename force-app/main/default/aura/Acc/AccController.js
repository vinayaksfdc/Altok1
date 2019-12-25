({
fetchContacts : function(component, event, helper) {
        // Assign server method to action variable
        var action = component.get("c.getAcc");
        // Getting the account id from page
        var accountId = component.get("v.recordId");
        // Setting parameters for server method
        action.setParams({
            accid: accountId
        });
        // Callback function to get the response
        action.setCallback(this, function(response) {
            // Getting the response state
            var state = response.getState();
            // Check if response state is success
            if(state === 'SUCCESS') {
                // Getting the list of contacts from response and storing in js variable
                var AccDetails = response.getReturnValue();
                component.set("v.acc",AccDetails);
                var myJSON = JSON.stringify(AccDetails);

                console.log('abc val is'+myJSON);
                alert(myJSON);
                // Set the list attribute in component with the value returned by function
               
            }
            else {
                // Show an alert if the state is incomplete or error
                alert('Error in getting data');
            }
        });
        // Adding the action variable to the global action queue
        $A.enqueueAction(action);
        }    
})