#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193930 "Vote Transfer"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Transfer Schedule 1";
    ApplicationArea = All;
    Caption = 'Vote Transfer';
    layout
    {
        area(Content)
        {
            group("Budget Transfer")
            {
                Caption = 'Budget Transfer';
                label(Control1000000023)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19066037;
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Curent Branch"; Rec."Curent Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Curent Branch field.';
                }
                field("Transfer Status"; Rec."Transfer Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Status field.';
                }
                label(Source)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19004057;
                    Caption = 'Source';
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Employee Code"; Rec."Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Code field.';
                }
                field("New Branch"; Rec."New Branch")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Code';
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("New Job Title"; Rec."New Job Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fund Code';
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                label(Destination)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19061585;
                    Caption = 'Destination';
                    Style = Standard;
                    StyleExpr = true;
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Pay Change"; Rec."Pay Change")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Code';
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Fund Code';
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Caption = 'Post';
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    if Confirm('Do You Really Want To Post The Vote Transfer ?') then
                        Post_Vote();
                end;
            }
        }
    }

    var
        EntryNo: Integer;
        BudgetEntry: Record "G/L Budget Entry";
        Text19066037: Label 'Transfer Details';
        Text19004057: Label 'Transfer From Details';
        Text19061585: Label 'Transfer To Details';


    procedure Post_Vote()
    begin
        Rec.TestField(Rec.Description);
        Rec.TestField(Rec."Job Title");
        Rec.TestField(Rec."Curent Branch");
        Rec.TestField(Rec."Employee Code");
        Rec.TestField(Rec."Job ID");

        if BudgetEntry.FindLast() then
            EntryNo := BudgetEntry."Entry No.";

        //.........Post Reducing Vote
        EntryNo := EntryNo + 1;

        BudgetEntry.Init();
        BudgetEntry."Entry No." := EntryNo;
        BudgetEntry."Budget Name" := Rec."Job Title";
        BudgetEntry."G/L Account No." := Rec."Employee Code";
        //BudgetEntry.Date:=Description;
        //BudgetEntry."Global Dimension 1 Code":="New Branch";
        //BudgetEntry."Global Dimension 2 Code":="Effective Date";
        BudgetEntry."Budget Dimension 1 Code" := Rec."New Job Title";
        //BudgetEntry.Amount:="Curent Branch";
        //BudgetEntry.Description:="Transfer Status";
        BudgetEntry."User ID" := UserId;
        BudgetEntry.Insert(true);

        //.........Post Incresing Vote
        /*{
        EntryNo:=EntryNo+1;
        BudgetEntry.INIT;
        BudgetEntry."Entry No.":=EntryNo;
        BudgetEntry."Budget Name":="Job Title";
        BudgetEntry."G/L Account No.":="Job ID";
        //BudgetEntry.Date:=Description;
        //BudgetEntry."Global Dimension 1 Code":="Pay Change";
        BudgetEntry."Global Dimension 2 Code":=Remark;
        BudgetEntry."Budget Dimension 1 Code":="Approved By";
        BudgetEntry.Amount:="Curent Branch";
        BudgetEntry.Description:="Transfer Status";
        BudgetEntry."User ID":=USERID;
        BudgetEntry.INSERT(TRUE);

        "Change Type":=TRUE;
        "No. Series":=TODAY;
        "New Job ID":=USERID;
        MODIFY;
        MESSAGE('Vote Transfered Successfully');
        }*/

    end;
}
