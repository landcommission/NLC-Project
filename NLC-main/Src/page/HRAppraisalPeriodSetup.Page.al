#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194117 "HR Appraisal Period Setup"
{
    PageType = List;
    SourceTable = "HR Appraisal Period";
    SourceTableView = sorting("Appraisal Period");
    ApplicationArea = All;
    Caption = 'HR Appraisal Period Setup';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Appraisal Period"; Rec."Appraisal Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period field.';
                }
                field("Appraisal Period Description"; Rec."Appraisal Period Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Period Description field.';
                }
                field("Appraisal Type"; Rec."Appraisal Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appraisal Type field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Date opened"; Rec."Date opened")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date opened field.';
                }
                field("Date closed"; Rec."Date closed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date closed field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Open / Close Period")
            {
                ApplicationArea = Basic;
                Caption = 'Open / Close Period';
                Image = Closeperiod;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Open / Close Period action.';
                trigger OnAction()
                begin
                    /*
                    Warn user about the consequence of closure - operation is not reversible.Ask if he is sure about the closure.*/

                    HRSetup.Get();
                    HRSetup.TestField("Appraisal Interval");
                    HRSetup.TestField("Target Setting Month");

                    fnGetOpenPeriod();

                    Question := 'Once a period has been closed it can NOT be opened.\It is assumed that you have filled the score card for the period.\'
                    + 'Do still want to close [' + strPeriodName + ']';





                    Answer := Dialog.Confirm(Question, false);
                    if Answer = true then begin
                        fnCloseAppraisalPeriod_NEW();
                        Message('Process Complete');
                    end else
                        Message('You have selected NOT to Close the period');

                end;
            }
        }
    }

    var
        strPeriodName: Text;
        dtOpenPeriod: Date;
        HRSetup: Record "HR Setup";
        HRAppraisalPeriod_NEW: Record "HR Appraisal Period";
        Question: Text;
        Answer: Boolean;
        HRAppraisalPeriod: Record "HR Appraisal Period";
        "Appraisal Type Option": Option "Appraisal Review","Target Setting","End Year Appraisal";
        ApprasialPeriod: Record "HR Appraisal Period";
        NextPeriod: Date;


    procedure fnGetOpenPeriod()
    begin
        //Get the open/current period
        HRAppraisalPeriod.Reset();
        HRAppraisalPeriod.SetRange(HRAppraisalPeriod.Closed, false);
        if HRAppraisalPeriod.Find('-') then begin
            strPeriodName := HRAppraisalPeriod."Appraisal Period Description";
            dtOpenPeriod := HRAppraisalPeriod."Date opened";
        end;
    end;


    procedure fnCloseAppraisalPeriod()
    var
        newDate: Date;
        newMonth: Integer;
        newYear: Integer;
        "BSC Line": Record "HR Individual Target Line";
        "BSC Line2": Record "HR Individual Target Line";
        "BSC Header": Record "HR Individual Targets Header";
        newDateTemp: Date;
    begin
        /*
        HRAppraisalPeriod.RESET;
        HRAppraisalPeriod.SETRANGE(HRAppraisalPeriod."Date opened",dtOpenPeriod);
        HRAppraisalPeriod.SETRANGE(HRAppraisalPeriod."Appraisal Type",HRAppraisalPeriod."Appraisal Type"::"End Year Appraisal");
        IF HRAppraisalPeriod.FIND('-') THEN
        BEGIN
               HRAppraisalPeriod.Closed:=TRUE;
               HRAppraisalPeriod."Date closed":=TODAY;
               HRAppraisalPeriod.MODIFY;

               //open the taget setting
               newDate:=CALCDATE('+1M',dtOpenPeriod);
               newMonth:=DATE2DMY(newDate,2);
               newYear:=DATE2DMY(newDate,3);

                HRAppraisalPeriod_NEW.INIT;
                HRAppraisalPeriod_NEW."Appraisal Period":=newDate;
                HRAppraisalPeriod_NEW."Appraisal Month":=newMonth;
                HRAppraisalPeriod_NEW."Appraisal Year":=newYear;
                HRAppraisalPeriod_NEW."Appraisal Period Description":=FORMAT(newDate,0,'<Month Text>')+' - '+FORMAT(newYear);
                IF DATE2DMY(HRAppraisalPeriod_NEW."Appraisal Period",2) = HRSetup."Target Setting Month" THEN
                 HRAppraisalPeriod_NEW."Appraisal Type":=HRAppraisalPeriod_NEW."Appraisal Type"::"Target Setting"
                ELSE BEGIN
                 HRAppraisalPeriod_NEW."Appraisal Type":=HRAppraisalPeriod_NEW."Appraisal Type"::"Appraisal Review";
                END;
                HRAppraisalPeriod_NEW.Closed:=FALSE;
                HRAppraisalPeriod_NEW."Date opened":=newDate;
                HRAppraisalPeriod_NEW."Date closed":=0D;
                HRAppraisalPeriod_NEW.INSERT;
         END ELSE BEGIN     //IF its not end year period create then continue -------
            ApprasialPeriod.RESET;
            ApprasialPeriod.SETRANGE(ApprasialPeriod."Date opened",dtOpenPeriod);
        //    ApprasialPeriod.SETRANGE(HRAppraisalPeriod_NEW."Appraisal Type",HRAppraisalPeriod_NEW."Appraisal Type"::"Appraisal Review");
            IF ApprasialPeriod.FIND('-') THEN BEGIN
             ApprasialPeriod.Closed:=TRUE;
             ApprasialPeriod."Date closed":=TODAY;
             ApprasialPeriod.MODIFY;
            END;

           newDateTemp:=CALCDATE(HRSetup."Appraisal Interval",dtOpenPeriod);
           newMonth:=DATE2DMY(newDateTemp,2);
           newYear:=DATE2DMY(newDateTemp,3);

            IF DATE2DMY(newDateTemp,2)=HRSetup."Target Setting Month" THEN BEGIN
              newDate:=CALCDATE('-1M',newDateTemp);
              newMonth:=DATE2DMY(newDate,2);
              newYear:=DATE2DMY(newDate,3);
              "Appraisal Type Option":="Appraisal Type Option"::"End Year Appraisal";
            END ELSE BEGIN
             newDate:=newDateTemp;
            "Appraisal Type Option":="Appraisal Type Option"::"Appraisal Review";
            END;

            HRAppraisalPeriod_NEW.INIT;
            HRAppraisalPeriod_NEW."Appraisal Period":=newDate;
            HRAppraisalPeriod_NEW."Appraisal Month":=newMonth;
            HRAppraisalPeriod_NEW."Appraisal Year":=newYear;
            HRAppraisalPeriod_NEW."Appraisal Period Description":=FORMAT(newDate,0,'<Month Text>')+' - '+FORMAT(newYear);;
            HRAppraisalPeriod_NEW.Closed:=FALSE;
            HRAppraisalPeriod_NEW."Date opened":=newDate;
            HRAppraisalPeriod_NEW."Date closed":=0D;
            HRAppraisalPeriod_NEW."Appraisal Type":="Appraisal Type Option";
            HRAppraisalPeriod_NEW.INSERT;
         END;
        */

    end;


    procedure fnCloseAppraisalPeriod_NEW()
    var
        HRSetup: Record "HR Setup";
        HRAppPeriod: Record "HR Appraisal Period";
        HRAppPeriod_2: Record "HR Appraisal Period";
    begin
        HRSetup.Reset();
        if HRSetup.Get() then begin
            //Get Appraisal Start Date/ End Date and Apprisal Interval
            HRSetup.TestField(HRSetup."Appraisal Posting Period[FROM]");
            HRSetup.TestField(HRSetup."Appraisal Posting Period[TO]");
            HRSetup.TestField(HRSetup."Appraisal Interval");

            HRAppPeriod.Reset();
            if not HRAppPeriod.Find('-') then begin
                //Create target setting appraisal period if no appraisal period is defined
                HRAppPeriod.Init();
                HRAppPeriod."Appraisal Period" := HRSetup."Appraisal Posting Period[FROM]";
                HRAppPeriod."Appraisal Type" := HRAppPeriod."Appraisal Type"::"Target Setting";
                HRAppPeriod."Date opened" := Today;
                HRAppPeriod."Appraisal Year" := Format(Date2DMY(HRSetup."Appraisal Posting Period[FROM]", 3)) + ' - '
                                              + Format(Date2DMY(HRSetup."Appraisal Posting Period[TO]", 3));
                HRAppPeriod."Appraisal Period Description" := 'Target Setting [' + HRAppPeriod."Appraisal Year" + ']';
                HRAppPeriod.Insert();
            end else begin
                //Get last appraisal period
                HRAppPeriod.Reset();
                if HRAppPeriod.Find('+') then begin
                    //If an appraisal period is defined check whether next period should be "Evaluation" or "End Year"

                    NextPeriod := CalcDate((HRSetup."Appraisal Interval"), HRAppPeriod."Appraisal Period");

                    HRAppPeriod_2.Reset();

                    HRAppPeriod_2.Init();
                    HRAppPeriod_2."Appraisal Period" := NextPeriod;
                    HRAppPeriod_2."Date opened" := Today;
                    HRAppPeriod_2."Appraisal Year" := Format(Date2DMY(HRSetup."Appraisal Posting Period[FROM]", 3)) + ' - '
                                                  + Format(Date2DMY(HRSetup."Appraisal Posting Period[TO]", 3));
                    if NextPeriod >= HRSetup."Appraisal Posting Period[TO]" then begin
                        HRAppPeriod_2."Appraisal Type" := HRAppPeriod_2."Appraisal Type"::"End Year Appraisal";
                        HRAppPeriod_2."Appraisal Period Description" := 'End Year Appraisal [' + HRAppPeriod_2."Appraisal Year" + ']';
                    end else begin
                        HRAppPeriod_2."Appraisal Type" := HRAppPeriod_2."Appraisal Type"::"Appraisal Review";
                        HRAppPeriod_2."Appraisal Period Description" := 'Appraisal Review [' + HRAppPeriod_2."Appraisal Year" + ']';
                    end;

                    HRAppPeriod_2.Insert();
                    HRAppPeriod.Closed := true;
                    HRAppPeriod."Date closed" := Today;



                end;
            end;
        end;
    end;
}
