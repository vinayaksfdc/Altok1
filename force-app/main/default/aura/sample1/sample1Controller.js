({
	click : function(component, event, helper) {
        var a=component.get("v.a1");
        var b=component.get("v.b1");
		console.log(a,' ',b);
        var c=parseInt(a) + parseInt(b);
        console.log(c);
        component.set("v.c1",c);
	}
})