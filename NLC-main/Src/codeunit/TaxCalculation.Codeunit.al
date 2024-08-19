#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193457 "Tax Calculation"
{



    procedure CalculateTax(Rec: Record "Payment Line"; CalculationType: Option VAT,"W/Tax",Retention,VAT6) Amount: Decimal
    begin
        case CalculationType of
            CalculationType::VAT:

                Amount := (Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec.Amount;
            CalculationType::"W/Tax":

                Amount := (Rec.Amount - ((Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec.Amount))
                * (Rec."W/Tax Rate" / 100);
            CalculationType::Retention:

                Amount := (Rec.Amount - ((Rec."VAT Rate" / (100 + Rec."VAT Rate")) * Rec.Amount))
                 * (Rec."Retention Rate" / 100);
            //Added for VAT 6% OF VAT
            CalculationType::VAT6:

                Amount := (Rec.Amount * Rec."VAT 6% Rate" / 116);

        end;
    end;


    procedure CalculatePurchTax(Rec: Record "Purchase Line"; CalculationType: Option VAT,"W/Tax",Retention) Amount: Decimal
    begin
        /*
        CASE CalculationType OF
          CalculationType::VAT:
            BEGIN
                //Amount:=(Rec."VAT Rate"/(100+Rec."VAT Rate"))*Rec.Amount;
                Amount:=(Rec."VAT Rate"/(100+Rec."VAT Rate"))*Rec.Amount;
            END;
          CalculationType::"W/Tax":
            BEGIN
                //Amount:=(Rec.Amount-((Rec."VAT Rate"/(100+Rec."VAT Rate"))*Rec.Amount))
                //*(Rec."W/Tax Rate"/100);
                Amount:=(Rec.Amount*(Rec."W/Tax Rate"/(100+Rec."VAT Rate")));

            END;
          CalculationType::Retention:
            BEGIN
                Amount:=(Rec.Amount-((Rec."VAT Rate"/100)*Rec.Amount))
                 *(Rec."Retention Rate"/100);
            END;
        END;
        */

    end;
}
