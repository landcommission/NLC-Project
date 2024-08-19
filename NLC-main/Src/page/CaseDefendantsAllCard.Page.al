#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 56114 "Case Defendants All Card"
{
    PageType = Card;
    SourceTable = "Case Defendants All";
    ApplicationArea = All;
    Caption = 'Case Defendants All Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Second Name"; Rec."Second Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Second Name field.';
                }
                field("Last name"; Rec."Last name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Names field.';
                }
                field("Postal Code"; Rec."Postal Code")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Post Code".Code;
                    ToolTip = 'Specifies the value of the Postal Code field.';
                    trigger OnValidate()
                    begin
                        PostCode.Reset();
                        PostCode.SetRange(Code, Rec."Postal Code");
                        if PostCode.Find('-')
                            then
                            Rec.City := PostCode.City;
                    end;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(Contacts; Rec.Contacts)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contacts field.';
                }
            }
        }
    }

    actions { }

    var
        PostCode: Record "Post Code";
}

#pragma implicitwith restore

