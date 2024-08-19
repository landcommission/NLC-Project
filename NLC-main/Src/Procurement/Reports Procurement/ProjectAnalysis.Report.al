#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 52193650 "Project Analysis"
{
    Caption = 'Job Analysis';
    WordLayout = './Layouts/ProjectAnalysis.docx';
    DefaultLayout = Word;
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("AmountField[1]"; AmountField[1])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 1 ';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[1]"; CurrencyField[1])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 1';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[2]"; AmountField[2])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 2';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[2]"; CurrencyField[2])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 2';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[3]"; AmountField[3])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 3';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[3]"; CurrencyField[3])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 1';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[4]"; AmountField[4])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 4';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[4]"; CurrencyField[4])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 2';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[5]"; AmountField[5])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 5';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[5]"; CurrencyField[5])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 1';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[6]"; AmountField[6])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 6';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[6]"; CurrencyField[6])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 2';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[7]"; AmountField[7])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 7';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[7]"; CurrencyField[7])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 1';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field("AmountField[8]"; AmountField[8])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Amount Field 8';
                        OptionCaption = ' ,Schedule Price,Usage Price,Contract Price,Invoiced Price,Schedule Cost,Usage Cost,Contract Cost,Invoiced Cost,Schedule Profit,Usage Profit,Contract Profit,Invoiced Profit';
                    }
                    field("CurrencyField[8]"; CurrencyField[8])
                    {
                        ApplicationArea = Basic;
                        Caption = 'Currency Field 2';
                        OptionCaption = 'Local Currency,Foreign Currency';
                    }
                    field(ExcludeJobTask; ExcludeJobTask)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Exclude Zero-Lines';
                        MultiLine = true;
                    }
                }
            }
        }

    }
    var
        JobCalcStatistics: Codeunit 52193430;
        HeadLineText: array[8] of Text[50];
        Amt: array[8] of Decimal;
        AmountField: array[8] of Option " ","Schedule Price","Usage Price","Contract Price","Invoiced Price","Schedule Cost","Usage Cost","Contract Cost","Invoiced Cost","Schedule Profit","Usage Profit","Contract Profit","Invoiced Profit";
        CurrencyField: array[8] of Option "Local Currency","Foreign Currency";
        JobFilter: Text;
        JobTaskFilter: Text;
        ExcludeJobTask: Boolean;
        PrintSection: Boolean;
        I: Integer;
        CurrReportPageNoCaptionLbl: label 'Page';
        JobAnalysisCaptLbl: label 'Job Analysis';
        DescriptionCaptionLbl: label 'Description';
        JobTaskNoCaptLbl: label 'Job Task No.';

    procedure InitializeRequest(NewAmountField: array[8] of Option " ","Schedule Price","Usage Price","Contract Price","Invoiced Price","Schedule Cost","Usage Cost","Contract Cost","Invoiced Cost","Schedule Profit","Usage Profit","Contract Profit","Invoiced Profit"; NewCurrencyField: array[8] of Option "Local Currency","Foreign Currency"; NewExcludeJobTask: Boolean)
    begin
    end;

    trigger OnInitReport();
    begin

    end;

    trigger OnPreReport();
    begin
        ;
        ReportsForNavPre;
    end;

    // --> Reports ForNAV Autogenerated code - do not delete or modify
    var

        ReportForNavTotalsCausedBy: Integer;
        ReportForNavInitialized: Boolean;
        ReportForNavShowOutput: Boolean;



    local procedure ReportsForNavPre()
    begin
    end;

    local procedure ReportForNavSetTotalsCausedBy(value: Integer)
    begin
        ReportForNavTotalsCausedBy := value;
    end;

    local procedure ReportForNavSetShowOutput(value: Boolean)
    begin
        ReportForNavShowOutput := value;
    end;



    local procedure ReportForNavWriteDataItem(dataItemId: Text; rec: Variant): Text
    var
        values: Text;
        jsonObject: JsonObject;
        currLanguage: Integer;
    begin
        if not ReportForNavInitialized then begin

            ReportForNavInitialized := true;
        end;

        case (dataItemId) of
        end;

        jsonObject.WriteTo(values);
        exit(values);
    end;
    // Reports ForNAV Autogenerated code - do not delete or modify -->
}
