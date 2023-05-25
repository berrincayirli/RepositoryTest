public with sharing class RestCallouts11 {
    public static void getUser(){
        //1
        HttpRequest Request = new HttpRequest();
        Request.setEndpoint('https://reqres.in/api/users/3');
        Request.setMethod('GET');

        //2
        Http http = new Http();
        HttpResponse response = http.send(request);

        //3
        if(response.getStatusCode() == 200) {
            System.debug(response.getBody());
            string jsonUser = response.getBody();
            Map<String,Object> userValue = (Map<String,Object>)JSON.deserializeUntyped(jsonUser);
            System.debug('veri => ' + userValue);
            System.debug('data => ' + userValue.get('data'));
            System.debug('support => ' + userValue.get('support'));
        }
    }
}