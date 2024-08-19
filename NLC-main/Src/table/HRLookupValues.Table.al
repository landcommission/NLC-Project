#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52193468 "HR Lookup Values"
{
    DrillDownPageId = "HR Lookup Values List";
    LookupPageId = "HR Lookup Values List";
    Caption = 'HR Lookup Values';
    DataClassification = CustomerContent;
    fields
    {
        field(1; Type; Option)
        {
            OptionCaption = 'Religion,Language,Medical Scheme,Location,Contract Type,Qualification Type,Stages,Scores,Institution,Appraisal Type,Appraisal Period,Urgency,Succession,Security,Disciplinary Case Rating,Disciplinary Case,Disciplinary Action,Next of Kin,Country,Grade,Checklist Item,Appraisal Sub Category,Appraisal Group Item,Transport Type,Grievance Cause,Grievance Outcome,Appraiser Recom,Job Group,Training Cost Items,Interview Areas,Competency,County,Tribe,Qualification Grade,Job Group Range,Home District';
            OptionMembers = Religion,Language,"Medical Scheme",Location,"Contract Type","Qualification Type",Stages,Scores,Institution,"Appraisal Type","Appraisal Period",Urgency,Succession,Security,"Disciplinary Case Rating","Disciplinary Case","Disciplinary Action","Next of Kin",Country,Grade,"Checklist Item","Appraisal Sub Category","Appraisal Group Item","Transport Type","Grievance Cause","Grievance Outcome","Appraiser Recom","Job Group","Training Cost Items","Interview Areas",Competency,County,Tribe,"Qualification Grade","Job Group Range","Home District";
            Caption = 'Type';
        }
        field(2; "Code"; Code[70])
        {
            Caption = 'Code';
        }
        field(3; Description; Text[80])
        {
            Caption = 'Description';
        }
        field(4; Remarks; Text[250])
        {
            Caption = 'Remarks';
        }
        field(5; "Notice Period"; Date)
        {
            Caption = 'Notice Period';
        }
        field(6; Closed; Boolean)
        {
            Caption = 'Closed';
        }
        field(7; "Contract Length"; Integer)
        {
            Caption = 'Contract Length';
        }
        field(8; "Current Appraisal Period"; Boolean)
        {
            Caption = 'Current Appraisal Period';
        }
        field(9; "Disciplinary Case Rating"; Text[30])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Disciplinary Case"));
            Caption = 'Disciplinary Case Rating';
        }
        field(10; "Disciplinary Action"; Code[20])
        {
            TableRelation = "HR Lookup Values".Code where(Type = const("Next of Kin"));
            Caption = 'Disciplinary Action';
        }
        field(14; From; Date)
        {
            Caption = 'From';
        }
        field(15; "To"; Date)
        {
            Caption = 'To';
        }
        field(16; Score; Decimal)
        {
            Caption = 'Score';
        }
        field(17; "Basic Salary"; Decimal)
        {
            Caption = 'Basic Salary';
        }
        field(18; "To be cleared by"; Code[10])
        {
            TableRelation = "HR Lookup Values".Remarks;
            Caption = 'To be cleared by';
        }
        field(19; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
        }
        field(20; "Supervisor Only"; Boolean)
        {
            Caption = 'Supervisor Only';
        }
        field(21; "Appraisal Stage"; Option)
        {
            OptionMembers = "Target Setting",FirstQuarter,SecondQuarter,ThirdQuarter,EndYearEvaluation;
            Caption = 'Appraisal Stage';
        }
        field(22; "Previous Appraisal Code"; Code[70])
        {
            Caption = 'Previous Appraisal Code';
        }
        field(23; "Minimum Pay"; Decimal)
        {
            Caption = 'Minimum Pay';
        }
        field(24; "Maximum Pay"; Decimal)
        {
            Caption = 'Maximum Pay';
        }
        field(25; "Next Period"; Boolean)
        {
            Caption = 'Next Period';
        }
        field(50003; "Previous Job Position"; Boolean)
        {
            Caption = 'Previous Job Position';
        }
        field(50004; "Previous Job Position Order"; Integer)
        {
            Caption = 'Previous Job Position Order';
        }
        field(50005; "Previous Appraisal Period"; Boolean)
        {
            Caption = 'Previous Appraisal Period';
        }
        field(50006; "Order Value"; Integer)
        {
            Caption = 'Order Value';
        }
        field(50007; Level; Code[40])
        {
            Caption = 'Level';
        }
        field(50008; "Qualification Type"; Code[30])
        {
            Caption = 'Qualification Type';
        }
    }

    keys
    {
        key(Key1; Type, "Code", Description)
        {
            Clustered = true;
        }

    }

    fieldgroups { }


    var
        HrLookupValues: Record "HR Lookup Values";
}

