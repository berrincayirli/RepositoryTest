    //Soru : Yeni bir Contact mevcut bir Accounta bağlı olarak oluşturulduğunda Contact other phone bağlı olduğu Account phone olsun.
public class ContactTriggerHandler11 {
    public static void otherPhoneOfContact(List<Contact> trgNew, Map<Id,Contact> trgNewMap) {
         //insert edilen tum contactlardan accounta bagli olanlari secelim..
         set<id> conIds = new set<id>();
         for (contact con : trgNew) {
             if (con.AccountId != null) {
                 conIds.add(con.id);
             }
         }
         //Accounta bagli olan tum Contactlari accountun(parent) phone ile beraber SOQL yapiyoruz..
         List<Contact> conList = [select id, otherPhone, account.phone from Contact where id IN :conIds];
 
         //Bu listeyi bir for each dongusunun icine alip otherPhone guncellemesini yapalim..
         for (Contact cn : conList) {
             cn.OtherPhone = cn.account.phone;
         }
         update conList;
    }
    //2. yol:
    public static void otherPhoneOfContact2(List<Contact> triggerNew, Map<Id, Contact> triggerNewMap) {
     //Account idlerin key oldugu ilgili accountun recordunun da value oldugu bir map olusturup. contactlarin bagli oldugu accountlarin recordlarini burada toplarim..
     Map<Id, Account> AccMap = new Map<Id, Account>();
     set<id> accIds = new Set<id>();
     List<Contact> conList = new List<Contact>();
     for (contact con : triggerNew) {
         if (con.AccountId != null) {
             accIds.add(con.AccountId);
             //accounta bagli contactlari bir listeye koyduk
             conList.add(con);
         }
     }
     //SOQL ile bu accountlarin recordlarini getirelim..
     List<Account> accList = [select id, name, phone from account where id IN :accIds];
 
     //Mapi dolduruyoruz..
     for (account acc : accList) {
         AccMap.put(acc.id, acc);
     }
 
     //Accounta bagli olan create edilmis contaclari for dongusune alip otherPhone guncelliyoruz..
     for (contact con : conList) {
         con.OtherPhone = AccMap.get(con.accountId).phone;
     }
     
     
 
    }
 




// public class ContactTriggerHandler {
//     public static void setOtherPhone(List<Contact> newList, Map<id, Contact> newMap) {
//         set<id> ids = newMap.keySet();
//         List<Contact> conList = [select id, OtherPhone, Accountid, Account.phone from contact where id IN :ids ];
//         for (contact item : conList) {
//             if (item.Accountid != null) {
//                     item.OtherPhone = item.account.phone;
//                 }
//             }
//         update conList;
//     }
// }

// 25 december assignment;

// PART 3 –
// 1. Create one new field in the contact object 'Main Contact Person' (checkbox).
// When 'Main Contact Person' is changed to Checked in contact → Update its account's FAX field
// as that contact's FAX Field.
// - Example:
// Account → Name = AccQnC, Fax = 999888777
// Contacts → Name = QnC1 , Main Contact Person = false, Fax = 111222333
// Contacts → Name = QnC2 , Main Contact Person = false, Fax = 111222444
// Contacts → Name = QnC3 , Main Contact Person = false, Fax = 111222555
// Contacts → Name = QnC6 , Main Contact Person = false, Fax = 111222666
// Update QnC6 contact → Main contact person = true
// → Auto update account's FAX to 111222666 (QnC6’s fax value)
// 2. Write the Test class for the triggers and trigger handlers written for the above logic.   //^^ Contact üzerindeki ////Main_Contact_Person__c field'ı false dan true ya döndüğünde contact ın fax bilgisini account un fax ına yazmasını istiyoruz.
//     //* Main_Contact_Person__c
    public static void contactPersonCheckbox(List<Contact> newList, Map<id, Contact> oldMap) {
        
        Set<id> accIds = new Set<id>();
        //*burada false dan true ya dönen contact ların AccountId lerini topladık.
        for (contact c : newList) {
            if (c.AccountId != null) {
                if (c.Main_Contact_Person__c != oldMap.get(c.id).Main_Contact_Person__c && c.Main_Contact_Person__c) {
                    accIds.add(c.AccountId);
                }
            }
        }
        
        List<Account> accList = [select id,name,fax, (select id,lastname,fax,Main_Contact_Person__c from Contacts where Main_Contact_Person__c=true order by lastmodifieddate desc limit 1) from Account where id in : accIds];


        for (account acc : accList) {
            for (contact cnt : acc.contacts) {
                acc.fax = cnt.fax;
            }
            //acc.fax = acc.Contacts[0].fax;
        }
        update accList;
    }


}
