#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50130 tableextension50130 extends "Gen. Journal Batch"
{
    fields
    {
        field(50000; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User;
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;
            DataClassification = CustomerContent;

            /*  trigger OnLookup()
             var
                 LoginMgt: Codeunit "User Management";
             begin
                 LoginMgt.LookupUserID(Rec."User ID");
             end;

             trigger OnValidate()
             var
                 LoginMgt: Codeunit "User Management";
             begin
                 LoginMgt.ValidateUserID(Rec."User ID");
             end; */
        }
        field(50001; "Batch Type"; Option)
        {
            OptionMembers = Working,Posting;
            Caption = 'Batch Type';
            DataClassification = CustomerContent;
        }
        field(50002; Status; Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Approved';
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Status';
            DataClassification = CustomerContent;
        }
        field(50003; BatchApprovalNo; Code[10])
        {
            Description = 'Use this to help in creating batch numbers';
            Caption = 'BatchApprovalNo';
            DataClassification = CustomerContent;
        }
        field(50004; "Batch Workflow No. Series"; Code[20])
        {
            Caption = 'Batch Workflow No. Series';
            DataClassification = CustomerContent;
        }
        field(50005; "Responsibility Center"; Code[20])
        {
            TableRelation = "Responsibility Center BR 2";
            Caption = 'Responsibility Center';
            DataClassification = CustomerContent;
        }
    }
}
