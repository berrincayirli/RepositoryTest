import { LightningElement, wire} from 'lwc';
import fetchTopContributors from '@salesforce/apex/ManageDonation.fetchTopContributors';

export default class TopThreeDonation extends LightningElement {

    donations;
    errors;

    connectedCallback() {

        fetchTopContributors()
        .then((data) => {
            
            data.forEach(record => {
                //record.Name = record.Anonymous__c ? "Anonymous" : record.Name;
                if (record.Anonymous__c) {
                    record.Name = "Anonymous !!";
                }
                record.Total_Donation__c = record.Total_Donation__c.toLocaleString('en-US', {style: 'currency', currency: 'USD'});
            });
            
            console.log('result => ' , data);
            this.donations = data;
            this.errors = undefined;
        })
        .catch((err)=> {
            this.donations = undefined;
            this.errors = err;
        })
    }
}