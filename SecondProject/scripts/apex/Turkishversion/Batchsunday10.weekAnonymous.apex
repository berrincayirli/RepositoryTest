// BatchApex11 ba = new BatchApex11();
// Id jobid = Database.executeBatch(ba, 5);
// system.debug(jobid);

OpportunityBatchDelete ob = new OpportunityBatchDelete();
Database.executeBatch(ob,2);

OpportunityscheduleDelete ob = new OpportunityscheduleDelete();
System.schedule('Delete_Opp', '0 0 15 1/1 * ? *', ob);

TasksCreateBatch ts = new TasksCreateBatch();
Database.executeBatch(ts,5);

CaseQueueable ob = new CaseQueueable();
id newjobId = System.enqueueJob(ob);
System.debug(newjobId);