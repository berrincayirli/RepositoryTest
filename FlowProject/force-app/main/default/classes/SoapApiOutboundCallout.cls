/**
 * SOAP (Simple Object Access Protocol) - Earlier framework of doing Web Communication/Integration, Secure way of data transfering, XML Messaging Format only
 * Outbound Callout using SOAP Api - 4 Steps of Implementation
 * Step 1: Create Remote Site Setting - to whitelist Domain
 * Step 2: WSDL (Web Service Description Language) - Get WSDL from External System
 *  a. Endpoint Url, Features available, Input parameters (Request), Reponse - XML format
 * Step 3: Convert WSDL to Apex Class using Salesforce framework
 *  a. Useful information to extract from APex Class -
 *      i. Identify Inner Class - ImplementationPort
 *      ii. Endpoint
 *      iii. Features available - (Methods/Functiones defined in Inner Class)
 *      iv. Utilise any Feature - Understand Datatype for Input Paramets and Output Parameters
 * Step 4: Use/Consume/Invoke the Soap Apex Class to make callout
 */
public with sharing class SoapApiOutboundCallout {

    /**
     * SOap API Callout to Calcultor Heroku APpp to do multiplication
     */
    public static Double makeMultiplication(){
        // Create Instance of INNER CLASS of WSDL APex
        // All features of SOAP are non-static methods
        CalculatorSOAPApex.CalculatorImplPort calc = new CalculatorSOAPApex.CalculatorImplPort();
        // Preparing Request parameters
        Double num1 = 8.0;
        Double num2 = 2.0;
        // Sending SOAP Api callout to Calcultor Heroku App
        // Fetching Response
        Double result = calc.doMultiply(num1, num2);
        System.debug('Calculator Request Parameters for Multiply Feature is : '+ num1 + ' * ' + num2);
        System.debug('Calculator Response for Multiply Feature is : '+ result);
        return result;
    }


    /**
     * SOAP API Callout to Park Heroku APp to get list of Park names based on Country
     */
    public static List<String> makeParkCallout(){
        ParksSOAPApex.ParksImplPort park = new ParksSOAPApex.ParksImplPort();
        String inputCountry = 'India';
        List<String> parkNames = park.byCountry(inputCountry);
        System.debug('Park SOAP API Response for Country-wise Feature is : '+ parkNames);
        return parkNames;
    }

}