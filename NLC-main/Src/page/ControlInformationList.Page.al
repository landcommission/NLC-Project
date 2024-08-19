#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193547 "Control-Information List"
{
    PageType = List;
    SourceTable = "Control-Information";
    ApplicationArea = All;
    Caption = 'Control-Information List';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Code/City';
                    ToolTip = 'Specifies the value of the Post Code/City field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("VAT Registration No."; Rec."VAT Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Registration No. field.';
                }
                field("Company P.I.N"; Rec."Company P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company P.I.N field.';
                }
                field("N.S.S.F No."; Rec."N.S.S.F No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.S.S.F No. field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                field("Company code"; Rec."Company code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company code field.';
                }
                field(Mission; Rec.Mission)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission field.';
                }
                field(Vision; Rec.Vision)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vision field.';
                }
                field("Mission/Vision Link"; Rec."Mission/Vision Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mission/Vision Link field.';
                }
                field("Payslip Message"; Rec."Payslip Message")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payslip Message field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("Picture USAID"; Rec."Picture USAID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture USAID field.';
                }
                field("Multiple Payroll"; Rec."Multiple Payroll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Multiple Payroll field.';
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field("Phone No.1"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fax No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
            }
            group("Physical Address")
            {
                Caption = 'Physical Address';
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address';
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address 2';
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Code/City';
                    ToolTip = 'Specifies the value of the Post Code/City field.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ship-to City field.';
                }
                field("Ship-to Contact"; Rec."Ship-to Contact")
                {
                    ApplicationArea = Basic;
                    Caption = 'Contact';
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
            }
        }
    }

    actions { }
}
