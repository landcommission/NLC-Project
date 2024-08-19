#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193961 "Evaluation Parameter"
{
    PageType = List;
    SourceTable = "Evaluation Parameters Areas";
    ApplicationArea = All;
    Caption = 'Evaluation Parameter';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                    trigger OnValidate()
                    begin
                        Vend.Reset();
                        Vend.SetRange(Vend."No.", Rec."Vendor No.");
                        if Vend.Find('-') then
                            Rec."Vendor Name" := Vend.Name;
                    end;
                }
                field("Evaluation Year"; Rec."Evaluation Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Year field.';
                }
                field("Parameter Code"; Rec."Parameter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Parameter Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Expected Min.Value"; Rec."Expected Min.Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Min.Value field.';
                }
                field("Expected Max.Value"; Rec."Expected Max.Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Max.Value field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                    trigger OnValidate()
                    begin
                        Vend.Reset();
                        Vend.SetRange(Vend."No.", Rec."Vendor No.");
                        if Vend.Find('-') then
                            Rec."Vendor Name" := Vend.Name;
                    end;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control9; Outlook) { }
            systempart(Control10; Notes) { }
        }
    }

    actions { }

    var
        Vend: Record Vendor;
}
