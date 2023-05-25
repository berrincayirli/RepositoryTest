OpportunityBatch x1 = new OpportunityBatch();
id batchid = Database.executeBatch(x1,5);
System.debug(batchid);

