#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50144 "Disposal Plans Card Portal"
{
    SourceTable = "Disposal Plan Table Headers";

    layout
    {
        area(content)
        {
            group(Control21)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                    Caption = 'Document Date';
                }
                field("Disposal Year"; "Disposal Year")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Disposal Description"; "Disposal Description")
                {
                    ApplicationArea = Basic;
                }
                field(Department; "Shortcut dimension 1 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'County';
                }
                field(County; "Shortcut dimension 2 code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department';
                }
                field("Responsibility Center"; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
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
        ApprovalMgt: Codeunit 439;
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blan Order",Ret,"None",PV,PettyC,Imp,Rn,ImpS,InterB,Receipt,StaffA,Staff,AdvSurr,Bank,Grant,Gran,EmpReq,"Leave Application","Training Requisition","Transport Requisition",JV,"Grant Task","Concept Note",Proposal,"Job Approval","Disciplinary Approvals",GRN,Clearence,Donation,Transfer,PayChange,Budget,GL,"Staff Advance","Leave Reimburse",Appraisal,Inspection,Closeout,"Lab Request",ProposalProjectsAreas,"Leave Carry over","IB Transfer",EmpTrans,LeavePlanner,HrAssetTrans,Contract,Project,MR,Inves,PB,Prom,Ind,Conf,BSC,OT,Jobsucc,SuccDet,Qual,Disc,Clear,"Short Train","Long Train",Emp,Compass,Employee,PC,Sep,Pool,TS;
        CompanyInfo: Record "Company Information";
        Link: Text;
        ReqLine: Record "Disposal plan table line";
        ItemRec: Record Item;
        AssetRec: Record "Fixed Asset";
        HREmp: Record 52193433;
}

