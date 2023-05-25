public class CaseQueueable implements Queueable{
    public void execute(QueueableContext qc) {
        List<Case> caseList = new list<Case>();
        for (Integer i = 0; i < 10; i++) {
            caseList.add(new case(status = 'Closed', origin = 'Phone'));
        }
        insert caseList;
    }
}