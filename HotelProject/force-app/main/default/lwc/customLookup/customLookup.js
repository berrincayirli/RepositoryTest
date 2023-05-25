import searchRecords from '@salesforce/apex/SearchController.searchRecords';
import { api, LightningElement, track } from 'lwc';

export default class CustomLookup extends LightningElement {

    @api objectName = 'Booking__c';
    @api fieldName = 'Name';
    @api label = 'Booking';
    @api parentIdField  = 'Booking__c';
    @api iconName = 'standard:record';

    // private property
    // c aramadan 
    @track records;
    @track selectedRecord;

    handleSearch(event){
        var searchVal = event.detail.value;

        searchRecords ({
            objName : this.objectName,
            fieldName : this.fieldName,
            searchKey : searchVal
        })
        .then(data => {
            if (data) {
                let parsedResponse = JSON.parse(data);
                let searchRecordList = parsedResponse[0];

                for (let i=0; i < searchRecordList.length; i++) {
                    let record = searchRecordList[i];
                    record.Name = record[this.fieldName];
                }
                this.records = searchRecordList;
            }
        })
        .catch(error => {
            window.console.log('ERR: ' , JSON.stringify(error));
        })

    }

    handleSelect(event){
        var selectedVal = event.detail.selRec;
        this.selectedRecord = selectedVal;

        let finalRecEvent = new CustomEvent('select', {
            detail: {
                selectedRecordId : this.selectedRecord.Id,
                parentField : this.parentIdField
            }
        });
        this.dispatchEvent(finalRecEvent);
    }

    handleRemove(){
        this.selectedRecord = undefined;
        this.records = undefined;

        let finalRecEvent = new CustomEvent('select', {
            detail : {
                selectedRecordId : undefined,
                parentField : this.parentIdField
            }
        });
        this.dispatchEvent(finalRecEvent);
    }

}