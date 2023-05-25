/**
 * Implementation of Unit Test Class for SOAP API Outbound Callouts
 * Step I : To Create a new Mock Response - Apex Class which will implement WebServiceMock
 * Step II: Inside Mock Response class we will be implementing doInvoke method with bunch of predefined Method parameters
 * Step III: Initialise Response Class of SOAP Utility/Serrvice Class
 * Step IV: Pass Dummy/Fake Response values
 * Step V: Assosiate Mock Response to our Unit Test method
 * Step VI: Invoking SOAP Callout
 * Step VII: System Assertion
 */
@IsTest
public with sharing class SoapApiOutboundCallout_Test {

    @IsTest
    public static void makeCalculatorCalloutSuccessTest(){
        // Assosiation of Mock response to our Unit Test method
        Test.setMock(WebServiceMock.class, new SoapApiOutboundCalloutCalculatorMock());
        // Inovke Soap Api Callout scenario
        Test.startTest();
        Double result = SoapApiOutboundCallout.makeMultiplication();
        Test.stopTest();
        // System Assetion
        System.assertEquals(30.0, result, 'Mock Response returned should be matching');
    }

    @IsTest
    public static void makeParkCalloutSuccessTest(){
        // Assosiation of Mock response to our Unit Test method
        Test.setMock(WebServiceMock.class, new SoapApiOutboundCalloutParkMock());
        // Inovke Soap Api Callout scenario
        Test.startTest();
        List<String> parks = SoapApiOutboundCallout.makeParkCallout();
        Test.stopTest();
        // System Assertion
        System.assertEquals(3, parks.size(), 'We should be expecting 3 park dummy results from Mock Response');
        List<String> expectResult = new List<String>{'Park1','Park2','Park3'};
        System.assertEquals(expectResult, parks, 'We should be expecting 3 park dummy results from Mock Response');
    }
}