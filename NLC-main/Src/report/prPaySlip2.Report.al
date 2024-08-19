#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193516 prPaySlip2
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/prPaySlip2.rdlc';
    ApplicationArea = All;
    Caption = 'prPaySlip2';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "Current Month Filter", Status, "Location/Division Code", "Responsibility Center", "Cost Center Code", "Salary Grade", "Salary Notch/Step", "No.";
            column(ReportForNavId_8631; 8631) { }
            column(CompanyInfo_Name; CompanyInfo.Name) { }
            column(CompanyInfo_Picture; CompanyInfo.Picture) { }
            column(HR_Employee_No_; "HR Employees"."No.") { }
            column(PeriodName; PeriodName) { }
            column(strAccountNo; strAccountNo) { }
            dataitem("PR Salary Card"; "PR Salary Card")
            {
                DataItemLink = "Employee Code" = field("No."), "Period Filter" = field("Current Month Filter");
                DataItemTableView = sorting("Employee Code") order(ascending);
                column(ReportForNavId_6207; 6207) { }
                column(Trans_1__1_; Trans[1] [1]) { }
                column(TransAmt_1__1_; TransAmt[1] [1]) { }
                column(TransBal_1__1_; TransBal[1] [1]) { }
                column(TransBal_1__2_; TransBal[1] [2]) { }
                column(TransAmt_1__2_; TransAmt[1] [2]) { }
                column(Trans_1__2_; Trans[1] [2]) { }
                column(TransBal_1__3_; TransBal[1] [3]) { }
                column(TransAmt_1__3_; TransAmt[1] [3]) { }
                column(Trans_1__3_; Trans[1] [3]) { }
                column(TransBal_1__4_; TransBal[1] [4]) { }
                column(TransBal_1__5_; TransBal[1] [5]) { }
                column(TransBal_1__6_; TransBal[1] [6]) { }
                column(TransAmt_1__4_; TransAmt[1] [4]) { }
                column(TransAmt_1__5_; TransAmt[1] [5]) { }
                column(TransAmt_1__6_; TransAmt[1] [6]) { }
                column(Trans_1__4_; Trans[1] [4]) { }
                column(Trans_1__5_; Trans[1] [5]) { }
                column(Trans_1__6_; Trans[1] [6]) { }
                column(TransBal_1__7_; TransBal[1] [7]) { }
                column(TransBal_1__8_; TransBal[1] [8]) { }
                column(TransBal_1__9_; TransBal[1] [9]) { }
                column(TransAmt_1__7_; TransAmt[1] [7]) { }
                column(TransAmt_1__8_; TransAmt[1] [8]) { }
                column(TransAmt_1__9_; TransAmt[1] [9]) { }
                column(Trans_1__7_; Trans[1] [7]) { }
                column(Trans_1__8_; Trans[1] [8]) { }
                column(Trans_1__9_; Trans[1] [9]) { }
                column(TransBal_1__10_; TransBal[1] [10]) { }
                column(TransBal_1__12_; TransBal[1] [12]) { }
                column(TransBal_1__13_; TransBal[1] [13]) { }
                column(TransAmt_1__10_; TransAmt[1] [10]) { }
                column(TransAmt_1__12_; TransAmt[1] [12]) { }
                column(TransAmt_1__13_; TransAmt[1] [13]) { }
                column(Trans_1__10_; Trans[1] [10]) { }
                column(Trans_1__12_; Trans[1] [12]) { }
                column(Trans_1__13_; Trans[1] [13]) { }
                column(TransBal_1__14_; TransBal[1] [14]) { }
                column(TransBal_1__15_; TransBal[1] [15]) { }
                column(TransBal_1__16_; TransBal[1] [16]) { }
                column(TransBal_1__17_; TransBal[1] [17]) { }
                column(TransBal_1__18_; TransBal[1] [18]) { }
                column(TransBal_1__19_; TransBal[1] [19]) { }
                column(TransBal_1__11_; TransBal[1] [11]) { }
                column(TransBal_1__20_; TransBal[1] [20]) { }
                column(TransAmt_1__14_; TransAmt[1] [14]) { }
                column(TransAmt_1__15_; TransAmt[1] [15]) { }
                column(TransAmt_1__16_; TransAmt[1] [16]) { }
                column(TransAmt_1__17_; TransAmt[1] [17]) { }
                column(TransAmt_1__18_; TransAmt[1] [18]) { }
                column(TransAmt_1__19_; TransAmt[1] [19]) { }
                column(TransAmt_1__11_; TransAmt[1] [11]) { }
                column(TransAmt_1__20_; TransAmt[1] [20]) { }
                column(Trans_1__14_; Trans[1] [14]) { }
                column(Trans_1__15_; Trans[1] [15]) { }
                column(Trans_1__16_; Trans[1] [16]) { }
                column(Trans_1__17_; Trans[1] [17]) { }
                column(Trans_1__18_; Trans[1] [18]) { }
                column(Trans_1__19_; Trans[1] [19]) { }
                column(Trans_1__11_; Trans[1] [11]) { }
                column(Trans_1__20_; Trans[1] [20]) { }
                column(Addr_1__1_; Addr[1] [1]) { }
                column(Addr_1__2_; Addr[1] [2]) { }
                column(Addr_1__3_; Addr[1] [3]) { }
                column(Addr_1__4_; Addr[1] [4]) { }
                column(TransBal_1__21_; TransBal[1] [21]) { }
                column(TransBal_1__22_; TransBal[1] [22]) { }
                column(TransAmt_1__21_; TransAmt[1] [21]) { }
                column(TransAmt_1__22_; TransAmt[1] [22]) { }
                column(TransBal_1__23_; TransBal[1] [23]) { }
                column(TransAmt_1__23_; TransAmt[1] [23]) { }
                column(TransBal_1__24_; TransBal[1] [24]) { }
                column(TransAmt_1__24_; TransAmt[1] [24]) { }
                column(Trans_1__21_; Trans[1] [21]) { }
                column(Trans_1__23_; Trans[1] [23]) { }
                column(Trans_1__24_; Trans[1] [24]) { }
                column(Trans_1__22_; Trans[1] [22]) { }
                column(TransBal_1__25_; TransBal[1] [25]) { }
                column(TransAmt_1__25_; TransAmt[1] [25]) { }
                column(Trans_1__25_; Trans[1] [25]) { }
                column(TransBal_1__26_; TransBal[1] [26]) { }
                column(TransAmt_1__26_; TransAmt[1] [26]) { }
                column(Trans_1__26_; Trans[1] [26]) { }
                column(TransBal_1__27_; TransBal[1] [27]) { }
                column(TransAmt_1__27_; TransAmt[1] [27]) { }
                column(Trans_1__27_; Trans[1] [27]) { }
                column(TransBal_1__28_; TransBal[1] [28]) { }
                column(TransAmt_1__28_; TransAmt[1] [28]) { }
                column(Trans_1__28_; Trans[1] [28]) { }
                column(TransBal_1__29_; TransBal[1] [29]) { }
                column(TransAmt_1__29_; TransAmt[1] [29]) { }
                column(Trans_1__29_; Trans[1] [29]) { }
                column(TransBal_1__30_; TransBal[1] [30]) { }
                column(TransAmt_1__30_; TransAmt[1] [30]) { }
                column(Trans_1__30_; Trans[1] [30]) { }
                column(TransBal_1__31_; TransBal[1] [31]) { }
                column(TransAmt_1__31_; TransAmt[1] [31]) { }
                column(Trans_1__31_; Trans[1] [31]) { }
                column(TransBal_1__32_; TransBal[1] [32]) { }
                column(TransBal_1__33_; TransBal[1] [33]) { }
                column(TransBal_1__34_; TransBal[1] [34]) { }
                column(TransBal_1__35_; TransBal[1] [35]) { }
                column(TransBal_1__36_; TransBal[1] [36]) { }
                column(TransBal_1__37_; TransBal[1] [37]) { }
                column(TransBal_1__38_; TransBal[1] [38]) { }
                column(TransBal_1__39_; TransBal[1] [39]) { }
                column(TransBal_1__40_; TransBal[1] [40]) { }
                column(TransAmt_1__32_; TransAmt[1] [32]) { }
                column(TransAmt_1__33_; TransAmt[1] [33]) { }
                column(TransAmt_1__34_; TransAmt[1] [34]) { }
                column(TransAmt_1__35_; TransAmt[1] [35]) { }
                column(TransAmt_1__36_; TransAmt[1] [36]) { }
                column(TransAmt_1__37_; TransAmt[1] [37]) { }
                column(TransAmt_1__38_; TransAmt[1] [38]) { }
                column(TransAmt_1__39_; TransAmt[1] [39]) { }
                column(TransAmt_1__40_; TransAmt[1] [40]) { }
                column(Trans_1__32_; Trans[1] [32]) { }
                column(Trans_1__34_; Trans[1] [34]) { }
                column(Trans_1__35_; Trans[1] [35]) { }
                column(Trans_1__33_; Trans[1] [33]) { }
                column(Trans_1__36_; Trans[1] [36]) { }
                column(Trans_1__37_; Trans[1] [37]) { }
                column(Trans_1__38_; Trans[1] [38]) { }
                column(Trans_1__39_; Trans[1] [39]) { }
                column(Trans_1__40_; Trans[1] [40]) { }
                column(Trans_1__45_; Trans[1] [45]) { }
                column(TransAmt_1__45_; TransAmt[1] [45]) { }
                column(TransAmt_1__46_; TransAmt[1] [46]) { }
                column(TransAmt_1__47_; TransAmt[1] [47]) { }
                column(TransAmt_1__48_; TransAmt[1] [48]) { }
                column(TransAmt_1__49_; TransAmt[1] [49]) { }
                column(Trans_1__46_; Trans[1] [46]) { }
                column(Trans_1__47_; Trans[1] [47]) { }
                column(Trans_1__48_; Trans[1] [48]) { }
                column(Trans_1__49_; Trans[1] [49]) { }
                column(TransAmt_1__50_; TransAmt[1] [50]) { }
                column(Trans_1__50_; Trans[1] [50]) { }
                column(Trans_1__51_; Trans[1] [51]) { }
                column(TransBal_1__42_; TransBal[1] [42]) { }
                column(TransAmt_1__42_; TransAmt[1] [42]) { }
                column(Trans_1__42_; Trans[1] [42]) { }
                column(TransBal_1__43_; TransBal[1] [43]) { }
                column(TransAmt_1__43_; TransAmt[1] [43]) { }
                column(Trans_1__43_; Trans[1] [43]) { }
                column(TransBal_1__44_; TransBal[1] [44]) { }
                column(TransAmt_1__44_; TransAmt[1] [44]) { }
                column(Trans_1__44_; Trans[1] [44]) { }
                column(Trans_1__41_; Trans[1] [41]) { }
                column(TransAmt_1__41_; TransAmt[1] [41]) { }
                column(TransBal_1__41_; TransBal[1] [41]) { }
                column(TransBalBF_1__44_; TransBalBF[1] [44]) { }
                column(TransBalBF_1__43_; TransBalBF[1] [43]) { }
                column(TransBalBF_1__42_; TransBalBF[1] [42]) { }
                column(TransBalBF_1__41_; TransBalBF[1] [41]) { }
                column(TransBalBF_1__40_; TransBalBF[1] [40]) { }
                column(TransBalBF_1__39_; TransBalBF[1] [39]) { }
                column(TransBalBF_1__38_; TransBalBF[1] [38]) { }
                column(TransBalBF_1__37_; TransBalBF[1] [37]) { }
                column(TransBalBF_1__36_; TransBalBF[1] [36]) { }
                column(TransBalBF_1__34_; TransBalBF[1] [34]) { }
                column(TransBalBF_1__35_; TransBalBF[1] [35]) { }
                column(TransBalBF_1__33_; TransBalBF[1] [33]) { }
                column(TransBalBF_1__32_; TransBalBF[1] [32]) { }
                column(TransBalBF_1__31_; TransBalBF[1] [31]) { }
                column(TransBalBF_1__28_; TransBalBF[1] [28]) { }
                column(TransBalBF_1__29_; TransBalBF[1] [29]) { }
                column(TransBalBF_1__30_; TransBalBF[1] [30]) { }
                column(TransBalBF_1__27_; TransBalBF[1] [27]) { }
                column(TransBalBF_1__26_; TransBalBF[1] [26]) { }
                column(TransBalBF_1__25_; TransBalBF[1] [25]) { }
                column(TransBalBF_1__24_; TransBalBF[1] [24]) { }
                column(TransBalBF_1__23_; TransBalBF[1] [23]) { }
                column(TransBalBF_1__22_; TransBalBF[1] [22]) { }
                column(TransBalBF_1__21_; TransBalBF[1] [21]) { }
                column(TransBalBF_1__20_; TransBalBF[1] [20]) { }
                column(TransBalBF_1__19_; TransBalBF[1] [19]) { }
                column(TransBalBF_1__18_; TransBalBF[1] [18]) { }
                column(TransBalBF_1__17_; TransBalBF[1] [17]) { }
                column(TransBalBF_1__16_; TransBalBF[1] [16]) { }
                column(TransBalBF_1__15_; TransBalBF[1] [15]) { }
                column(TransBalBF_1__14_; TransBalBF[1] [14]) { }
                column(TransBalBF_1__13_; TransBalBF[1] [13]) { }
                column(TransBalBF_1__12_; TransBalBF[1] [12]) { }
                column(TransBalBF_1__11_; TransBalBF[1] [11]) { }
                column(TransBalBF_1__10_; TransBalBF[1] [10]) { }
                column(TransBalBF_1__9_; TransBalBF[1] [9]) { }
                column(TransBalBF_1__7_; TransBalBF[1] [7]) { }
                column(TransBalBF_1__8_; TransBalBF[1] [8]) { }
                column(TransBalBF_1__6_; TransBalBF[1] [6]) { }
                column(TransBalBF_1__5_; TransBalBF[1] [5]) { }
                column(TransBalBF_1__4_; TransBalBF[1] [4]) { }
                column(TransBalBF_1__3_; TransBalBF[1] [3]) { }
                column(TransBalBF_1__2_; TransBalBF[1] [2]) { }
                column(TransBalBF_1__1_; TransBalBF[1] [1]) { }
                column(Addr_1__5_; Addr[1] [5]) { }
                column(EmptyStringCaption; EmptyStringCaptionLbl) { }
                column(Employee_Caption; Employee_CaptionLbl) { }
                column(Department_Caption; Department_CaptionLbl) { }
                column(Period_Caption; Period_CaptionLbl) { }
                column(P_I_N_No_Caption; P_I_N_No_CaptionLbl) { }
                column(Grade_Step_Caption; Grade_Step_CaptionLbl) { }
                column(prSalary_Card_Employee_Code; "PR Salary Card"."Employee Code") { }

                trigger OnAfterGetRecord()
                begin
                    strNssfNo := '. ';
                    strNhifNo := '. ';
                    strBank := '. ';
                    strBranch := '. ';
                    strAccountNo := '. ';
                    strPin := '. ';

                    RecordNo := RecordNo + 1;
                    ColumnNo := ColumnNo + 1;

                    //Get the staff details (header)
                    objEmp.Reset();
                    objEmp.SetRange(objEmp."No.", "PR Salary Card"."Employee Code");
                    if objEmp.Find('-') then begin
                        //strEmpName:='['+"Employee Code"+'] '+objEmp."Last Name"+' '+objEmp."First Name"+' '+objEmp."Middle Name";
                        strEmpName := objEmp."Last Name" + ' ' + objEmp."First Name" + ' ' + objEmp."Middle Name";
                        strPin := objEmp."PIN No.";
                        dtDOE := objEmp."Date Of Join";
                        strEmplCode := "PR Salary Card"."Employee Code";
                        "PR Salary Card".Status := Format(objEmp.Status);
                        "Served Notice Period" := objEmp."Served Notice Period";
                        GradeStep := objEmp."Salary Grade";// + '/' + objEmp."Salary Notch/Step";
                        DimensionValue.Reset();
                        DimensionValue.SetRange(DimensionValue.Code, "HR Employees"."Responsibility Center");
                        if DimensionValue.Find('-') then
                            dept := DimensionValue.Name;

                        //dept:=objEmp."Department Code";
                        if objEmp."Date Of Leaving" = 0D then
                            dtOfLeaving := DMY2Date(31, 12, 9999)
                        else
                            dtOfLeaving := objEmp."Date Of Leaving";

                        strNssfNo := objEmp."NSSF No.";
                        strNhifNo := objEmp."NHIF No.";
                        strPin := objEmp."PIN No.";

                        PeriodTrans.Reset();
                        PeriodTrans.SetRange(PeriodTrans."Employee Code", "PR Salary Card"."Employee Code");
                        PeriodTrans.SetRange(PeriodTrans."Transaction Code", 'GRATUITY');         //dennis to filter our company deductions
                        if PeriodTrans.Find('-') then
                            repeat
                                GratuityInfo := GratuityInfo + PeriodTrans.Amount;
                            until PeriodTrans.Next() = 0;

                        //Get the staff banks in the payslip - Dennis ***************************************************
                        strBankno := objEmp."Main Bank";
                        strBranchno := objEmp."Branch Bank";
                        bankStruct.Reset();
                        bankStruct.SetRange(bankStruct."Bank Code", strBankno);
                        bankStruct.SetRange(bankStruct."Bank Name", strBranchno);
                        if bankStruct.Find('-') then begin
                            strAccountNo := objEmp."Bank Account Number";
                            strBank := bankStruct."Bank Name";
                            //strBranch:=bankStruct."Branch Name";

                        end;
                        //*************************************************************************************************

                    end;


                    /*If the Employee's Pay is suspended, OR  the guy is active DO NOT execute the following code
                    *****************************************************************************************************/
                    if ("PR Salary Card"."Suspend Pay" = false) then
                        strEmpCode := "PR Salary Card"."Employee Code";
                    /******************************************************************************************************/

                    //Clear headers
                    Addr[ColumnNo] [1] := '';
                    Addr[ColumnNo] [2] := '';
                    Addr[ColumnNo] [3] := '';
                    Addr[ColumnNo] [4] := '';
                    Addr[ColumnNo] [5] := '';

                    //Clear previous Transaction entries 53
                    for intRow := 1 to 53 do begin
                        Trans[ColumnNo, intRow] := '';
                        TransAmt[ColumnNo, intRow] := '';
                        TransBal[ColumnNo, intRow] := '';
                        TransBalBF[ColumnNo, intRow] := '';
                    end;

                    //Get the Statutories totals so as to add to the tot deductions without affecting the TOT-DED amounts - Denno
                    StatutoryAmt := 0;
                    PeriodTrans.Reset();
                    PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                    PeriodTrans."Group Order", PeriodTrans."Sub Group Order", PeriodTrans."Payslip Order");
                    PeriodTrans.SetRange(PeriodTrans."Employee Code", "PR Salary Card"."Employee Code");
                    PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                    PeriodTrans.SetRange(PeriodTrans."Group Text", 'STATUTORIES');
                    PeriodTrans.SetRange(PeriodTrans."Company Deduction", false);         //dennis to filter our company deductions
                    if PeriodTrans.Find('-') then
                        repeat
                            if (PeriodTrans."Group Order" = 7) and (PeriodTrans."Sub Group Order" = 4) then
                                StatutoryAmt := StatutoryAmt + 0
                            else
                                StatutoryAmt := StatutoryAmt + PeriodTrans.Amount;

                        until PeriodTrans.Next() = 0;

                    //Loop through the transactions
                    PeriodTrans.Reset();
                    PeriodTrans.SetCurrentKey(PeriodTrans."Employee Code", PeriodTrans."Period Month", PeriodTrans."Period Year",
                    PeriodTrans."Group Order", PeriodTrans."Sub Group Order", PeriodTrans."Payslip Order");
                    PeriodTrans.SetRange(PeriodTrans."Employee Code", "PR Salary Card"."Employee Code");
                    PeriodTrans.SetRange(PeriodTrans."Payroll Period", SelectedPeriod);
                    PeriodTrans.SetRange(PeriodTrans."Company Deduction", false);         //dennis to filter our company deductions

                    Addr[ColumnNo] [1] := strEmplCode;
                    Addr[ColumnNo] [2] := Format(strEmpName);
                    //Addr[ColumnNo][2] := dept; //Depart
                    Addr[ColumnNo] [3] := PeriodName + ' ' + Format(Date2DMY(SelectedPeriod, 3)); //Period
                    Addr[ColumnNo] [4] := strPin; //Pin
                    Addr[ColumnNo] [5] := GradeStep;

                    Index := 1;
                    strGrpText := '';
                    if PeriodTrans.Find('-') then
                        repeat
                            if PeriodTrans."Transaction Code" <> 'TXCHRG' then   //PKK
                                                                                 //Check if the group has changed
                                if strGrpText <> PeriodTrans."Group Text" then begin
                                    if PeriodTrans."Group Order" <> 1 then begin
                                        Index := Index + 1;
                                        Trans[ColumnNo, Index] := '......................................';
                                        TransAmt[ColumnNo, Index] := '......................................';
                                        TransBal[ColumnNo, Index] := '......................................';
                                    end;

                                    Index := Index + 1;
                                    strGrpText := PeriodTrans."Group Text";
                                    Trans[ColumnNo, Index] := strGrpText;
                                    TransAmt[ColumnNo, Index] := '.';
                                    TransBal[ColumnNo, Index] := '.';



                                    if (strGrpText = 'DEDUCTIONS') then
                                        Index := Index + 1;
                                    TransBalBF[ColumnNo, Index] := 'Bal. BF';


                                    Trans[ColumnNo, Index] := PeriodTrans."Transaction Name";
                                    if PeriodTrans."Transaction Code" = 'TOT-DED' then
                                        Evaluate(TransAmt[ColumnNo, Index], Format(Round(PeriodTrans.Amount + StatutoryAmt, 0.01)))
                                    else
                                        Evaluate(TransAmt[ColumnNo, Index], Format(Round(PeriodTrans.Amount, 0.01)));

                                    if PeriodTrans.Balance = 0 then
                                        Evaluate(TransBal[ColumnNo, Index], Format('                           .'))
                                    else
                                        Evaluate(TransBal[ColumnNo, Index], Format(Round(PeriodTrans.Balance, 0.01)));

                                    //PKK
                                    if (strGrpText = 'DEDUCTIONS') then
                                        if PeriodTrans.Balance <> 0 then
                                            if TransCode.Get(PeriodTrans."Transaction Code") then begin
                                                if TransCode."Balance Type" = TransCode."Balance Type"::Increasing then
                                                    Evaluate(TransBalBF[ColumnNo, Index], Format(Round(PeriodTrans.Balance, 0.01)));
                                                if TransCode."Balance Type" = TransCode."Balance Type"::Reducing then
                                                    Evaluate(TransBalBF[ColumnNo, Index], Format(Round(PeriodTrans.Balance, 0.01)));
                                            end;
                                    //PKK

                                end else begin
                                    Index := Index + 1;
                                    strGrpText := PeriodTrans."Group Text";
                                    Trans[ColumnNo, Index] := PeriodTrans."Transaction Name";

                                    // EVALUATE(TransAmt[ColumnNo,Index],FORMAT(ROUND(PeriodTrans.Amount,0.01)));

                                    if PeriodTrans."Transaction Code" = 'TOT-DED' then
                                        Evaluate(TransAmt[ColumnNo, Index], Format(Round(PeriodTrans.Amount + StatutoryAmt, 0.01)))
                                    else
                                        Evaluate(TransAmt[ColumnNo, Index], Format(Round(PeriodTrans.Amount, 0.01)));


                                    if PeriodTrans.Balance = 0 then
                                        Evaluate(TransBal[ColumnNo, Index], Format('                           .'))
                                    else
                                        Evaluate(TransBal[ColumnNo, Index], Format(Round(PeriodTrans.Balance, 0.01)));
                                    //PKK
                                    if (strGrpText = 'DEDUCTIONS') then
                                        if PeriodTrans.Balance <> 0 then
                                            if TransCode.Get(PeriodTrans."Transaction Code") then begin
                                                if TransCode."Balance Type" = TransCode."Balance Type"::Increasing then
                                                    Evaluate(TransBalBF[ColumnNo, Index], Format(Round(PeriodTrans.Balance, 0.01)));
                                                if TransCode."Balance Type" = TransCode."Balance Type"::Reducing then
                                                    Evaluate(TransBalBF[ColumnNo, Index], Format(Round(PeriodTrans.Balance, 0.01)));

                                            end;
                                    //PKK
                                end;
                        until PeriodTrans.Next() = 0;

                    /*Fill-in the other staff information
                    *******************************************************************************/
                    Index += 1;
                    Trans[ColumnNo, Index] := '......................................';
                    Evaluate(TransAmt[ColumnNo, Index], '......................................');
                    //other staff information not needed Logistics

                    Index += 1;
                    Trans[ColumnNo, Index] := 'Staff Information:';
                    Evaluate(TransAmt[ColumnNo, Index], '.');

                    Index += 1;
                    Trans[ColumnNo, Index] := 'Gratuity Bal';
                    Evaluate(TransAmt[ColumnNo, Index], Format(GratuityInfo));

                    //N.S.S.F No:
                    Index += 1;
                    Trans[ColumnNo, Index] := 'N.S.S.F No:';
                    Evaluate(TransAmt[ColumnNo, Index], Format(strNssfNo));

                    //N.H.I.F No:
                    Index += 1;
                    Trans[ColumnNo, Index] := 'N.H.I.F No:';
                    Evaluate(TransAmt[ColumnNo, Index], Format(strNhifNo));


                    //Bank:
                    Index += 1;
                    Trans[ColumnNo, Index] := 'Bank:';
                    Evaluate(TransAmt[ColumnNo, Index], Format(strBank));

                    //Branch:
                    Index += 1;
                    Trans[ColumnNo, Index] := 'Bank:';
                    Evaluate(TransAmt[ColumnNo, Index], Format(strBranch));

                    //Account No:
                    Index += 1;
                    Trans[ColumnNo, Index] := 'Account No';
                    Evaluate(TransAmt[ColumnNo, Index], Format(strAccountNo));

                    //Payslip message - Denno
                    Index += 1;
                    ControlInfo.Reset();
                    ControlInfo.SetRange(ControlInfo."Primary Key");
                    if ControlInfo.Find('-') then
                        Trans[ColumnNo, Index] := ControlInfo."Payslip Message";
                    //******************************************************************************


                    CompressArray(Addr[ColumnNo]);
                    CompressArray(Trans[ColumnNo]);
                    CompressArray(TransAmt[ColumnNo]);
                    CompressArray(TransBal[ColumnNo]);

                    if (RecordNo = NoOfRecords) and (ColumnNo < 3) then begin
                        for i := ColumnNo + 1 to NoOfColumns do begin
                            Clear(Addr[i]);
                            Clear(Trans[i]);
                            Clear(TransAmt[i]);
                            Clear(TransBal[i]);
                        end;
                        ColumnNo := 0;

                    end else
                        if ColumnNo = NoOfColumns then
                            ColumnNo := 0;


                    ColumnNo := 0;

                end;

                trigger OnPreDataItem()
                begin
                    NoOfRecords := "PR Salary Card".Count;
                    NoOfColumns := 2;

                    strNssfNo := '.';
                    strNhifNo := '.';
                    strBank := '.';
                    strBranch := '.';
                    strAccountNo := '.';
                    strPin := '. ';
                end;
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        /*PeriodFilter:="HR-Employee".GETFILTER("Current Month Filter");//"prSalary Card".GETFILTER("Period Filter");
        IF PeriodFilter='' THEN ERROR('You must specify the period filter');
         */
        SelectedPeriod := "HR Employees".GetRangeMin("Current Month Filter");//"prSalary Card".GETRANGEMIN("Period Filter");
        objPeriod.Reset();
        if objPeriod.Get(SelectedPeriod) then
            PeriodName := objPeriod."Period Name";

        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);

    end;

    var
        Addr: array[2, 10] of Text[250];
        NoOfRecords: Integer;
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        intInfo: Integer;
        i: Integer;
        PeriodTrans: Record "PR Period Transactions";
        intRow: Integer;
        Index: Integer;
        objEmp: Record "HR Employees";
        strEmpName: Text[250];
        strPin: Text[30];
        Trans: array[2, 60] of Text[250];
        TransAmt: array[2, 60] of Text[250];
        TransBal: array[2, 60] of Text[250];
        TransBalBF: array[2, 60] of Text[250];
        strGrpText: Text[100];
        strNssfNo: Text[30];
        strNhifNo: Text[30];
        strBank: Text[100];
        strBranch: Text[100];
        strAccountNo: Text[100];
        strMessage: Text[100];
        PeriodName: Text[30];
        PeriodFilter: Text[30];
        SelectedPeriod: Date;
        objPeriod: Record "PR Payroll Periods";
        dtDOE: Date;
        strEmpCode: Text[30];
        STATUS: Text[30];
        ControlInfo: Record "Control-Information";
        dtOfLeaving: Date;
        "Served Notice Period": Boolean;
        dept: Text[50];
        bankStruct: Record "PR Bank Accounts";
        emploadva: Record "prEmployee Transactions Ads";
        strBankno: Text[30];
        strBranchno: Text[30];
        CompanyInfo: Record "Company Information";
        objOcx: Codeunit "PR Payroll Processing";
        TransCode: Record "PR Transaction Codes";
        DimensionValue: Record "Dimension Value";
        GradeStep: Text[50];
        AccountType: Text[50];
        EmptyStringCaptionLbl: Label '.....................................................................................................';
        Employee_CaptionLbl: Label 'Employee:';
        Department_CaptionLbl: Label 'Department:';
        Period_CaptionLbl: Label 'Period:';
        P_I_N_No_CaptionLbl: Label 'PIN No.:';
        Grade_Step_CaptionLbl: Label 'Grade:';
        strEmplCode: Code[50];
        StatutoryAmt: Decimal;
        GratuityInfo: Decimal;
}
