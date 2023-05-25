public class CaseTriggerHandler {
    public static void showMessage(List<Case> newList, Map<id, case> oldMap) {
        for (case item : newList) {
            if (item.origin != oldMap.get(item.id).origin) {
                System.debug('Case origin is changed for ' + item.CaseNumber);
            }
        }
    }
    public static void setStatusAndPriority(List<Case> newList) {
        //set status as new and Priority as Medium
        for (case item : newList) {
            if (item.origin == 'Email') {
                item.status = 'New';
                item.priority = 'Medium';
            }
        }
    }
    public static void createCase(List<Case> caseTriggerNew){
        List<Case> baseCase = new List<Case>();
        for (case cs : caseTriggerNew) {
            if (cs.description != null) {
                System.debug('cs.description1 => ' + cs.description);
                String lowerPass = cs.description.toLowerCase();
                System.debug('cs.description2 => ' + lowerPass);
                if (lowerPass.contains('password')) {
                    baseCase.add(cs);
                }
            }
        }
        //System.debug('baseCase List => ' + baseCase);
        list<Case> caseList = new list<Case>();
        for (case eachCase : baseCase) {
                case cs = new case();
                cs.Subject= eachCase.Subject + ' Parent Case may contain secret info, do something NOW';
                cs.ParentId=eachCase.Id;
                cs.Priority='High';
                cs.Description='Secret info not allowed in case';
                caseList.add(cs);
        }
        insert caseList;
    }
}
