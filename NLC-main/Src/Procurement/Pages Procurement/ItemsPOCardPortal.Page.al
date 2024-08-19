#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50079 "Items PO Card Portal"
{
    Caption = 'Items PO Card';
    DeleteAllowed = true;
    Editable = true;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Store Requistion Headers";
    SourceTableView = where("Document Type" = const(PR),
                            "Action Type" = const(Item));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field("Request date"; "Request date")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Code"; "Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Function Name"; "Function Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Center Name"; "Budget Center Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Description';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field("Requester ID"; "Requester ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                    Enabled = true;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Store; "Issuing Store")
                {
                    ApplicationArea = Basic;
                    Caption = 'Receiving Store';
                }
                field("Required Date"; "Required Date")
                {
                    ApplicationArea = Basic;
                }
                field("Supplier No."; "Vendor No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Supplier No.';

                    trigger OnValidate()
                    begin

                        if Vend.Get("Vendor No.") then begin
                            "Vendor Name" := Vend.Name
                        end
                        else
                            "Vendor Name" := '-';
                    end;
                }
                field(Currency; Currency)
                {
                    ApplicationArea = Basic;
                }
                field("Order Date"; "Order Date")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; TotalAmount)
                {
                    ApplicationArea = Basic;
                }
                field("Purchase Order No"; "Purchase Order No")
                {
                    ApplicationArea = Basic;
                }
                field("Action Type"; "Action Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord()
    begin
        //"Approval Status":=Status
    end;

    trigger OnAfterGetRecord()
    begin
        //CurrPageUpdate;

        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item
        //"Approval Status":=Status
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item;
        /*
       RequisitionHeader.RESET;
       RequisitionHeader.SETRANGE("User ID",USERID);
       RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
       RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
       IF RequisitionHeader.FINDFIRST THEN
          ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
         */

    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        /*
        "Responsibility Center" := UserMgt.GetPurchasesFilter();
         //Add dimensions if set by default here
         "Global Dimension 1 Code":=UserMgt.GetSetDimensions(USERID,1);
         VALIDATE("Global Dimension 1 Code");
         "Shortcut Dimension 2 Code":=UserMgt.GetSetDimensions(USERID,2);
         VALIDATE("Shortcut Dimension 2 Code");
         "Shortcut Dimension 3 Code":=UserMgt.GetSetDimensions(USERID,3);
         VALIDATE("Shortcut Dimension 3 Code");
         "Shortcut Dimension 4 Code":=UserMgt.GetSetDimensions(USERID,4);
         VALIDATE("Shortcut Dimension 4 Code");
        */

        //UpdateControls;


        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item;
        /*
        RequisitionHeader.RESET;
        RequisitionHeader.SETRANGE("User ID",USERID);
        RequisitionHeader.SETRANGE(Status,RequisitionHeader.Status::Open);
        RequisitionHeader.SETRANGE("Document Type",RequisitionHeader."Document Type"::PR);
        IF RequisitionHeader.FINDFIRST THEN
           ERROR('you cannot open another document when %1 is still %2',RequisitionHeader."No.",FORMAT(RequisitionHeader.Status));
         */

    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        //UpdateControls;
    end;

    trigger OnOpenPage()
    begin
        /*
        IF UserMgt.GetPurchasesFilter() <> '' THEN BEGIN
          FILTERGROUP(2);
          SETRANGE("Responsibility Center" ,UserMgt.GetPurchasesFilter());
          FILTERGROUP(0);
        END;
        */

        "Document Type" := "document type"::PR;
        "Action Type" := "action type"::Item
        // "Approval Status":=Status

    end;

    var
        UserMgt: Codeunit 52193453;
        ApprovalMgt: Codeunit 439;
        ReqLine: Record "Store Requistion Line";
        InventorySetup: Record 313;
        GenJnline: Record "Item Journal Line";
        LineNo: Integer;
        Post: Boolean;
        JournlPosted: Codeunit 52193452;
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,GrantTask,"Concept Note",Proposal,"Job Approval",Discip,GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,CashP,LeaveReim,Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS,PReq,SReq;
        HasLines: Boolean;
        AllKeyFieldsEntered: Boolean;
        ApprovalEntries: Page "Approval Entries";
        StatusEditable: Boolean;
        RequisitionHeader: Record "Store Requistion Headers";
        ItemLedger: Record "Item Ledger Entry";
        filemnt: Codeunit 419;
        selectedFile: Text;
        ToFile: Text;
        AllQuantityInspectedEntered: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text[250];
        NVInStream: InStream;
        Vend: Record Vendor;


    procedure LinesExists(): Boolean
    var
        PayLines: Record "Store Requistion Line";
    begin
        HasLines := false;
        PayLines.Reset;
        PayLines.SetRange(PayLines."Requistion No", "No.");
        if PayLines.Find('-') then begin
            HasLines := true;
            exit(HasLines);
        end;
    end;


    procedure UpdateControls()
    begin
        if Status = Status::Open then
            StatusEditable := true
        else
            StatusEditable := false;
    end;


    procedure CurrPageUpdate()
    begin
        xRec := Rec;
        UpdateControls;
        CurrPage.Update;
    end;

    local procedure replaceString(String: Text[50]; FindWhat: Text[10]; ReplaceWith: Text[10]) NewString: Text
    begin
        while StrPos(String, FindWhat) > 0 do
            String := DelStr(String, StrPos(String, FindWhat)) + ReplaceWith + CopyStr(String, StrPos(String, FindWhat) + StrLen(FindWhat));
        NewString := String;
    end;


    procedure EnterQuantityInspected(): Boolean
    var
        PayLines: Record 52193604;
    begin

        AllQuantityInspectedEntered := true;
        ReqLine.Reset;
        ReqLine.SetRange(ReqLine."Requistion No", "No.");
        if ReqLine.Find('-') then begin
            repeat
                if ReqLine."Quantity Requested" = 0 then
                    AllQuantityInspectedEntered := false;
            until ReqLine.Next = 0;
            exit(AllQuantityInspectedEntered);
        end;
    end;
}

