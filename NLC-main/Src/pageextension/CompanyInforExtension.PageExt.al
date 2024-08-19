#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50101 CompanyInforExtension extends "Company Information"
{
    layout
    {
        addafter("Industrial Classification")
        {
            field("PIN No"; Rec."PIN No")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the PIN No field.';
            }
            field("NSSF Number"; Rec."NSSF Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NSSF Number field.';
            }
            field("NHIF Number"; Rec."NHIF Number")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NHIF Number field.';
            }
        }
        addafter(Picture)
        {
            field("Kenyan Shield"; "Kenyan Shield")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies  the kenyan shield';
            }
            field("Company Watermark"; Rec."Company Watermark")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Company Watermark field.';
            }
            field("Documents Attachment Link"; Rec."Documents Attachment Link")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Documents Attachment Link field.';
            }

        }
        addafter("Home Page")
        {
            field("NLC Website"; "NLC Website")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the company website';
            }
        }
    }
}
