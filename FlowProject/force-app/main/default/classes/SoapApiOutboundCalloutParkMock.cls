@IsTest
public with sharing class SoapApiOutboundCalloutParkMock implements WebServiceMock {
    public void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType
    ){
        ParksSOAPApex.byCountryResponse response_x = new ParksSOAPApex.byCountryResponse();
        List<String> parkNames = new List<String>{'Park1','Park2','Park3'};
        response_x.return_x = parkNames;
        // response_x.return_x = new List<String>{'Park1','Park2','Park3'};

        response.put('response_x',response_x);
    }
}