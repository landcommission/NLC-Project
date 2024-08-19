#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69200 "HR Disciplinary Cases"
{
    PageType = Card;
    SourceTable = "HR Employees";
    ApplicationArea = All;
    Caption = 'HR Disciplinary Cases';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(EmpNames; EmpNames)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the postal code.';
                }
                // field("Phone No."; Rec."Phone No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the employee''s telephone number.';
                // }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
            part("Case Details"; "HR Disciplinary Cases Listpart")
            {
                Caption = 'Case Details';
                SubPageLink = "Employee No" = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000001; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000002; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("&Mark as Closed/Open")
                {
                    ApplicationArea = Basic;
                    Caption = '&Mark as Closed/Open';
                    ToolTip = 'Executes the &Mark as Closed/Open action.';
                    trigger OnAction()
                    begin
                        HRDisciplinary.Reset();
                        HRDisciplinary.SetRange(HRDisciplinary.Selected, true);
                        HRDisciplinary.SetRange(HRDisciplinary."Employee No", Rec."No.");
                        if HRDisciplinary.Find('-') then begin

                            //ENSURE SELECTED RECORDS DO NOT EXCEED ONE
                            Number := 0;
                            Number := HRDisciplinary.Count;
                            if Number > 1 then
                                Error('You cannot have more than one application selected');
                            // ERROR(FORMAT(Number)+' applications selected');
                            if HRDisciplinary.Status = HRDisciplinary.Status::Open then begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Submitted;
                                HRDisciplinary.Modify();
                                HRDisciplinary."Closed By" := UserId;
                            end else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify();
                                HRDisciplinary."Closed By" := UserId;
                            end;

                        end else
                            Error('No disciplinary case selected');
                    end;
                }
                action(Attachments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachments';
                    Image = Attachments;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = page "Employee Discplinary Documents";
                    RunPageLink = "Doc No." = field("No.");
                    ToolTip = 'Executes the Attachments action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        HREmp.Reset();
        if HREmp.Get(Rec."No.") then
            EmpNames := HREmp."First Name" + ' ' + HREmp."Middle Name" + ' ' + HREmp."Last Name"
        else
            EmpNames := '';
    end;

    var
        HREmp: Record Employee;
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
}

#pragma implicitwith restore

