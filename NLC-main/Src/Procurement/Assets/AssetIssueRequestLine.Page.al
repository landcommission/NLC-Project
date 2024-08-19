#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50072 "Asset Issue Request Line"
{
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
                field(AssetNo;"Asset No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Fixed Asset"."No." where ("Asset Movement Status"=filter(Issued),
                                                               "Global Dimension 2 Code"=field("Global Dimension 2 Code"));
                }
                field(Description;"Asset Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field(SerialNo;"Asset Serial No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Serial No';
                }
                field(UserStatus;"User Status")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approval Status';
                }
                field(StaffNo;"Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff No';
                }
                field(CountyCode;"Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Code';
                }
                field(CountyName;"Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'County Name';
                }
                field(DirectorateCode;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Code';
                }
                field(DirectorateName;"Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Directorate Name';
                }
                field(Remarks;Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(NewResponsibleEmployeeCode;"New Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(Approved;Approved)
                {
                    ApplicationArea = Basic;
                }
                field(NewEmployeeName;"New Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(StaffName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Name';
                    Editable = true;
                }
                field(NewGlobalDimension2Code;"New Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(NewDimension1Name;"New  Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                }
                field(NewDimension2Name;"New  Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                }
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(LineNo;"Line No")
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
              CalcFields(Status);
        if Status<>Status::Open then
             Error('You are not allowed to delete at this level')
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

            CalcFields(Status);
         if Status<>Status::Open then
           Error('You are not allowed to insert at this level')
    end;

    trigger OnModifyRecord(): Boolean
    begin
            CalcFields(Status);
        if Status<>Status::Open then
          Error('You are not allowed to modify at this level')
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
           CalcFields(Status);
        if Status<>Status::Open then
           Error('You are not allowed to insert at this level')
    end;
}

