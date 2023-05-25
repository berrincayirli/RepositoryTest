trigger LeadTrigger on Lead (after insert) {
    
    if(trigger.isAfter && trigger.isInsert){
    list<Lead> newList = trigger.new;
        for(lead item : newList){
        if( item.leadsource == 'Web'){
        system.debug('Rating should be Cold');
        }else{
        System.debug('Rating should be hot');
        }
        }
    }
}