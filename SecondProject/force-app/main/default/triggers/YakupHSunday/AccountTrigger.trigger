trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
/*   trigger AccountTrigger on Account (after insert) {
    //Account list to update after the doing changes
    List<Account> accListUpdate = new List<Account>();
    //Contacts to insert which has same name as Account Name
    List<Contact> conList = new List<Contact>();
    //Account Id list to update later after changes are done
    Set<Id> accId = new Set<Id>();
    //Map of Account Id and the Axxount record
    Map<Id,Account> mapVariable = new Map<Id,Account>();
    for(Account accObj : Trigger.new){
    //Contact which has to be inserted with same name as Account and putting that Contact as related Contact
    Contact conObj =new Contact();
    conObj.LastName = accObj.Name;
    conObj.AccountId = accObj.Id;
    conList.add(conObj);
    accId.add(conObj.AccountId);
    }
    if(conList.size()>0){
    insert conList;
    }
    //Getting list of Accounts to put into Map
    List<Account> accList =[Select Id,Client_Contact__c from Account where Id=:accId];
    if(accList.size()>0){
    for(Account acc:accList){
    mapVariable.put(acc.Id,acc);
    }
    }
    if(conList.size()>0){
    /*Looping inserted Contact and Check whether the Account Id is related and get its Account
    record from map and change the value of the Client Contact with the current looping Contact
    for(Contact cObj:conList){
    if(mapVariable.containsKey(cObj.AccountId)){
    Account aObj=mapVariable.get(cObj.AccountId);
    aObj.Client_Contact__c=cObj.Id;
    accListUpdate.add(aObj);
    }
    }
    }
    //Update the Account in which chnages has been done
    if(accListUpdate.size()>0){
    update accListUpdate;
    }
    } */
  
  if (trigger.isAfter && trigger.isInsert) {
      List<Account> newAcc = Trigger.new;
      list<Contact> newcont = new List<Contact>();
      set<Id> accId = new set<Id>();
      for (Account eachAcc : newAcc) {
        contact cont = new Contact();
        cont.AccountId= newAcc.Id;
        cont.LastName = newAcc.Name;
        newcont.add(cont);
      }
      System.debug('Hello');
      if (newcont.size()>0) {
        insert.newcont();
        accId.add(newcont.Id);
      }
      
      list<Account> accountlist = [Select Id,Client_Contact__c From Account Where Id =:accId ];
      for (Account eachacc : accountlist) {
            accountlist.Client_Contact__c= newcont.Id;
      }
      update.accountlist();
    }



  /* if (trigger.isAfter&& trigger.isInsert) {
     List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    User userObj =[Select Id, Profile.Name, Email
                    From User
                    Where Profile.Name =  'System Administrator'];
      for (Account accnew : Trigger.new) {
        if (userObj.Email != null) {
          Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
          mail.setSenderDisplayName('Berrin');
          mail.toaddresses = new String[]{userObj.Email};
          mail.setSubject('New account was created.');
          mail.setHtmlBody('Dear System Administrator <br> ' + accnew.Name + ' Cerated');
          mails.add(mail);
        }
      }
      if (mails.size()>0) {
        Messaging.SendEmailResult[] results = Messaging.sendEmail(mails);
        if (results[0].success) {
          System.debug('The mail was sent successfully');
        }else {
          System.debug('The email failed to send: ' + results[0].errors[0].message);
        }
      }
    
  } */
  
