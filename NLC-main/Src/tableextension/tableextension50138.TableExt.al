#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50138 tableextension50138 extends "No. Series Relationship"
{
    fields
    {
        field(39004240; "Series Filter"; Code[20])
        {
            Caption = 'Series Filter';
            DataClassification = CustomerContent;
            trigger OnLookup()
            var
                RespCenter: Record "Responsibility Center";
                DimMgt: Codeunit DimensionManagement;
                ShortcutDimCode: array[8] of Code[20];
            begin
                GenLedgerSetup.Get();
                case GenLedgerSetup."Base No. Series" of
                    GenLedgerSetup."Base No. Series"::"Responsibility Center":
                        begin
                            if Page.RunModal(39005925, RespCenter) = Action::LookupOK then
                                Rec."Series Filter" := RespCenter.Code;
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 1":
                        begin
                            DimMgt.LookupDimValueCode(1, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 2":
                        begin
                            DimMgt.LookupDimValueCode(2, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 3":
                        begin
                            DimMgt.LookupDimValueCode(3, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 4":
                        begin
                            DimMgt.LookupDimValueCode(4, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 5":
                        begin
                            DimMgt.LookupDimValueCode(5, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 6":
                        begin
                            DimMgt.LookupDimValueCode(6, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 7":
                        begin
                            DimMgt.LookupDimValueCode(7, Rec."Series Filter");
                            Rec.Modify();
                        end;
                    GenLedgerSetup."Base No. Series"::"Shortcut Dimension 8":
                        begin
                            DimMgt.LookupDimValueCode(8, Rec."Series Filter");
                            Rec.Modify();
                        end;
                end
            end;
        }
    }

    var
        GenLedgerSetup: Record "General Ledger Setup";
}
