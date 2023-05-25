public class FutureExample11 {
    //Account objecti'nin description field'inde bir update işlemi yapıldığında o account'a bağlı opportunity ve contact'ların description field'lerini account description ile aynı olacak şekilde update eden bir "future method" tasarlayınız.
    public static void updateDescriptionHelper(List<Account> accTriggerNew, Map<Id,Account> accTriggerOldMap) {
      Set<Id> accIds = new Set<Id>();
      for (account acc : accTriggerNew) {
        if (acc.Description != accTriggerOldMap.get(acc.id).Description) {
            accIds.add(acc.id);
        }
      }
       if (!accIds.isEmpty()) {
        //updateDescription(accIds);
        updateDescription2(accIds);
       } 
    }

    /*@future
    public static void updateDescription(Set<Id> idList) {
        //Bu accountlara bagli tum contact ve opportunityleri alip descriptionlarini update etmem lazim. Accountun descriptionini contact ve opportunitylerin descriptionlarina koyariz..
        List<Account> accList = [select id, description, (select id, description from contacts), (select id, description from Opportunities) from account where id IN :idList];

        List<Contact> conList = new List<Contact>();
        List<Opportunity> oppList = new List<Opportunity>();
        for (Account ac : acclist) {           
            for (contact c : ac.Contacts) {
                c.Description = ac.Description;
                conList.add(c);
            }
            for (opportunity op : ac.Opportunities) {
                op.Description = ac.Description;
                oppList.add(op);
            }
        }
        update conList;
        update oppList;
    }*/

    @future
    public static void updateDescription2(Set<Id> idList) {
        List<Contact> conList = [select id, accountId, description, account.description from Contact where AccountId IN :idList];
        for (contact c : conList) {
            c.Description = c.Account.Description;
        }
        update conList;

        List<Opportunity> oppList = [select id, description, account.description from Opportunity where AccountId IN  :idList];
        for (opportunity op : oppList) {
            op.Description = op.Account.Description;
        }
        update oppList;
    }
}
