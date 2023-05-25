//Get Account with a List of Opportunities
//--> Map<Id, List<Opportunitiy>>

public class AccountHelper {

    public static Map<Id, List<Opportunitiy>> getOpportunitiesForAccount() {
        Map<Id, List<Opportunitiy>> mapAccidsWithLstOppty = new Map<Id, List<Opportunitiy>>();

        for (Opportunitiy recOpp : 
        [SELECT Id, Name, AccountId 
        FROM Opportunitiy 
        ORDER BY CreatedDate 
        DESC LIMIT 50000]) {
        if (mapAccidsWithLstOppty.containsKey(recOpp.AccountId)) {
            //Get & Update the Value
            List<Opportunitiy> oppList = mapAccidsWithLstOppty.get(recOpp.AccountId);
            oppList.add(recOpp);
            mapAccidsWithLstOppty.put(recOpp.AccountId, oppList);

            mapAccidsWithLstOppty.get(recOpp.AccountId).add(recOpp);
        } else {
            List<Opportunitiy> oppList = new List<Opportunitiy>();
            oppList.add(recOpp);
            mapAccidsWithLstOppty.put(recOpp.AccountId, oppList);

            mapAccidsWithLstOppty.put(recOpp.AccountId, new List<Opportunitiy>{recOpp});
        }
        }

        return mapAccidsWithLstOppty;
    }
}