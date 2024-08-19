#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50107 pageextension50107 extends "Vendor Card"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Vendor Card"(Page 26)".

    actions
    {
        addafter("Purchase Journal")
        {
            action("Vendor Evaluation Parameters")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Evaluation Parameters';
                Image = Excise;
                RunObject = page "Evaluation Parameter";
                RunPageLink = "Vendor No." = field("No.");
                ToolTip = 'Executes the Vendor Evaluation Parameters action.';
            }
            action(Test)
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Evaluation Parameters';
                Image = TestFile;
                ToolTip = 'Executes the Vendor Evaluation Parameters action.';
                trigger OnAction()
                var
                    PWS: Codeunit PortalWebService;
                    app: Codeunit "Approvals Mgmt.";
                begin
                    PWS.SendLeaveForApproval('LV_05042');

                end;
            }
        }
    }

    var
        Vendor: Record Vendor;
        Text003: Label 'Vendor [%1 - %2] has not attached documents';

    procedure RecordLinkCheck(job: Record Vendor) RecordLnkExist: Boolean
    var
        objRecordLnk: Record "Record Link";
        TableCaption: RecordId;
        objRecord_Link: RecordRef;
    begin
        objRecord_Link.GetTable(job);
        TableCaption := objRecord_Link.RecordId;
        objRecordLnk.Reset();
        objRecordLnk.SetRange(objRecordLnk."Record ID", TableCaption);
        if objRecordLnk.Find('-') then
            exit(true)
        else
            exit(false);
    end;
}
