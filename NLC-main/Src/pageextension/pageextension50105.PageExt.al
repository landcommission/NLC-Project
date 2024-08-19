#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50105 pageextension50105 extends "Customer Card"
{

    //Unsupported feature: Property Insertion (InsertAllowed) on ""Customer Card"(Page 21)".

    layout
    {
        addafter("Last Date Modified")
        {
            field("Employee Job Group"; Rec."Employee Job Group")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Employee Job Group field.';
            }
            field("Account Type"; Rec."Account Type")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Account Type field.';
            }
            field("Registration No"; Rec."Registration No")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Registration No field.';
            }
            field(Class; Rec.Class)
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Class field.';
            }
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Category field.';
            }
        }
    }


    //Unsupported feature: Code Insertion on "OnQueryClosePage".

    //trigger OnQueryClosePage(CloseAction: Action): Boolean
    //begin
    /*
    IF "Customer Posting Group"='' THEN ERROR('Error Customer group is not specified');
    IF "VAT Bus. Posting Group"='' THEN ERROR('Error VAT group is not specified');
    IF "Gen. Bus. Posting Group"='' THEN ERROR('Error General posting group is not specified');
    */
    //end;
}
