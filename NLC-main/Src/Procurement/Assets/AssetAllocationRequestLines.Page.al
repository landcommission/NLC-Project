#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50128 "Asset Allocation Request Lines"
{
    Caption = 'Asset Issue Request Line';
    DeleteAllowed = true;
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
                    Visible = false;
                }
                field("Asset No"; "Asset Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset No';
                }
                field(AssetDescription; "Asset Description")
                {
                    ApplicationArea = Basic;
                }
                field("Asset Tag No"; "Tag No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Asset Tag No';
                }
                field(AssetSerialNo; "Asset Serial No")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate';
                }
                field(DirectorateName; "Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Name';
                }
                field(Store; Store)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin


        if Status <> Status::Open then
            Error('You are not allowed to delete at this level')
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin



        //Control: Don't Post Same Asset Twice NOT GL's
        TransLine.Reset;
        TransLine.SetRange(TransLine."No.", "No.");
        TransLine.SetRange(TransLine."Asset Code", "Asset Code");
        if TransLine.Find('-') then begin
            Error('You Cannot enter two lines for the same Asset');
        end;
    end;

    trigger OnModifyRecord(): Boolean
    begin

        if Status <> Status::Open then
            Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        //Control: Don't Post Same Asset Twice NOT GL's
        TransLine.Reset;
        TransLine.SetRange(TransLine."No.", "No.");
        TransLine.SetRange(TransLine."Asset Code", "Asset Code");
        if TransLine.Find('-') then begin
            Error('You Cannot enter two lines for the same Asset');
        end;
    end;

    var
        TransLine: Record "HR Asset Transfer Lines";
}

