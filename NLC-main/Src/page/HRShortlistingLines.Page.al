#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193500 "HR Shortlisting Lines"
{
    Caption = 'Shorlisted Candidates';
    Editable = true;
    PageType = List;
    SourceTable = "HR Shortlisted Applicants";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {

                field("Job applied"; "Job applied")
                {
                    ApplicationArea = all;
                }
                field(Qualified; Rec.Qualified)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualified';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Qualified field.';
                    trigger OnValidate()
                    begin
                        Rec."Manual Change" := true;
                        Rec.Modify();
                    end;
                }
                field("Job Application No"; Rec."Job Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Application No field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("ID No"; Rec."ID No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID No field.';
                }
                field(Disability; Rec.Disability)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability field.';
                }
                field("Employee Requisition No"; Rec."Employee Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Requisition No field.';
                }
            }
        }
    }

    actions { }

    var
        MyCount: Integer;


    procedure GetApplicantNo() AppicantNo: Code[20]
    begin
        //AppicantNo:=Applicant;
    end;
}
