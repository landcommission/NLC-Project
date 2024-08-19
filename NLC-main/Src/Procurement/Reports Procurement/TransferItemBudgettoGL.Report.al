#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52193723 "Transfer Item Budget to G/L"
{
    ProcessingOnly = true;

    dataset
    {
        dataitem("Integer"; "Integer")
        {
            DataItemTableView = where(Number = const(1));
            column(ReportForNavId_1000000000; 1000000000)
            {
            }

            trigger OnAfterGetRecord()
            var
                GenPostingSetup: Record 252;
            begin
                /*{
               EntryNo:=GetNextEntryNo;
               TotalTransferred:=0;
               //Loop through the Item budget Entry and Select as per selected Budget,Begin Date, End Date and unposted entries
               ItemBudget.RESET;
               ItemBudget.SETRANGE(ItemBudget."Budget Name",Budget);
               ItemBudget.SETRANGE(ItemBudget.Date,StartDate,EndDate);
               ItemBudget.SETRANGE(ItemBudget."Posted to GL Budget",FALSE);
               IF ItemBudget.FIND('-') THEN
               REPEAT
                  Item.GET(ItemBudget."Item No.");
                  IF GenPostingSetup.GET(ItemBudget."Gen. Bus. Posting Group",Item."Gen. Prod. Posting Group") THEN BEGIN
               //   IF ItemBudget."G/L Budget Account"<>'' THEN BEGIN //**changes use the posting setup instead
                       //Pass entries to G/L Budget Entry cost then price

                       GLBudget.INIT;
                       EntryNo+=1;
                       GLBudget."Entry No.":= EntryNo;
                       GLBudget."Budget Name":=BudgetarySetup."Current Budget Code";
                       GLBudget."G/L Account No.":=GenPostingSetup."Sales Account";
                       GLBudget.Date:=ItemBudget.Date;
                       GLBudget."Global Dimension 1 Code":=ItemBudget."Global Dimension 1 Code";
                       GLBudget."Global Dimension 2 Code":=ItemBudget."Global Dimension 2 Code";
                       GLBudget.Amount:=ItemBudget."Sales Amount";
                       GLBudget.Description:='Transfer from Item '+Item."No."+' Budget'+':'+Budget;
                       GLBudget."User ID":=USERID;
                       GLBudget."Budget Dimension 1 Code":=ItemBudget."Budget Dimension 1 Code";
                       GLBudget."Budget Dimension 2 Code":=ItemBudget."Budget Dimension 2 Code";
                       GLBudget."Budget Dimension 3 Code":=ItemBudget."Budget Dimension 3 Code";
                       GLBudget."Transferred from Item Budget":=TRUE;
                       GLBudget.INSERT;

                       GLBudget.INIT;
                       EntryNo:=EntryNo+2;
                       GLBudget."Entry No.":= EntryNo;
                       GLBudget."Budget Name":=BudgetarySetup."Current Budget Code";
                       GLBudget."G/L Account No.":=GenPostingSetup."COGS Account";
                       GLBudget.Date:=ItemBudget.Date;
                       GLBudget."Global Dimension 1 Code":=ItemBudget."Global Dimension 1 Code";
                       GLBudget."Global Dimension 2 Code":=ItemBudget."Global Dimension 2 Code";
                       GLBudget.Amount:=ItemBudget."Cost Amount";
                       GLBudget.Description:='Transfer from Item '+Item."No."+' Budget'+':'+Budget;
                       GLBudget."User ID":=USERID;
                       GLBudget."Budget Dimension 1 Code":=ItemBudget."Budget Dimension 1 Code";
                       GLBudget."Budget Dimension 2 Code":=ItemBudget."Budget Dimension 2 Code";
                       GLBudget."Budget Dimension 3 Code":=ItemBudget."Budget Dimension 3 Code";
                       GLBudget."Transferred from Item Budget":=TRUE;
                       GLBudget.INSERT;

                     TotalTransferred+=1;
                     //Mark the Item Budget entry as transferred and update who did the update and when
                     ItemBudget."Posted to GL Budget":=TRUE;
                     ItemBudget."Transferred By":=USERID;
                     ItemBudget."Date Transferred":=TODAY;
                     ItemBudget.MODIFY;
                  END;
               UNTIL ItemBudget.NEXT=0;
                   }*/

            end;

            trigger OnPreDataItem()
            begin
                /*{
               IF (Budget='') OR (StartDate=0D) OR (EndDate=0D) THEN
                  ERROR('Either the Budget, Start Date or End Date is not Provided. All these fields are Required');
               //Get the Budgetary Control Setup
               BudgetarySetup.GET();

               GLBudgetName.SETRANGE(GLBudgetName.Name,BudgetarySetup."Current Budget Code");
               GLBudgetName.FINDSET;

               SalesBudgetName.SETRANGE(SalesBudgetName.Name,Budget);
               SalesBudgetName.FINDSET;

               //ensure dimensions match before transfer
               IF SalesBudgetName."Budget Dimension 1 Code" <> GLBudgetName."Budget Dimension 1 Code" THEN
                 ERROR('The Budget dimensions 1 for the GL and Item Budget do not match');

               IF SalesBudgetName."Budget Dimension 2 Code" <> GLBudgetName."Budget Dimension 2 Code" THEN
                 ERROR('The Budget dimensions 2 for the GL and Item Budget do not match');

               IF SalesBudgetName."Budget Dimension 3 Code" <> GLBudgetName."Budget Dimension 3 Code" THEN
                 ERROR('The Budget dimensions 3 for the GL and Item Budget do not match');
                    }*/

            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Budget; Budget)
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget';
                }
                field(StartDate; StartDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'Start Date';
                }
                field(EndDate; EndDate)
                {
                    ApplicationArea = Basic;
                    Caption = 'End Date';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPostReport()
    begin

        Message('%1 Lines Successfully Transferred', TotalTransferred);
    end;

    var
        ItemBudget: Record 7134;
        GLBudget: Record 96;
        Budget: Code[20];
        StartDate: Date;
        EndDate: Date;
        GLBudgetEntry: Record 96;
        EntryNo: Integer;
        TotalTransferred: Integer;
        Item: Record Item;
        SalesBudgetName: Record 7132;
        GLBudgetName: Record 95;

    local procedure GetNextEntryNo(): Integer
    var
        GLBudgetEntry: Record 96;
    begin
        GLBudgetEntry.SetCurrentkey("Entry No.");
        if GLBudgetEntry.Find('+') then
            exit(GLBudgetEntry."Entry No." + 1)
        else
            exit(1);
    end;


    procedure SetOption(Name: Code[20])
    begin
        Budget := Name;
    end;
}

