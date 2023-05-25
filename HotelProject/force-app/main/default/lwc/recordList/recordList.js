import { api, LightningElement } from 'lwc';

export default class RecordList extends LightningElement {

    @api rec;
    @api iconName = 'custom:custom16';

    handleSelect(){
        let selectEvent = new CustomEvent('select', {
            detail : {
                selRec : this.rec
            }
        });
        this.dispatchEvent(selectEvent);
    }

    handleRemove(){
        let selectEvent = new CustomEvent('select', {
            detail: {
                selRec : undefined
            }
        });
        this.dispatchEvent(selectEvent);
    }
    
}