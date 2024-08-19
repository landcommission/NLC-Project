#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50133 "Disposal Plan Table Lines"
{
    PageType = ListPart;
    SourceTable = "Disposal plan table line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field("Ref. No."; "Ref. No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Sub. Ref. No."; "Sub. Ref. No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Item description"; "Item description")
                {
                    ApplicationArea = Basic;
                }
                field("Date Of Acquisition"; "Date Of Acquisition")
                {
                    ApplicationArea = Basic;
                }
                field("Value Of Purchase"; "Value Of Purchase")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Department)
                {
                    ApplicationArea = Basic;
                }
                field(County; County)
                {
                    ApplicationArea = Basic;
                }
                field("Item/Tag No"; "Item/Tag No")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Serial No"; "Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Disposal"; "Reason for Disposal")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Disposal Comments"; "Disposal Comments")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Line Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                }
                field("Rejection Comments"; "Rejection Comments")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin


        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Employee No" := HREmp."No.";
            "Employee Name" := HREmp."Full Name";
            "Shortcut dimension 1 code" := HREmp."Global Dimension 1 Code";
            "Shortcut dimension 2 code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;

        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to insert at this level')
    end;

    trigger OnModifyRecord(): Boolean
    begin

        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            HREmp.TestField(HREmp."Responsibility Center");
            "Responsibility Center" := HREmp."Responsibility Center";
            "Employee No" := HREmp."No.";
            "Employee Name" := HREmp."Full Name";
            "Shortcut dimension 1 code" := HREmp."Global Dimension 1 Code";
            "Shortcut dimension 2 code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;

        CalcFields(Status);
        if Status <> Status::Open then
            Error('You are not allowed to insert at this level')
    end;

    var
        HREmp: Record 52193433;
}

