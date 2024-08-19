#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50069 "Create Fixed Asset List"
{
    Caption = 'Create Fixed Asset List';
    //CardPageID = "Create Fixed Asset Card";
    Editable = true;
    PageType = List;
    SourceTable = "Fixed Asset";
    // SourceTableView = where("Asset Movement Status"=const(New));

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                // field(Select;Select)
                // {
                //     ApplicationArea = Basic;
                // }
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Search Description"; "Search Description")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; "Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("FA Class Code"; "FA Class Code")
                {
                    ApplicationArea = Basic;
                }
                field("FA Subclass Code"; "FA Subclass Code")
                {
                    ApplicationArea = Basic;
                }
                // field("IFMIS Order No";"IFMIS Order No")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'PO No';
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fixed &Asset")
            {
                Caption = 'Fixed &Asset';
                Image = FixedAssets;
                action("Export BarCode Template")
                {
                    ApplicationArea = Basic;
                    Caption = 'Export BarCode Template';
                    Image = Export;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        fasset.CopyFilters(Rec);
                        // fasset.SetRange(fasset.Select,true);
                        Xmlport.Run(50083, true, true, fasset);

                        /*
                        CustXmlFile.CREATE('C:\Asset\BarCodes.xml');
                        CustXmlFile.CREATEOUTSTREAM(XmlStream);
                        XMLPORT.EXPORT(50083,XmlStream,fasset);
                        CustXmlFile.CLOSE;
                        */

                    end;
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        // "Asset Movement Status":="asset movement status"::New
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //  "Asset Movement Status":="asset movement status"::New
    end;

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin


        //  SetRange(Select,true);
        //  if Find('-') then
        //        begin
        //     Select:=false;
        //     Modify
        //     end;
    end;

    var
        fasset: Record "Fixed Asset";
        CustXmlFile: File;
        XmlStream: OutStream;
    // varXmlPort: XmlPort UnknownXmlPort50083;
}

