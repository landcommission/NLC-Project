#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193648 "Employee Grades2"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Employee Grades2.rdlc';
    ApplicationArea = All;
    Caption = 'Employee Grades2';
    dataset
    {
        dataitem("HR Lookup Values"; "HR Lookup Values")
        {
            column(ReportForNavId_1; 1) { }
            column(Type_HRLookupValues; "HR Lookup Values".Type) { }
            column(Code_HRLookupValues; "HR Lookup Values".Code) { }
            column(Description_HRLookupValues; "HR Lookup Values".Description) { }
            column(Counter; Counter) { }
            column(Counter1A; Counter1A) { }
            column(Counter2; Counter2) { }
            column(Counter3; Counter3) { }
            column(Counter4; Counter4) { }
            column(Counter5; Counter5) { }
            column(Counter6; Counter6) { }
            column(Counter7; Counter7) { }
            column(Counter8; Counter8) { }
            column(COMMISSIONERS; COMMISSIONERS) { }
            column(Total; Total) { }
            column(Counter97; Counter97) { }
            column(Counter9; Counter9) { }
            column(Picture; CompanyInformation.Picture) { }

            trigger OnAfterGetRecord()
            begin
                // HRLookupValues.GET()
                Counter := 0;
                Counter1A := 0;
                Counter2 := 0;
                Counter3 := 0;
                Counter4 := 0;
                Counter5 := 0;
                Counter6 := 0;
                Counter7 := 0;
                Counter8 := 0;
                COMMISSIONERS := 0;
                Total := 0;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC1');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;


                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC1A');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter1A := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC2');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter2 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC3');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter3 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC4');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter4 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC5');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter5 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;


                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC6');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter6 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC7');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter7 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;
                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC8');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter8 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;

                HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
                HREmp.SetFilter(HREmp.Grade, 'NLC9');
                //HREmp.SETFILTER(HREmp.Grade,'<>%1',(HREmp."Contract Type"::Intern));
                if HREmp.Find('-') then begin
                    repeat
                    until HREmp.Next() = 0;
                    Counter9 := HREmp.Count;
                    //  Error('[%1] Employees have been notified about this vacancy',HREmp.COUNT);
                end;



                Counter97 := Counter9 + Counter8 + Counter7;

                Total := Counter + Counter1A + Counter2 + Counter3 + Counter4 + Counter5 + Counter6 + Counter97;
            end;
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
        CompanyInformation.Get();
        CompanyInformation.CalcFields(CompanyInformation.Picture);
    end;

    var
        HREmp: Record "HR Employees";
        HRLookupValues: Record "HR Lookup Values";
        Counter: Integer;
        Counter1A: Integer;
        Counter2: Integer;
        Counter3: Integer;
        Counter4: Integer;
        Counter5: Integer;
        Counter6: Integer;
        Counter7: Integer;
        Counter8: Integer;
        COMMISSIONERS: Integer;
        Total: Integer;
        Counter97: Integer;
        Counter9: Integer;
        CompanyInformation: Record "Company Information";
}
