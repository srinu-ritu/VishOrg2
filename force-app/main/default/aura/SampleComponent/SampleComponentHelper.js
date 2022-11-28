({
    getResponse: function(component, base) {
        // create a server side action.       
        var action = component.get("c.getCalloutResponseContents");
        // set the url parameter for getCalloutResponseContents method (to use as endPoint) 
        action.setParams({
            "url": 'http://http://data.fixer.io/api/latest?access_key=daf48b0d691fc5cfdbe1d625363160a4'
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                // set the response(return Map<String,object>) to response attribute.      
                component.set("v.response", response.getReturnValue());
 
                // get the all rates from map by using key              
                var getAllRates = component.get("v.response")['rates'];
                var CurrencyList = [];
                // play a loop on rates object 
                for (var key in getAllRates) {
                    // push all rates with there Name in CurrencyList variable.        
                    CurrencyList.push(key + ' = ' + getAllRates[key]); // i.e : INR = 67.919  
                }
                // set the CurrencyList to ListOfCurrency attribute on component.           
                component.set("v.ListOfCurrency", CurrencyList);
            }
        });
 
        $A.enqueueAction(action);
    },
})