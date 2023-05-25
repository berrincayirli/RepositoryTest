trigger caseTrigger on Case (before insert, before update, after insert, after update) {
    
    if (trigger.isBefore && trigger.isUpdate) {
        CaseTriggerHandler.showMessage(trigger.new, trigger.oldmap);
    }
    if (trigger.isBefore && trigger.isInsert) {
        CaseTriggerHandler.setStatusAndPriority(trigger.new);
    }
    if(Trigger.isInsert&&Trigger.isAfter){
        CaseTriggerHandler.createCase(Trigger.new);
    }
    

    // System.debug('We are in the triggers');
// if(trigger.isAfter){
//     System.debug('We are in the after triggers');
// }
// if(trigger.isBefore){
//     System.debug('We are in the before triggers');
// }
// if(trigger.isUpdate && trigger.isBefore){
//     System.debug('We are in the before-Update triggers');
// }
// if(trigger.isBefore && trigger.isInsert){
//     System.debug('We are in the before-Insert triggers');
// }
// if(trigger.isAfter && trigger.isUpdate){
//     System.debug('We are in the after-Update triggers');
// }
// if(trigger.isAfter && trigger.isInsert){
//     System.debug('We are in the after-Insert triggers');
// }

}