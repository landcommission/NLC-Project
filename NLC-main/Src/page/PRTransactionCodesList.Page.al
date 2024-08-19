#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193526 "PR Transaction Codes List"
{
    ApplicationArea = Basic;
    CardPageId = "PR Transaction Code Card";
    PageType = List;
    SourceTable = "PR Transaction Codes";
    UsageCategory = Lists;
    Caption = 'PR Transaction Codes List';
    layout
    {
        area(Content)
        {
            repeater(Control1102755000)
            {
                Enabled = true;
                field("Is Special Muster"; Rec."Is Special Muster")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Special Muster field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Balance Type"; Rec."Balance Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Balance Type field.';
                }
                field("Special Transactions"; Rec."Special Transactions")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Special Transactions field.';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Interest Rate field.';
                }
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Code field.';
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Group Description field.';
                }
                field("Exclude Housing Levy"; Rec."Exclude Housing Levy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exclude Housing Levy field.';
                }
                field(Amount; Amount)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the amount';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(View)
            {
                Caption = 'View';
                action("<Page prTransaction Code>")
                {
                    ApplicationArea = Basic;
                    Caption = 'SetUp Card';
                    RunObject = page "PR Transaction Code Card";
                    RunPageLink = "Transaction Code" = field("Transaction Code");
                    RunPageView = sorting("Transaction Code");
                    ToolTip = 'Executes the SetUp Card action.';
                }
                action("Clear Selected")
                {
                    ApplicationArea = Basic;
                    Promoted = true;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Clear Selected action.';
                    trigger OnAction()
                    begin
                        Transcode.Reset();
                        //Transcode.SETRANGE(Transcode."Transaction Code","Transaction Code")  ;
                        Transcode.SetRange(Transcode."Is Special Muster", true);
                        if Transcode.Find('-') then
                            repeat
                                // MESSAGE('gggg')  ;
                                Transcode."Is Special Muster" := false;
                                Transcode.Modify()
                           until Transcode.Next() = 0;
                    end;
                }
            }
        }
    }

    var
        PREmpTrans: Record "PR Employee Transactions";
        Transcode: Record "PR Transaction Codes";
}
