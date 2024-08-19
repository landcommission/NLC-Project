#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56222 "Advocate on record list"
{
    PageType = List;
    SourceTable = "Advocates on Record";
    ApplicationArea = All;
    Caption = 'Advocate on record list';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(no; Rec.no)
                {
                    ApplicationArea = Basic;
                    Caption = 'NO';
                    Visible = false;
                    ToolTip = 'Specifies the value of the NO field.';
                }
                field("code"; Rec.code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the code field.';
                }
                field("line no"; Rec."line no")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the line no field.';
                }
                field("advocate name"; Rec."advocate name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Advocate Names';
                    ToolTip = 'Specifies the value of the Advocate Names field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Advocate Firm"; Rec."Advocate Firm")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocate Firm field.';
                }
            }
        }
    }

    actions { }
}

#pragma implicitwith restore

