public class OpportunityTriggerHandler {
    /*Create some custom fields a. 'Target Amount'
 - Field Type: Currency - Field Type: Currency - Field Type: Text
 b. 'Total Amount Generated'
 c. 'Highest Amount Opportunity Name'
 d. 'Target Amount Achieved Opportunity Name' - Field Type: Text
 on Account Object.
 Create future methods which takes in the set of Account Ids and do the following tasks:
 A. Update the "Highest Amount Opportunity Name" field at Account level with the opportunity Name which have the Highest amount among the opportunities related to the account.
 B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the Closed Won Opportunity Name. Populate the opportunity name which have highest value in Amount field, and it should be more than 'Target Amount' field value at account.
 C. Update the 'Total Amount Generated' at Account with the total of Amount for all the closed Won Opportunities related to an Account.
 Please Note: Above updates should happen whenever any of the following event occurs:
 i. Amount field is Updated at Opportunity level.
 ii. Opportunity stageName is changed.
 iii. Opportunity is reparented i.e AccountId field value is changed.
 iv. A new Opportunity is created and tagged to an account.
 v. An Opportunity is deleted or undeleted*/
 @future
 public static void UpdateHAON(Set<Id> accIds) {
     list<account> accList = [select id, name, Highest_Amount_Opportunity_Name__c, (select id, name, amount from opportunities where amount != null order by amount desc limit 1) from account where id IN: accIds];
     for (account eachAcc : accList) {
         eachAcc.Highest_Amount_Opportunity_Name__c = eachAcc.Opportunities[0].name;
     }
     update accList;
 }
 @future
 public static void UpdateTAAON(set<Id> IDAcc) {
     List<Account> TAAONAccList = [select id, name, Target_Amount_Achieved_Opportunity_Name__c, Target_Amount__c, (select id, name, amount, StageName from opportunities where stagename = 'Closed Won' and amount != null order by amount desc limit 1) from account where id in: IDAcc];
     for (account eachAcc : TAAONAccList) {
         if (eachAcc.Target_Amount__c<eachAcc.Opportunities[0].Amount) {
             eachAcc.Target_Amount_Achieved_Opportunity_Name__c = eachAcc.Opportunities[0].name;
         }else{
             eachAcc.Target_Amount_Achieved_Opportunity_Name__c = null;
         }
     }
     update TAAONAccList;
 }
 @future
 public static void UpdateTAG(Set<Id> accIds) {
     List<Account> TAGAccList = [select id, name, Total_Amount_Generated__c, (SELECT id, name, amount, stagename FROM opportunities where stagename = 'Closed Won' and amount!=NULL) from account];
     for (account eachAcc : TAGAccList) {
         decimal sum = 0;
         for (Opportunity eachOpp : eachAcc.opportunities) {
             sum+=eachOpp.Amount;
         }
         eachAcc.Total_Amount_Generated__c = sum;
     }
     update TAGAccList;
 }
 }
