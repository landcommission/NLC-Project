#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50115 "Sharepoint Information"
{
    Caption = 'Sharepoint Information';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Company Information";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Sharepoint Information"; Name)
                {
                    ApplicationArea = Basic;
                    Caption = 'Sharepoint Information';
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("SharePoints Link")
            {
                Caption = 'SharePoint Link';
                Image = Company;
                action("SharePoint Link")
                {
                    ApplicationArea = Basic;
                    Caption = 'SharePoint Link';
                    Image = Web;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        if CompanyInfo.Get then begin
                            Link := CompanyInfo."Documents Attachment Link";
                            Hyperlink(Link);
                        end;
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        UpdateSystemIndicator;
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
        SetShowMandatoryConditions;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit 802;
    begin
        Reset;
        if not Get then begin
            Init;
            Insert;
        end;

        if not MapMgt.TestSetup then
            MapPointVisible := false;
    end;

    var
        CustomizedCalEntry: Record 7603;
        CustomizedCalendar: Record 7602;
        CalendarMgmt: Codeunit 7600;
        SystemIndicatorText: Text[250];
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        SystemIndicatorTextEditable: Boolean;
        IBANMissing: Boolean;
        BankBranchNoOrAccountNoMissing: Boolean;
        CompanyInfo: Record "Company Information";
        Link: Text;


    procedure UpdateSystemIndicator()
    var
        IndicatorStyle: Option;
    begin
        GetSystemIndicator(SystemIndicatorText, IndicatorStyle); // IndicatorStyle is not used
                                                                 // SystemIndicatorTextEditable := CurrPage.Editable and ("System Indicator" = "system indicator"::"Custom Text");
    end;

    local procedure SystemIndicatorTextOnAfterVali()
    begin
        UpdateSystemIndicator
    end;

    local procedure SystemIndicatorOnAfterValidate()
    begin
        UpdateSystemIndicator
    end;

    local procedure SetShowMandatoryConditions()
    begin
        BankBranchNoOrAccountNoMissing := ("Bank Branch No." = '') or ("Bank Account No." = '');
        IBANMissing := Iban = ''
    end;
}

