({
    doinit:function(component,event,helper)
    {
        var action=component.get("c.getacc");
        var firstname=component.get("v.firstName");
        console.log('firstname is'+firstname);
        action.setParams({firstName : component.get("v.firstName")});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS')
            {
                console.log("executed");
                var res=response.getReturnValue();
                console.log(res);
                component.set("v.acc",res);
            }
        });
        $A.enqueueAction(action);
    }
    
})