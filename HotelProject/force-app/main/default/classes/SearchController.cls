public with sharing class SearchController {
    
    @AuraEnabled(cacheable=true)
    public static String searchRecords(String objName, String fieldName, String searchKey) {
        String searchKeyword = searchKey + '*';
        String returningQuery = objName + ' ( Id, ' + fieldName + ')';

        String query = 'FIND :searchKeyword IN ALL FIELDS RETURNING ' + returningQuery + ' LIMIT 2000';
        // FIND {test} IN ALL FIELDS RETURNING Contact (Id, FirstName, LastName, Email), Lead (Id, Name, Company, Email), Account (Id, Name, Industry) LIMIT 5


        List<List<SObject>> records = Search.query(query);
        System.debug(records);
        return JSON.serialize(records);


    }
}