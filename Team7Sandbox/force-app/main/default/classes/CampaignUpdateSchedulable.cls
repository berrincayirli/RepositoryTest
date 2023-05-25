public class CampaignUpdateSchedulable implements Schedulable {
	
    public void execute(SchedulableContext sc){
        CampaignUpdateBatch cmp = new CampaignUpdateBatch();
        Database.executeBatch(cmp,50);
    }
}