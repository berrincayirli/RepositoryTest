trigger ContactTrigger on Contact(before insert, before update, after insert, after update) {
    if (trigger.isAfter && trigger.isUpdate) {
        ContactTriggerHandler.checkMainPerson(trigger.new);
    }
    }