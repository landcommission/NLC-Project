#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50055 "Asset Incidence Reporting Line"
{
    Caption = 'Asset Issue Request Line';
    DeleteAllowed = true;
    Editable = false;
    PageType = ListPart;
    SourceTable = "HR Asset Transfer Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AssetNo; "Asset No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    TableRelation = "Fixed Asset"."No." where("Asset Movement Status" = filter(Available));
                    //"Responsible Officer"=field("Responsible Employee Code"));
                }
                field(AssetDescription; "Asset Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AssetSerialNo; "Asset Serial No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResponsibleEmployeeCode; "Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Directorate; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate';
                    Editable = false;
                }
                field(DirectorateName; "Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Name';
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DateofOccurence; "Date of Occurence")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                    Caption = 'Report Description';
                    Editable = false;
                }
                field(IncidenceDescription; "Incidence Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ActionDescription; "Action Description")
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
    end;

    var
        HREmp: Record 52193433;
}

