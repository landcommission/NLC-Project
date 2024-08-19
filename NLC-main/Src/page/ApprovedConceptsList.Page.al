#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193876 "Approved Concepts List"
{
    CardPageId = "Approved Concepts";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Jobs;
    SourceTableView = where(Status = const("Concept Formulation"),
                            "Approval Status" = filter(Approved));
    ApplicationArea = All;
    Caption = 'Approved Concepts List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Search Description field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Bill-to Partner No."; Rec."Bill-to Partner No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ending Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Person Responsible field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Kind of Program field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Date Modified field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Customer Disc. Group"; Rec."Customer Disc. Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Disc. Group field.';
                }
                field("Customer Price Group"; Rec."Customer Price Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Price Group field.';
                }
                field("Language Code"; Rec."Language Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Language Code field.';
                }
                field("Scheduled Res. Qty."; Rec."Scheduled Res. Qty.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled Res. Qty. field.';
                }
                field("Resource Filter"; Rec."Resource Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Filter field.';
                }
                field("Posting Date Filter"; Rec."Posting Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date Filter field.';
                }
                field("Resource Gr. Filter"; Rec."Resource Gr. Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Gr. Filter field.';
                }
                field("Scheduled Res. Gr. Qty."; Rec."Scheduled Res. Gr. Qty.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheduled Res. Gr. Qty. field.';
                }
                field(Picture; Rec.Picture)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Picture field.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Name field.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the  Address field.';
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to City field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Post Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Bill-to Country/Region Code"; Rec."Bill-to Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Country/Region Code field.';
                }
                field(Contractor; Rec.Contractor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Contact No. field.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bill-to Contact field.';
                }
                field("Planning Date Filter"; Rec."Planning Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planning Date Filter field.';
                }
                field("Total WIP Cost Amount"; Rec."Total WIP Cost Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total WIP Cost Amount field.';
                }
                field("Total WIP Cost G/L Amount"; Rec."Total WIP Cost G/L Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total WIP Cost G/L Amount field.';
                }
                field("WIP Posted To G/L"; Rec."WIP Posted To G/L")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Posted To G/L field.';
                }
                field("WIP Posting Date"; Rec."WIP Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP Posting Date field.';
                }
                field("WIP G/L Posting Date"; Rec."WIP G/L Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WIP G/L Posting Date field.';
                }
                field("Posted WIP Method Used"; Rec."Posted WIP Method Used")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted WIP Method Used field.';
                }
                field("Invoice Currency Code"; Rec."Invoice Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoice Currency Code field.';
                }
                field("Exch. Calculation (Cost)"; Rec."Exch. Calculation (Cost)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exch. Calculation (Cost) field.';
                }
                field("Exch. Calculation (Price)"; Rec."Exch. Calculation (Price)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exch. Calculation (Price) field.';
                }
                field("Allow Schedule/Contract Lines"; Rec."Allow Schedule/Contract Lines")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Schedule/Contract Lines field.';
                }
                field(Complete; Rec.Complete)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complete field.';
                }
                field("Calc. WIP Method Used"; Rec."Calc. WIP Method Used")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calc. WIP Method Used field.';
                }
                field("Amount Awarded"; Rec."Amount Awarded")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Awarded field.';
                }
                field("Recog. Sales G/L Amount"; Rec."Recog. Sales G/L Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recog. Sales G/L Amount field.';
                }
                field("Recog. Costs Amount"; Rec."Recog. Costs Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recog. Costs Amount field.';
                }
                field("Recog. Costs G/L Amount"; Rec."Recog. Costs G/L Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recog. Costs G/L Amount field.';
                }
                field("Total WIP Sales Amount"; Rec."Total WIP Sales Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total WIP Sales Amount field.';
                }
                field("Total WIP Sales G/L Amount"; Rec."Total WIP Sales G/L Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total WIP Sales G/L Amount field.';
                }
                field("Completion Calculated"; Rec."Completion Calculated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion Calculated field.';
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Invoice Date field.';
                }
                field("Grant Phases"; Rec."Grant Phases")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Phases field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
                field("Total Cost(LCY)"; Rec."Total Cost(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost(LCY) field.';
                }
                field("Contract Description"; Rec."Contract Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Description field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Disbursed Amount"; Rec."Disbursed Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disbursed Amount field.';
                }
                field("Allow OverExpenditure"; Rec."Allow OverExpenditure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow OverExpenditure field.';
                }
                field("Accounted Amount"; Rec."Accounted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accounted Amount field.';
                }
                field("Received Amount"; Rec."Received Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Amount field.';
                }
                field("Proposal No"; Rec."Proposal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal No field.';
                }
                field("Converted To Proposal"; Rec."Converted To Proposal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Converted To Proposal field.';
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Converted To Project"; Rec."Converted To Project")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Converted To Project field.';
                }
                field("Concept Number"; Rec."Concept Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Concept Number field.';
                }
                field(Objective; Rec.Objective)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective field.';
                }
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Reporting dates generated"; Rec."Reporting dates generated")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reporting dates generated field.';
                }
                field("Condition for budget realloca"; Rec."Condition for budget realloca")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Condition for budget realloca field.';
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Investigator field.';
                }
                field("Expected Receipt Amount"; Rec."Expected Receipt Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Receipt Amount field.';
                }
                field(Partners; Rec.Partners)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Collaborative Grants field.';
                }
                field("Project Location"; Rec."Project Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Location field.';
                }
                field("Income Account"; Rec."Income Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Income Account field.';
                }
                field("Concept Approval Date"; Rec."Concept Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Concept Approval Date field.';
                }
                field("Project Filter"; Rec."Project Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Filter field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Project Coordinator"; Rec."Project Coordinator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Coordinator field.';
                }
                field(Task; Rec.Task)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task field.';
                }
                field("Project Status"; Rec."Project Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Status field.';
                }
                field("Audit Indicator"; Rec."Audit Indicator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Indicator field.';
                }
                field("Approved Funding Start Date"; Rec."Approved Funding Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Funding Start Date field.';
                }
                field("Approved Funding End Date"; Rec."Approved Funding End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Funding End Date field.';
                }
                field("Justification Narration"; Rec."Justification Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification Narration field.';
                }
                field("Amount Invoiced"; Rec."Amount Invoiced")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Invoiced field.';
                }
                field("Grant Level"; Rec."Grant Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Level field.';
                }
                field("RSPO No."; Rec."RSPO No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RSPO No. field.';
                }
                field("Alert sent"; Rec."Alert sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alert sent field.';
                }
            }
        }
    }

    actions { }
}
