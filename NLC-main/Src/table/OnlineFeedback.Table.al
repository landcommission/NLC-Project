#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193822 "Online Feedback"
{
    Caption = 'Online Feedback';
    DataClassification = CustomerContent;
    fields
    {
        field(1; No; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            Caption = 'No';
        }
        field(2; "User Name"; Code[20])
        {
            Editable = false;
            NotBlank = true;
            Caption = 'User Name';
        }
        field(4; Date; DateTime)
        {
            Editable = false;
            NotBlank = true;
            Caption = 'Date';
        }
        field(5; Comment; Text[250])
        {
            Editable = false;
            NotBlank = true;
            Caption = 'Comment';
        }
        field(6; Response; Text[250])
        {
            Caption = 'Response';
            trigger OnValidate()
            begin
                //:='';
                //s:=Response;

                if Response <> '' then begin
                    Status := Status::Read;
                    Modify();

                    /*
                       IF s<>'' THEN BEGIN     feedbackResponse:='The administrator responded to your question/feedback: '+"Administrator Response";
                              SendEML(feedbackResponse,'no-reply@localhost',s,'RE: Feedback');
                         MESSAGE('Thank you for responding to the question/feedback. An e-mail alert has been sent to %1.',s);
                       END;
                       */
                end;

            end;
        }
        field(7; Status; Option)
        {
            Editable = false;
            OptionMembers = "Not Read",Read;
            Caption = 'Status';
        }
        field(8; "Sender Email"; Text[250])
        {
            Editable = false;
            Caption = 'Sender Email';
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}
