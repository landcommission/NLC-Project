#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50103 tableextension50103 extends "G/L Entry"
{
    fields
    {
        field(39003900; Paid; Boolean)
        {
            Caption = 'Paid';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                //Update the sales invoice------
                objSalesLine.Reset();
                //objSalesLine.SETRANGE(objSalesLine."No.","G/L Account No.");
                objSalesLine.SetRange(objSalesLine."Document No.", Rec."Sales Line No.");
                objSalesLine.SetRange(objSalesLine."Line No.", Rec."Sales Line Line No.");
                if objSalesLine.Find('-') then
                    if Rec.Paid = true then begin
                        objSalesLine.Quantity := 1;
                        objSalesLine."Unit Price" := objSalesLine."Unit Price" + Rec.Amount;
                        objSalesLine.Modify();
                    end else begin
                        objSalesLine."Unit Price" := objSalesLine."Unit Price" - Rec.Amount;
                        objSalesLine.Modify();

                    end;
            end;
        }
        field(39003901; "Sales Line No."; Code[20])
        {
            Caption = 'Sales Line No.';
            DataClassification = CustomerContent;
        }
        field(39003902; "Sales Line Line No."; Integer)
        {
            Caption = 'Sales Line Line No.';
            DataClassification = CustomerContent;
        }
    }

    var
        objSalesLine: Record "Sales Line";
}
