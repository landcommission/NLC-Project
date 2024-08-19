#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194192 "PR Salary Arrears2"
{
    PageType = List;
    SourceTable = "PR Salary Arrears22";
    ApplicationArea = All;
    Caption = 'PR Salary Arrears2';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Employeee Code"; Rec."Employeee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employeee Code field.';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Code field.';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Stop For Next Period"; Rec."Stop For Next Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stop For Next Period field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Process Arrears")
            {
                ApplicationArea = Basic;
                Caption = 'Process Arrears';
                Image = CalculateWhseAdjustment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Process Arrears action.';
                trigger OnAction()
                var
                    Text000: Label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin
                    PRSalaryArrears.Reset();
                    PRSalaryArrears.SetRange(PRSalaryArrears."Employeee Code", 'NLC20160473');
                    if PRSalaryArrears.Find('-') then
                        if PRSalaryCard.Get(PRSalaryArrears."Employeee Code") then begin
                            HREmployeePR.Reset();
                            HREmployeePR.SetRange(HREmployeePR."No.", PRSalaryArrears."Employeee Code");
                            if HREmployeePR.Find('-') then begin
                                ProgressWindow.Open('Processing Salary #1#################################################################');
                                repeat
                                    ProgressWindow.Update(1, HREmployeePR."No." + ':' + HREmployeePR."Full Name");
                                    if PRSalaryCard.Get(HREmployeePR."No.") then begin
                                        //// ProcessPayroll.fnProcesspayroll(HREmployeePR."No.",HREmployeePR."Date Of Joining the Company"
                                        /// ,PRSalaryCard."Basic Pay",PRSalaryCard."Pays PAYE",PRSalaryCard."Pays NSSF",PRSalaryCard."Pays NHIF"
                                        //// ,PRSalaryArrears."Payroll Period",PRSalaryArrears."Payroll Period",'','',HREmployeePR."Date Of Leaving",TRUE,
                                        ///  HREmployeePR."Department Code",PRSalaryCard."Insurance Certificate?",TRUE);
                                    end else
                                        ;
                                //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                until HREmployeePR.Next() = 0;
                                ProgressWindow.Close();
                            end;

                            Commit();

                            //CODEUNIT
                            PRSalaryCard.Reset();
                            PRSalaryCard.SetRange("Employee Code", PRSalaryArrears."Employeee Code");
                            PRSalaryCard.SetRange(PRSalaryCard."Period Filter", PRSalaryArrears."Payroll Period");

                            //AFTER SUCCESS PROCSSING PRINT INDIVIDUAL PAYSLIP
                            Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);
                        end;
                end;
            }
        }
    }

    var
        PRSalaryCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        ProcessPayroll: Codeunit "PR Payroll Processing";
        ProgressWindow: Dialog;
        PRSalaryArrears: Record "PR Salary Arrears22";
        BPAY: Decimal;
        PRTransCode: Record "PR Transaction Codes";
        HREmployeePR: Record "HR Employees";
}
