#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50142 "Disposal Plan Lines Portal"
{
    PageType = List;
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
                }
                field("Line No."; "Line No.")
                {
                    ApplicationArea = Basic;
                }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    // TableRelation = "Fixed Asset"."No." where("Asset Movement Status" = const(Available),
                    //                                            "Global Dimension 1 Code" = field("Shortcut dimension 1 code"));
                }
                field("Location Code"; "Location Code")
                {
                    ApplicationArea = Basic;
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
                    Editable = true;
                }
                field("Unit of Measure"; "Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Quantity)
                {
                    ApplicationArea = Basic;
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
                field("Disposal Period"; "Disposal Period")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field("Reason for Disposal"; "Reason for Disposal")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut dimension 1 code"; "Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut dimension 2 code"; "Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Approved; Approved)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Disposal Comments"; "Disposal Comments")
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
        "Disposal Type" := "disposal type"::Departmental;

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
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Disposal Type" := "disposal type"::Departmental;

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
    end;

    var
        HREmp: Record 52193433;
}

