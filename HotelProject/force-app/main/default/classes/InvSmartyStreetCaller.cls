public class InvSmartyStreetCaller {

    @InvocableMethod(label='SmartyStreetAPI' description='Makes an HTTP GET to Smarty.com' category='Location__c')
    public static void getAccountNames(List<Id> locationIds) {
        makeCallout(locationIds[0]);

    }
 
    @future(callout=true)
    private static void makeCallout(Id locId) {

        try {
            Location__c location = [select City__c,Posta_Code__c, State__c,Street__c FROM Location__c WHERE Id =: locId];

            SmartyStreetCreds__c setting = SmartyStreetCreds__c.getOrgDefaults();
            String path ='/street-address'
            +'?auth-id=' + setting.Auth_Id__c
            +'&auth-token=' + setting.Auth_Token__c
            +'&street=' + EncodingUtil.urlEncode(location.Street__c, 'UTF-8') 
            +'&city=' + EncodingUtil.urlEncode(location.City__c, 'UTF-8')  
            +'&state=' + EncodingUtil.urlEncode(location.State__c, 'UTF-8') 
            +'&zipcode=' + location.Posta_Code__c  
            +'&match=enhanced';

            System.debug('path:' + path);

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            request.setEndpoint('callout:SmartStreetAPI'+ path);
            Request.setMethod('GET');
            HttpResponse response = http.send(request);

            Integer StatusCode = response.getStatusCode();
            System.debug('status Code ' + StatusCode);

            String respBody =response.getBody();
            System.debug('response Body '+ respBody);

            update new Location__c(Id = locId, Verified__c = statusCode==200);

        } catch (Exception exc) {
                String msg = exc.getMessage() + ' (line:' + exc.getLineNumber();
                System.debug('EXC:' + msg);
                ErrorLogHandler.createErrorLog('InvSmartyStreetCaller', 'makeCallout', msg);
                }
    }
}