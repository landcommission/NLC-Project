#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193775 "Closeout Checklist Lines"
{
    Caption = 'Closeout Checklist Lines';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Line No"; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No';
        }
        field(2; "Closeout Nos"; Code[50])
        {
            TableRelation = "Close Out Check List"."Closeout No.";
            Caption = 'Closeout Nos';
        }
        field(3; Sections; Code[250])
        {
            Caption = 'Sections';
        }
        field(4; Options; Option)
        {
            OptionCaption = 'Not Applicable,Submitted,Submitted (Copy Attached),Submitted(Original Attached),Not Submited,No Equipment Purchased,None,Already Returned,Enclosed';
            OptionMembers = "Not Applicable",Submitted,"Submitted (Copy Attached)","Submitted(Original Attached)","Not Submited","No Equipment Purchased",None,"Already Returned",Enclosed;
            Caption = 'Options';
        }
        field(5; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(6; Reason; Text[250])
        {
            Caption = 'Reason';
        }
    }

    keys
    {
        key(Key1; "Line No", "Closeout Nos")
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
