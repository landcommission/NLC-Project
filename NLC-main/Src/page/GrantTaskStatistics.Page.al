#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193858 "Grant Task Statistics"
{
    Caption = 'Grant Task Statistics';
    DataCaptionExpression = Rec.Caption();
    Editable = false;
    LinksAllowed = false;
    PageType = Card;
    SourceTable = "Job-Task";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        OnAfterGetCurrRecord();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        OnAfterGetCurrRecord();
    end;

    var
        Job: Record Jobs;
        JobCalcStatistics: Codeunit "HR Appraisal Jnl.-Post Batch";
        CL: array[16] of Decimal;
        PL: array[16] of Decimal;
        P: array[16] of Decimal;
        C: array[16] of Decimal;
        Description2: Text[50];
        JTNo: Code[20];
        Text000: Label 'Placeholder';
        Text19057252: Label 'Resource';
        Text19080001: Label 'Resource';
        Text19059736: Label 'Price';
        Text19012801: Label 'Price LCY';
        Text19077570: Label 'Cost';
        Text19068736: Label 'Cost LCY';
        Text19011378: Label 'Item';
        Text19080002: Label 'Item';
        Text19073853: Label 'Profit LCY';
        Text19075586: Label 'Profit';
        Text19055809: Label 'G/L Account';
        Text19080003: Label 'G/L Account';
        Text19028226: Label 'Total';
        Text19080004: Label 'Total';

    local procedure OnAfterGetCurrRecord()
    begin
        xRec := Rec;
    end;
}
