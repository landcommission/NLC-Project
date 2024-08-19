#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50158 pageextension50158 extends "Purchase Budget Overview"
{

    //Unsupported feature: Property Modification (PageType) on ""Purchase Budget Overview"(Page 7138)".

    layout
    {
        modify(ValueType)
        {
            Caption = 'Vendor Filter';

            //Unsupported feature: Property Modification (SourceExpr) on "ValueType(Control 14)".


            //Unsupported feature: Property Modification (Name) on "ValueType(Control 14)".

        }
        modify(PeriodType)
        {
            Caption = 'Show Value As';
            OptionCaption = ' ,Cost Amount,Quantity';

            //Unsupported feature: Property Modification (SourceExpr) on "PeriodType(Control 21)".


            //Unsupported feature: Property Modification (Name) on "PeriodType(Control 21)".

        }



    }
    actions
    {
        addafter("Next Set")
        {
            action(Action18)
            {
                ApplicationArea = Basic;
                Caption = 'Reverse Lines and Columns';
                ToolTip = 'Executes the Reverse Lines and Columns action.';
                trigger OnAction()
                var
                    TempDimCode: Text[30];
                begin

                    TempDimCode := ColumnDimCode;
                    ColumnDimCode := LineDimCode;
                    LineDimCode := TempDimCode;
                    // ItemBudgetManagement.ValidateLineDimCode(
                    //   ItemBudgetName,LineDimCode,LineDimOption,ColumnDimOption,
                    //   InternalDateFilter,DateFilter,ItemStatisticsBuffer,PeriodInitialized);
                    // ItemBudgetManagement.ValidateColumnDimCode(
                    //   ItemBudgetName,ColumnDimCode,ColumnDimOption,LineDimOption,
                    //   InternalDateFilter,DateFilter,ItemStatisticsBuffer,PeriodInitialized);
                end;
            }
            action("Transfer to G/L Budget")
            {
                ApplicationArea = Basic;
                Caption = 'Transfer to G/L Budget';
                ToolTip = 'Executes the Transfer to G/L Budget action.';
                trigger OnAction()
                var
                    TransfertoBudget: Report "Transfer Item Budget to G/L";
                begin

                    TransfertoBudget.SetOption(CurrentBudgetName);
                    TransfertoBudget.Run();
                end;
            }
            action("Auto Allocation")
            {
                ApplicationArea = Basic;
                Caption = 'Auto Allocation';
                ToolTip = 'Executes the Auto Allocation action.';
                trigger OnAction()
                begin

                    //check if the budget is blocked or not
                    ItemBudgetName.Reset();
                    ItemBudgetName.SetRange(ItemBudgetName."Analysis Area", ItemBudgetName."Analysis Area"::Purchase);
                    ItemBudgetName.SetRange(ItemBudgetName.Name, CurrentBudgetName);
                    if ItemBudgetName.Find('-') then
                        if ItemBudgetName.Blocked then
                            Error('The Budget is blocked hence operation not allowed');
                    //insert a new budget record and display the results
                    TBTable.Reset();
                    LineNo := 0;
                    if TBTable.Find('+') then;
                    // LineNo:=TBTable."Line No.";

                    LineNo := LineNo + 1;

                    //insert the record into the database
                    begin
                        TBTable.Init();
                        ///"Line No.":=LineNo;
                        ////"Analysis Area":="Analysis Area"::"0";
                        /// VALIDATE("Analysis Area");
                        ////"Applicant No":=CurrentBudgetName;
                        ///"Show As":="Show As"::"1";
                        ////"Period Type":="Period Type"::"2";
                        TBTable.Insert();
                        //FORM.RUN(39006072,TBTable);
                    end;
                end;
            }
        }
    }

    var
        TBTable: Record "Applicant Relevant Documents";
        LineNo: Integer;
        ItemBudgetManagement: Codeunit "Item Budget Management";
        ItemBudgetName: Record "Item Budget Name";
}
