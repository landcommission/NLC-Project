#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193431 "HR Appraisal Jnl.-Check Line"
{
    TableNo = "HR Appraisal Journal Line";

    trigger OnRun()
    var
        TempJnlLineDim: Record "Journal Line Dimension" temporary;
    begin
        GLSetup.Get();

        if Rec."Shortcut Dimension 1 Code" <> '' then begin
            TempJnlLineDim."Table ID" := Database::"HR Appraisal Journal Line";
            TempJnlLineDim."Journal Template Name" := Rec."Journal Template Name";
            TempJnlLineDim."Journal Batch Name" := Rec."Journal Batch Name";
            TempJnlLineDim."Journal Line No." := Rec."Line No.";
            TempJnlLineDim."Dimension Code" := GLSetup."Global Dimension 1 Code";
            TempJnlLineDim."Dimension Value Code" := Rec."Shortcut Dimension 1 Code";
            TempJnlLineDim.Insert();
        end;
        if Rec."Shortcut Dimension 2 Code" <> '' then begin
            TempJnlLineDim."Table ID" := Database::"HR Appraisal Journal Line";
            TempJnlLineDim."Journal Template Name" := Rec."Journal Template Name";
            TempJnlLineDim."Journal Batch Name" := Rec."Journal Batch Name";
            TempJnlLineDim."Journal Line No." := Rec."Line No.";
            TempJnlLineDim."Dimension Code" := GLSetup."Global Dimension 2 Code";
            TempJnlLineDim."Dimension Value Code" := Rec."Shortcut Dimension 2 Code";
            TempJnlLineDim.Insert();
        end;

        RunCheck(Rec, TempJnlLineDim);
    end;

    var
        Text000: Label 'The combination of dimensions used in %1 %2, %3, %4 is blocked. %5';
        Text001: Label 'A dimension used in %1 %2, %3, %4 has caused an error. %5';
        GLSetup: Record "General Ledger Setup";
        FASetup: Record "HR Setup";
        DimMgt: Codeunit DimensionManagement;
        CallNo: Integer;
        Text002: Label 'The Posting Date Must be within the open leave periods';
        Text003: Label 'The Posting Date Must be within the allowed Setup date';
        AppriasalEntries: Record "HR Appraisal Ledger Entries";
        Text004: Label 'The Allocation of Leave days has been done for the period';


    procedure ValidatePostingDate(var InsuranceJnlLine: Record "HR Appraisal Journal Line")
    begin
        begin
            //  IF "Leave Entry Type"="Leave Entry Type"::Negative THEN BEGIN
            InsuranceJnlLine.TestField(InsuranceJnlLine."Appraisal Period");
            //END;
            InsuranceJnlLine.TestField(InsuranceJnlLine."Document No.");
            InsuranceJnlLine.TestField(InsuranceJnlLine."Posting Date");
            InsuranceJnlLine.TestField(InsuranceJnlLine."Staff No.");
            if (InsuranceJnlLine."Posting Date" < InsuranceJnlLine."Appraisal Period Start Date") or
               (InsuranceJnlLine."Posting Date" > InsuranceJnlLine."Appraisal Period End Date") then
                // ERROR(FORMAT(Text002));

                FASetup.Get();
            if (FASetup."Leave Posting Period[FROM]" <> 0D) and (FASetup."Leave Posting Period[TO]" <> 0D) then
                if (InsuranceJnlLine."Posting Date" < FASetup."Appraisal Posting Period[FROM]") or
                   (InsuranceJnlLine."Posting Date" > FASetup."Appraisal Posting Period[TO]") then
                    Error(Format(Text003));
        end;
    end;


    procedure RunCheck(var InsuranceJnlLine: Record "HR Appraisal Journal Line"; var JnlLineDim: Record "Journal Line Dimension")
    var
        TableID: array[10] of Integer;
        No: array[10] of Code[20];
    begin
        begin
            //IF "Appraisal Entry Type"="Appraisal Entry Type"::Negative THEN BEGIN
            InsuranceJnlLine.TestField(InsuranceJnlLine."Appraisal No.");
            //END;
            InsuranceJnlLine.TestField(InsuranceJnlLine."Document No.");
            InsuranceJnlLine.TestField(InsuranceJnlLine."Posting Date");
            InsuranceJnlLine.TestField(InsuranceJnlLine."Staff No.");
            CallNo := 1;

            // if not DimMgt.CheckJnlLineDimComb(JnlLineDim) then
            //   Error(
            //     Text000,
            //     InsuranceJnlLine.TableCaption,InsuranceJnlLine."Journal Template Name",InsuranceJnlLine."Journal Batch Name",InsuranceJnlLine."Line No.",
            //     DimMgt.GetDimCombErr);

            //  TableID[1] := DATABASE::Table52193847;
            TableID[1] := Database::"HR Appraisal Journal Line";
            No[1] := InsuranceJnlLine."Appraisal No.";
            // if not DimMgt.CheckJnlLineDimValuePosting(JnlLineDim,TableID,No) then
            //   if InsuranceJnlLine."Line No." <> 0 then
            //     Error(
            //       Text001,
            //       InsuranceJnlLine.TableCaption,InsuranceJnlLine."Journal Template Name",InsuranceJnlLine."Journal Batch Name",InsuranceJnlLine."Line No.",
            //       DimMgt.GetDimValuePostingErr)
            //   else
            //     Error(DimMgt.GetDimValuePostingErr);
        end;
        ValidatePostingDate(InsuranceJnlLine);
    end;
}
