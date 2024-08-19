#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193778 "Payroll Change Request Lines"
{
    PageType = ListPart;
    SourceTable = "Payroll Change Request Lines";
    ApplicationArea = All;
    Caption = 'Payroll Change Request Lines';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Payroll Change No"; Rec."Payroll Change No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Change No field.';
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("Change Type"; Rec."Change Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Change Type field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                    trigger OnValidate()
                    begin

                        PRTransCode.Reset();
                        PRTransCode.SetRange(PRTransCode."Transaction Code", Rec."Transaction Code");
                        if PRTransCode.Find('-') then
                            /*
                            PREmpTrans.RESET;
                            PREmpTrans.SETRANGE(PREmpTrans."Employee Code","Employee Code") ;
                            PREmpTrans.SETRANGE(PREmpTrans."Payroll Period","Effective Payroll Period");
                            PREmpTrans.SETRANGE(PREmpTrans."Transaction Code","Transaction Code");
                            IF PREmpTrans.FIND('-') THEN
                            BEGIN
                            */
                            Rec."Transaction Name" := PRTransCode."Transaction Name";
                        // "Old Value":=PREmpTrans.Amount;
                        //END;

                    end;
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("Effective Payroll Period"; Rec."Effective Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Payroll Period field.';
                }
                field("Old Value"; Rec."Old Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Old Value field.';
                }
                field("New Value"; Rec."New Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Value field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
            }
        }
    }

    actions { }

    var
        PRTransCode: Record "PR Transaction Codes";
        PREmpTrans: Record "PR Employee Transactions";
}
