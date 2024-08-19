table 55930 "Document Emailing Users"
{
    Permissions = TableData "G/L Entry" = rimd;
    Caption = 'Document Emailing Users';

    fields
    {
        field(1; "User ID"; Code[50])
        {
            NotBlank = true;

            trigger OnLookup()
            begin
                LookupUserID("User ID");
            end;

            trigger OnValidate()
            begin
                ValidateUserID("User ID");
            end;
        }
        field(2; "Customer Statement Due Not."; Boolean)
        {
        }
        field(3; "Sales Invoice Due Notification"; Boolean)
        {
        }
        field(4; "Service Invoice Due Notif."; Boolean)
        {
        }
        field(5; "Remit. Advice Due Notif."; Boolean)
        {
        }
        field(6; "Payments Advice Due Notif."; Boolean)
        {
        }
        field(7; "EFT Remit. Due Notif."; Boolean)
        {
        }
        field(8; "Reminder Due Notification"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "User ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: Label 'The user name %1 does not exist.';

    procedure ValidateUserID(UserName: Code[50])
    var
        User: Record User;
    begin
        if UserName <> '' then begin
            User.SETCURRENTKEY("User Name");
            User.SETRANGE("User Name", UserName);
            if not User.FINDFIRST then begin
                User.RESET;
                if not User.ISEMPTY then
                    ERROR(Text000, UserName);
            end;
        end;
    end;

    procedure LookupUserID(var UserName: Code[50])
    var
        SID: Guid;
    begin
        LookupUser(UserName, SID);
    end;

    procedure LookupUser(var UserName: Code[50]; var SID: GUID): Boolean
    var
        User: Record User;
    begin
        User.RESET;
        User.SETCURRENTKEY("User Name");
        User."User Name" := UserName;
        if User.FIND('=><') then;
        if PAGE.RUNMODAL(PAGE::Users, User) = ACTION::LookupOK then begin
            UserName := User."User Name";
            SID := User."User Security ID";
            exit(true);
        end;

        exit(false);
    end;
}

