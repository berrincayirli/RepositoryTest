public class ErrorlogHandler {
    public static void createErrorlog(String className, String ProcessName, String details) {
        Error_Log__c newError = new Error_Log__c();
        newError.ApexClass__c = className;
        newError.Log_Details__c = details;
        newError.Process_Name__c = ProcessName;
        newError.Log_Date_Time__c = Datetime.now();
        insert newError;

    }
}