/*   if (trigger.isAfter && trigger.isUpdate) {
    set<Id> updateAcc = new set<Id>();
    for (account accupdate : trigger.new) {
          updateAcc.add(accupdate.Id);
    }
    list<opportunity> oppUpdate = [Select Id, name, StageName, AccountId, CreatedDate 
                                    From Opportunity
                                    Where StageName != 'Closed Won'
                                    and CreatedDate < LAST_N_DAYS:30
                                    and AccountId IN : updateAcc];

    for (opportunity newOpp : oppUpdate) {
      newOpp.StageName = 'Closed Lost';
    }
    update oppUpdate;
  } */
  /*if (trigger.isBefore&& trigger.isInsert) {
    List<account> accnew = trigger.new;
    for (account eachacc : accnew) {
        if (eachacc.BillingCity != null && eachacc.BillingState != null) {
          eachacc.ShippingCity= eachacc.BillingCity;
          eachacc.ShippingState= eachacc.BillingState;
        }
    }
    
  }*/
  
  
  /*if (trigger.isAfter && trigger.isUpdate) {
        //FutureExample11.UpdateDescriptionHelper(Trigger.new, Trigger.oldMap);
        FutureExample11.updateDescription2(iTrigger.new, Trigger.oldMap);
    }*/
    //System.debug('Trigger tetiklendi..');
    //1 Account create edildiğinde. ona bağlı 7 tane Contact otomatik olarak create edilsin. first name'i account name ile aynı olsun. last name i contact 1 2 3.. diye isimlendirilsin..
    // if (trigger.isAfter && trigger.isInsert) {
    //     AccountTriggerHandler.createContact(trigger.new);
    // }

     // 2. Bir account update edildiğinde name değişmişse description fieldine name değişti mesajı yazdır..
    //  if (trigger.isBefore && trigger.isUpdate) {
    //     AccountTriggerHandler.updateName(trigger.new, trigger.oldMap);

    //     /*for (account acc : trigger.new) {
    //         if (acc.name != trigger.oldMap.get(acc.id).name) {
    //             acc.Description = 'Bu recordda isim degisikligi oldu..';
    //         }
    //     }*/
    

    // if (trigger.isAfter && trigger.isInsert){
    //     AccountTriggerHandlerSunday.CreateContOpp(Trigger.new, Trigger.Old);
     
    // }


    // if (Trigger.isBefore && Trigger.isInsert) {
    //     AccountTriggerHandlerSunday.AccountTriggerHandler(Trigger.new, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    // }
    
    

     // 2. Bir account update edildiğinde name değişmişse description fieldine name değişti mesajı yazdır..
    //  if(trigger.isBefore && trigger.isUpdate){
    //     for (account acc : trigger.new) {
    //         if (acc.name != trigger.oldMap.get(acc.Id).Name) {
    //             acc.description = 'Bu recordun ismi degisti';
    //         }
    //     }
    //  }

      //2.Version

    //  if (trigger.isBefore && trigger.isUpdate){
    //     Map<id, account> newMap = trigger.newMap; 
    //     Map<id, account> newMap = trigger.oldMap;  

    //     for (account acc : trigger.new) {
    //         if (newMap.get(acc.Id).Name != oldMap.get(acc.Id.name)) {
    //             acc.description = 'Bu recordun ismi degisti';
                
    //         }
    //     }
    //  }

    //  3. Bir account update edildiğinde phone  değişmişse description fieldine phone değişti mesajı yazdır.. Name degismisse buna izin vermesin..
    //  if (trigger.isBefore && trigger.isUpdate) {
    //     for (account acc : trigger.new) {
    //         if (acc.phone != trigger.oldMap.get(acc.Id).Phone) {
    //             acc.Description = 'Bu recordun telefon numarasi degisti..';
    //         }
    //         if (acc.name != trigger.oldMap.get(acc.id).name) {
    //             acc.Name.addError('isim degisikligi yapamazsiniz..');
    //         }
    //     }
    // }


    //1 Account create edildiğinde. ona bağlı 7 tane Contact otomatik olarak create edilsin. first name'i account name ile aynı olsun. last name i contact 1 2 3.. diye isimlendirilsin..
    // if (trigger.isAfter && trigger.isInsert) {
    //     List<Contact> conList = new List<Contact>();
    //     for (account acc : trigger.new) {
    //         for (Integer i = 1; i <= 7; i++) {
    //             contact c = new contact();
    //             c.FirstName = acc.name;
    //             c.LastName = 'Contact ' + i;
    //             c.AccountId = acc.id;
    //             conList.add(c);
    //         }
    //     }


    //     insert conList;
    //  }
    
    
    // System.debug('======Trigger Tetiklendi..=========');
    // /*System.debug('Trigger isBefore => ' + trigger.isBefore);
    // System.debug('Trigger isAfter => ' + trigger.isAfter);
    // System.debug('Trigger isInsert => ' + trigger.isInsert);
    // System.debug('Trigger isUpdate => ' + trigger.isUpdate);*/
    // if(trigger.isBefore && trigger.isInsert){
    //     System.debug('Before Insert Trigger Calisti');
    //     system.debug('Trigger New => ' + trigger.new);
    //     List<Account> triggerNew = trigger.new;
    //     for(account acc : triggerNew){
    //         System.debug('Name = ' + acc.name);
    //         System.debug('Id = ' + acc.Id);
    //     }
    // }
    // if(trigger.isAfter && trigger.isInsert){
    //     System.debug('After Insert Trigger Calisti');
    //     system.debug('Trigger New => ' + trigger.new);
    //     for(account acc : trigger.new){
    //         System.debug('Name = ' + acc.name);
    //         System.debug('Id = ' + acc.Id);
    //     }
    // }
    // if(trigger.isBefore && trigger.isUpdate){
    //     System.debug('Before Update Trigger Calisti');
    //     system.debug('Trigger New => ' + trigger.new);
    //     for(account acc : trigger.new){
    //         System.debug('Name = ' + acc.name);
    //         System.debug('Id = ' + acc.Id);
    //     }
    // }
    // if(trigger.isAfter && trigger.isUpdate){
    //     System.debug('After Update Trigger Calisti');
    //     system.debug('Trigger New => ' + trigger.new);for(account acc : trigger.new){
    //         System.debug('Name = ' + acc.name);
    //         System.debug('Id = ' + acc.Id);
    //     }
    // }
    // System.debug('======Trigger Bitti..=========');
}
  

