#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194072 "HR Disciplinary Cases List"
{
    ApplicationArea = Basic;
    CardPageId = "HR Disciplinary Cases";
    PageType = List;
    SourceTable = "HR Employees";
    UsageCategory = Lists;
    Caption = 'HR Disciplinary Cases List';
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(EmpNames; EmpNames)
                {
                    ApplicationArea = Basic;
                    Caption = 'Name';
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Postal Address"; Rec."Postal Address")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Postal Address field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("Cell Phone Number"; Rec."Cell Phone Number")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Cell Phone Number field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1000000001; Outlook) { }
            systempart(Control1000000002; Notes) { }
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
                                HRDisciplinary.Status := HRDisciplinary.Status::Closed;
                                HRDisciplinary.Modify();
                                HRDisciplinary."Closed By" := Rec."Employee UserID";
                            end else begin
                                HRDisciplinary.Status := HRDisciplinary.Status::Open;
                                HRDisciplinary.Modify();
                                HRDisciplinary."Closed By" := Rec."Employee UserID";
                            end;

                        end else
                            Error('No disciplinary case selected');
                    end;
                }
            }
        }
        area(Reporting)
        {
            action("Disciplinary Cases")
            {
                ApplicationArea = Basic;
                Caption = 'Disciplinary Cases';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = report "HR Disciplinary Cases";
                ToolTip = 'Executes the Disciplinary Cases action.';
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
        HREmp: Record "HR Employees";
        EmpNames: Text[40];
        HRDisciplinary: Record "HR Disciplinary Cases";
        Number: Integer;
}
