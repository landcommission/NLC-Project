#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193546 "Hr Retirement Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Hr Retirement Report.rdlc';
    UsageCategory = Lists;
    ApplicationArea = All;
    Caption = 'Hr Retirement Report';
    dataset
    {
        dataitem("HR Employees"; "HR Employees")
        {
            DataItemTableView = where(Status = const(Active));
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            var
                DateCal: Decimal;
                RetireAg: Decimal;
            begin
                hrsetup.Get();


                "HR Employees".Reset();
                "HR Employees".SetFilter("HR Employees"."No.", '1984127232');
                //HREmp.SETFILTER(HREmp."Last Notif Date",'<>%1',TODAY);
                "HR Employees".SetRange("HR Employees".Status, "HR Employees".Status::Active);
                //IF HREmp.FIND('-') THEN BEGIN
                //REPEAT
                CYR := Date2DMY(Today, 3);
                DOB := Date2DMY("HR Employees"."Date Of Birth", 3);
                myAge := CYR - DOB;

                myAgeText := Format(myAge) + ' ' + 'Years';
                "HR Employees".DAge := Format(myAge);
                //DAges:=HRDates.DetermineAge("Date Of Birth",TODAY);
                Evaluate(DateCal, Format(HRSetup."Retirement Age"));
                RetireAg := DateCal;

                RetirementPeriod := RetireAg - myAge;
                //PeriodText:=COPYSTR(FORMAT(RetirementPeriod),1,Pos)+' Years ';
                PeriodText := RetirementPeriod;
                PeriodText_Text := Format(PeriodText) + ' ' + 'Years';
                //ERROR('%1%2%3',DOB,myAge,RetirementPeriod);
                //DAges:=HRDates.DetermineAge("Date Of Birth",TODAY);

                /*{
                Pos:=STRPOS(FORMAT(RetirementPeriod),'.');
                IF Pos=0 THEN Pos:=1;
                RetirementPeriod:=hrsetup."Retirement Age"-(TODAY-"HR Employees"."Date Of Birth")/365;
                //PeriodText:=COPYSTR(FORMAT(RetirementPeriod),1,Pos)+' Years '+COPYSTR(FORMAT(RetirementPeriod),Pos+1,1)+' Months'
                ERROR('%1',RetirementPeriod);
                }*/

                if RetirementPeriod <= 3 then begin
                    HREmailParameters.Reset();
                    HREmailParameters.SetRange(HREmailParameters."Associate With", HREmailParameters."Associate With"::Retirement);
                    if HREmailParameters.Find('-') then
                        // Employee
                        "HR Employees".TestField("HR Employees"."Company E-Mail");
                    //SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address","HR Employees"."Company E-Mail",
                    //HREmailParameters.Subject,'Dear'+' '+ "HR Employees"."First Name" +' '+
                    //HREmailParameters.Body+' '+ "HR Employees".DAge+','+' You are due to retire in the next '+PeriodText_Text ,true);
                    //HREmailParameters.Body+' ' +myAgeText+' you are due to retire in the next '+PeriodText_Text ,TRUE);
                    //SMTP.Send();
                    /*{
                     // HR
                    SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",'njoseph41@gmail.com',
                    //HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
                    HREmailParameters.Subject,
                    HREmailParameters."Body 2"+' '+HREmp."First Name" +' '+ HREmp."Middle Name" +' '+HREmp."Last Name"+'  '+ 'Designation:'+' '+HREmp."Job Title"+'  '+'Retires in the next '+PeriodText_Text ,TRUE);
                   // HREmailParameters.Body+' '+ 'Age: ' +myAgeText+' Remaining Days to Retirement: '+PeriodText_Text ,TRUE);
                  SMTP.Send();
                    }*/
                end;
                //HREmp."Last Notif Date":=0D;
                //HREmp.MODIFY;
                //UNTIL HREmp.NEXT=0;
                //MESSAGE('All Employees due to retire have been notified ');

                //MESSAGE('%1%2%3%4%5',HREmp."No.",myAgeText);
                //END;

            end;
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        hrsetup: Record "HR Setup";
        HREmp: Record "HR Employees";
        //SMTP: Codeunit "SMTP Mail";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRDates: Codeunit "HR Dates";
        DAge: Text[100];
        FilterAge: Decimal;
        RetirementPeriod: Decimal;
        PeriodText: Integer;
        Pos: Integer;
        DOB: Integer;
        CYR: Integer;
        myAge: Integer;
        myAgeText: Text;
        PeriodText_Text: Text;
        DAges: Text;
        RetirementPeriods: Text;


    procedure Notify_Retired()
    var
        //SMTP: Codeunit "SMTP Mail";
        HREmp: Record "HR Employees";
        HREmailParameters: Record "HR E-Mail Parameters";
        HRDates: Codeunit "HR Dates";
        HRSetup: Record "HR Setup";
        DAge: Text[100];
        FilterAge: Decimal;
        RetirementPeriod: Decimal;
        PeriodText: Integer;
        Pos: Integer;
        DOB: Integer;
        CYR: Integer;
        myAge: Integer;
        myAgeText: Text;
        PeriodText_Text: Text;
    begin


        /*{

         {
        IF HREmp."Date Of Birth" = 0D THEN
        BEGIN
        SETRANGE("Date Filter",0D,WORKDATE - 1);
          CurrReport.SKIP;
        END ELSE
        }
     HRSetup.GET();
     HREmp.RESET;
     //HREmp.SETFILTER(HREmp."Last Notif Date",'<>%1',TODAY);
     HREmp.SETRANGE(HREmp."No.",'1990143678');

     IF HREmp.FIND('-') THEN BEGIN
     REPEAT
     CYR:=DATE2DMY(TODAY,3);
     DOB:=DATE2DMY(HREmp."Date Of Birth",3);
     myAge:=CYR-DOB;

           myAgeText:=FORMAT(myAge) + ' ' + 'Years';
           DAge:=FORMAT(myAge);

           RetirementPeriod:=HRSetup."Retirement Age"-myAge;

           //PeriodText:=COPYSTR(FORMAT(RetirementPeriod),1,Pos)+' Years ';
           PeriodText:=RetirementPeriod;
           PeriodText_Text:=FORMAT(PeriodText) + ' ' + 'Years';
     IF RetirementPeriod<=1 THEN BEGIN
     HREmailParameters.RESET;
     HREmailParameters.SETRANGE(HREmailParameters."Associate With",HREmailParameters."Associate With"::Retirement);
     IF HREmailParameters.FIND('-') THEN
     BEGIN
          // Employee
          HREmp.TESTFIELD(HREmp."Company E-Mail");
          SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",HREmp."Company E-Mail",
          HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
          HREmailParameters.Body+' ' +myAgeText+' you are due to retire in the next '+PeriodText_Text ,TRUE);
          //////SMTP.Send();
          // HR

          SMTP.CreateMessage(HREmailParameters."Sender Name",HREmailParameters."Sender Address",'erpnotifications@cak.go.ke',
          //HREmailParameters.Subject,'Dear'+' '+ HREmp."First Name" +' '+
          HREmailParameters.Subject,
          HREmailParameters."Body 2"+' '+HREmp."First Name" +' '+ HREmp."Middle Name" +' '+HREmp."Last Name"+'  '+ 'Designation:'+' '+HREmp."Job Title"+'  '+'Retires in the next '+PeriodText_Text ,TRUE);
         // HREmailParameters.Body+' '+ 'Age: ' +myAgeText+' Remaining Days to Retirement: '+PeriodText_Text ,TRUE);
            //////SMTP.Send();
     END;
     END;
     //HREmp."Last Notif Date":=0D;
     HREmp.MODIFY;
     UNTIL HREmp.NEXT=0;
     MESSAGE('All Employees due to retire have been notified ');
     END;
        }*/

    end;
}
