using { WM.model.cat.Product,
        WM.model.cat.UOM as UOM_,
        WM.model.cat.Location,
        WM.model.doc.docReceive,
        WM.model.doc.docIssue,
        WM.model.doc.docMovement,
        WM.model.reg.Stock as Stock_
         } from '../db/schema';


service vsvappsrv @(
    path: '/api'
) {

    //Vocabularies
    entity Products 
        @( odata.draft.enabled : true )    
        as projection on Product;
    
    entity UOM
        @( odata.draft.enabled : true )       
        as select from UOM_;
    entity Locations    
        @( odata.draft.enabled : true )    
        as select from Location;

    //Documents
    entity Receive  
        @( odata.draft.enabled : true )     
        as projection on docReceive;
        action postReceiveDoc();
    entity Issue        
        @( odata.draft.enabled : true )    
        as projection on docIssue;
        // action postIssue();
    entity Movement     
        @( odata.draft.enabled : true )
        as projection on docMovement;
        // action postMovement();

    //Registry
    entity Stock 
        @(readonly:true)
        as projection on Stock_;
    //     action calculateStock();

    function calculateStock() returns Integer;    
}
