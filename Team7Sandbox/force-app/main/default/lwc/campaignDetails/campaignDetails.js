import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Campaign.Name';
import TARGET_FIELD from '@salesforce/schema/Campaign.Target_Donation_Amount__c';
import ACHIEVED_FIELD from '@salesforce/schema/Campaign.Achieved_Donation_Amount__c';
import REMAINIG_FIELD from '@salesforce/schema/Campaign.Remaining_Donation_Amount__c';
import ENDDATE_FIELD from '@salesforce/schema/Campaign.EndDate';

const FIELDS = [NAME_FIELD, TARGET_FIELD, ACHIEVED_FIELD, REMAINIG_FIELD, ENDDATE_FIELD];

export default class CampaignDetails extends LightningElement {

    @api recordId;
    @api objectApiName;
    fields = FIELDS;

    
}