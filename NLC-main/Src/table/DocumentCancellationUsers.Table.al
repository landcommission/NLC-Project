#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193658 "Document Cancellation Users"
{
    Caption = 'Document Cancellation Users';
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Document Area"; Option)
        {
            NotBlank = true;
            OptionMembers = ,Purchase,Sale,Transfers,"Funds Mgt";
            Caption = 'Document Area';
        }
        field(2; "Document Type"; Option)
        {
            NotBlank = true;
            OptionMembers = ,"Order",Invoice,"Cash Sale","Credit Memo","Return Order","Transfer Order",Requisition;
            Caption = 'Document Type';
        }
        field(3; UserID; Code[50])
        {
            Description = 'Stores the reference of the user in the database';
            NotBlank = true;
            Caption = 'UserID';

        }
        field(4; Username; Text[30])
        {
            FieldClass = Normal;
            Caption = 'Username';
        }
        field(5; "Notify/Can Cancel"; Option)
        {
            Description = 'Notify/Can Cancel';
            OptionMembers = Notify,"Can Cancel";
            Caption = 'Notify/Can Cancel';
        }
    }

    keys
    {
        key(Key1; "Document Area", "Document Type", UserID)
        {
            Clustered = true;
        }
    }

    fieldgroups { }

    trigger OnInsert()
    begin
        User.Reset();
        User.SetRange(User."User Name", UserID);
        if User."Full Name" <> '' then
            Username := User."Full Name"
        else
            Username := User."User Name"
    end;

    var
        LoginMgt: Codeunit "User Management";
        User: Record User;
}
