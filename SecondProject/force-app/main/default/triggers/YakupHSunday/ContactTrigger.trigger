trigger ContactTrigger on Contact (before insert, before update, after insert, after update ) {
   // çarsamba alışrırması
    // trigger ContactTrigger on Contact (after insert) {
    //     if (trigger.isAfter && trigger.isInsert) {
    //         ContactTriggerHandler.setOtherPhone(trigger.new, trigger.newMap);
    //     }
    // }
   
   
    if (trigger.isBefore && trigger.isInsert) {
        System.debug('Before Insert Trigger Tetiklendi..');
        System.debug('Trigger New = ' + trigger.new);
        System.debug('Trigger OLd = ' + trigger.old);
        System.debug('Trigger NewMap = ' + trigger.newMap);
        System.debug('Trigger OldMap = ' + trigger.oldMap);
        System.debug('========END===============');
    }
    if (trigger.isAfter && trigger.isInsert) {
        System.debug('After Insert Trigger Tetiklendi..');
        System.debug('Trigger New = ' + trigger.new);
        System.debug('Trigger OLd = ' + trigger.old);
        System.debug('Trigger NewMap = ' + trigger.newMap);
        System.debug('Trigger OldMap = ' + trigger.oldMap);
        System.debug('========END===============');
    }
    if (trigger.isBefore && trigger.isUpdate) {
        System.debug('Before Update Trigger Tetiklendi..');
        System.debug('Trigger New = ' + trigger.new);
        System.debug('Trigger OLd = ' + trigger.old);
        System.debug('Trigger NewMap = ' + trigger.newMap);
        System.debug('Trigger OldMap = ' + trigger.oldMap);
        System.debug('========END===============');
    }
    if (trigger.isAfter && trigger.isUpdate) {
        System.debug('After Update Trigger Tetiklendi..');
        System.debug('Trigger New = ' + trigger.new);
        System.debug('Trigger OLd = ' + trigger.old);
        System.debug('Trigger NewMap = ' + trigger.newMap);
        System.debug('Trigger OldMap = ' + trigger.oldMap);
        System.debug('========END===============');
    }
}



// trigger contactTrigger on contact (before insert, after insert) {
// // 3. Whenever Contact is created with ‘Account’ then print ‘[Contact Name] contact created WITH Account’. If contact is created without ‘Account’ then print ‘[Contact Name] contact create WITHOUT Account’
// // examples:
// // Sachin contact created with Account.
// // Jake contact created WITHOUT Account
// if (trigger.isAfter && trigger.isInsert) {
//    list<contact> newcont = trigger.new;
//    for (contact item : newcont) {
//       if(item.accountId != Null){
//        system.debug(item.LastName + ' contact created WITH Account');
//    } else {
//        System.debug(item.LastName + ' contact create WITHOUT Account');
//    }
//  }
// }
// }