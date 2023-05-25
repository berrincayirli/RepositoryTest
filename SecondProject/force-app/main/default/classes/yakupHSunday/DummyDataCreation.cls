public class DummyDataCreation {

   
/*Write methods in the DummyDataCreation for each of the following requirements:
1. Write a logic to create N number of Accounts, and return all the accounts created.
Populate - Account Name, Rating, Phone, Shipping Address, and Billing Address.
Example - parameter -> 5. Method returns 5 newly created accounts.
a. Call this method from anonymous apex file*/

public static list<account> acclist(integer n){
    list<account> listAcc = new list<account>();
  for (Integer i = 1; i <= n; i++) {

    Account acc = new account();
    acc.Name = 'Test '+i;
    acc.Rating = 'Hot';
    acc.phone = '4567890';
    acc.ShippingCity='Cairo';
    acc.BillingCity='Turkey';
    listAcc.add(acc);
    
  }
  insert listAcc;
  return listAcc;
   
}

/*2. Write a logic to create N number of Contacts for each account (pass List of account in
parameter), and return all Contacts created.
Populate - contact first name, last name, accountid, phone, mailing address, other address.
Example - parameters - (3, listAcc). Method creates 3 contacts for each account passed in list.
a. Call this method from anonymous file, pass the list of account returned from (1.a)*/
  public static void ContList(list<account> listOfAccounts, integer n){
    list<contact> listOfContacts = new list<contact>();

    for(account item: listOfAccounts){
        for (Integer i = 1; i <= n; i++) {

         contact cnt = new contact();
         cnt.FirstName = 'Ziynet' + i;
         cnt.lastName = 'Akca' + i;
         cnt.phone ='34567890';
         cnt.MailingCity= 'Cairo';
         cnt.OtherCity='Turkey';
         cnt.AccountId = item.Id;
         listOfContacts.add(cnt);      
        }
    } 
    insert listOfContacts;

  }

/*3. Write a logic to create CASE for each contact (pass list of contact in parameter)
populate fields - contact, account, subject, stage, case origin.
Example - parameter - (listcontact). Method created case for each contact, and return all the
cases.
a. Call this method from anonymous file, pass the list of contacts returned from (2.a)*/
 public static void caselist(list<contact> listOfContacts){
    list<case> listOfCase = new list<case>();
    for(contact item: listOfContacts){
         case caseNew = new case();
         caseNew.ContactId = item.Id;
         caseNew.AccountId = item.AccountId;
         caseNew.Subject='working';
         caseNew.Origin='web';
         listOfCase.add(caseNew);
        
    }
    insert listOfCase;

 }

}