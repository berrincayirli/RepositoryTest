@isTest
public with sharing class UserTriggerHelperTest {
    
    @TestSetup
    static void makeData(){
        Account acc = TestDataFactory.createAccount('Test Account');
        insert acc;

        Contact cont = TestDataFactory.createContact('contFName', 'contLName', 'contFNamecontLName@test.com', acc.Id);
        insert cont;
    }

    @isTest
    private static void syncAddressOnPartnerUserCreation() {
        Contact cont = [SELECT Id FROM Contact LIMIT 1];
        Profile prof = [SELECT Id FROM Profile WHERE Name = 'Partner Community'];

        Test.startTest();
        User partnerUser = TestDataFactory.createCommunityUser(cont.Id, prof.Id, 'userFName', 'userLName');
        Test.stopTest();

        Contact cont2 = [SELECT Id, MailingCountry FROM Contact LIMIT 1];

        //Unit Testing
        System.assertEquals(cont2.MailingCountry, partnerUser.Country);
    }

    @isTest
    private static void syncAddressOnPartnerUserUpdate() {
        Contact cont = [SELECT Id FROM Contact LIMIT 1];
        Profile prof = [SELECT Id FROM Profile WHERE Name = 'Partner Community'];
        User partnerUser = TestDataFactory.createCommunityUser(cont.Id, prof.Id, 'userFName', 'userLName');

        Test.startTest();
        partnerUser.Country = 'India';
        update partnerUser;
        Test.stopTest();

        Contact cont2 = [SELECT Id, MailingCountry FROM Contact LIMIT 1];

        //Unit Testing
        System.assertEquals(cont2.MailingCountry, partnerUser.Country);
    }
}