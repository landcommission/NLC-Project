#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50057 "Asset Reporting Line Portal"
{
    Caption = 'Asset Reporting Line Portal';
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "HR Asset Transfer Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Asset No."; "Asset No.")
                {
                    ApplicationArea = Basic;
                    //  TableRelation = "Fixed Asset"."No." where("Asset Movement Status" = filter(Available),
                    //      "Responsible Officer" = field("Responsible Employee Code"));
                }
                field("Asset Description"; "Asset Description")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Serial No"; "Asset Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Employee Code"; "Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate';
                }
                field("Dimension 2 Name"; "Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Name';
                    Editable = true;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Line No"; "Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Occurence"; "Date of Occurence")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Description';
                }
                field("Incidence Description"; "Incidence Description")
                {
                    ApplicationArea = Basic;
                }
                field("Action Description"; "Action Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Responsible Employee Code" := HREmp."No.";
            "Employee Name" := HREmp."Full Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;

        Type := Type::Incidence
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        HREmp.Reset;
        HREmp.SetRange(HREmp."User ID", UserId);
        if HREmp.Find('-') then begin
            "Responsible Employee Code" := HREmp."No.";
            "Employee Name" := HREmp."Full Name";
            "Global Dimension 1 Code" := HREmp."Global Dimension 1 Code";
            "Global Dimension 2 Code" := HREmp."Global Dimension 2 Code";
        end else begin
            Error('UserID %1 not linked to a staff in HR Employees table', UserId);
        end;

        Type := Type::Incidence
    end;

    var
        HREmp: Record 52193433;
}

