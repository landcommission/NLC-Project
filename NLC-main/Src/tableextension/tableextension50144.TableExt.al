#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50144 tableextension50144 extends "Default Dimension"
{
    fields
    {
        modify("No.")
        {
            TableRelation = if ("Table ID" = const(13)) "Salesperson/Purchaser"
            else
            if ("Table ID" = const(15)) "G/L Account"
            else
            if ("Table ID" = const(18)) Customer
            else
            if ("Table ID" = const(23)) Vendor
            else
            if ("Table ID" = const(27)) Item
            else
            if ("Table ID" = const(152)) "Resource Group"
            else
            if ("Table ID" = const(156)) Resource
            else
            if ("Table ID" = const(52193728)) Jobs
            else
            if ("Table ID" = const(270)) "Bank Account"
            else
            if ("Table ID" = const(413)) "IC Partner"
            else
            if ("Table ID" = const(5071)) Campaign
            else
            if ("Table ID" = const(5200)) Employee
            else
            if ("Table ID" = const(5600)) "Fixed Asset"
            else
            if ("Table ID" = const(5628)) Insurance
            else
            if ("Table ID" = const(5903)) "Service Order Type"
            else
            if ("Table ID" = const(5904)) "Service Item Group"
            else
            if ("Table ID" = const(5940)) "Service Item"
            else
            if ("Table ID" = const(5714)) "Responsibility Center"
            else
            if ("Table ID" = const(5800)) "Item Charge"
            else
            if ("Table ID" = const(99000754)) "Work Center"
            else
            if ("Table ID" = const(5965)) "Service Contract Header"
            else
            if ("Table ID" = const(5105)) "Customer Template";
        }
    }

    //Unsupported feature: Code Modification on "UpdateGlobalDimCode(PROCEDURE 25)".

    //procedure UpdateGlobalDimCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CASE "Table ID" OF
      DATABASE::"G/L Account":
        UpdateGLAccGLobalDimCode(GlobalDimCodeNo,"No.",NewDimValue);
    #4..10
        UpdateResGrGLobalDimCode(GlobalDimCodeNo,"No.",NewDimValue);
      DATABASE::Resource:
        UpdateResGLobalDimCode(GlobalDimCodeNo,"No.",NewDimValue);
      DATABASE::Job:
        UpdateJobGLobalDimCode(GlobalDimCodeNo,"No.",NewDimValue);
      DATABASE::"Bank Account":
        UpdateBankGLobalDimCode(GlobalDimCodeNo,"No.",NewDimValue);
    #18..35
      DATABASE::"Cash Flow Manual Revenue":
        UpdateNeutrRevGLobalDimCode(GlobalDimCodeNo,"No.",NewDimValue);
    END;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..13
      DATABASE::Jobs:
    #15..38
    */
    //end;

    //Unsupported feature: Property Modification (Subtype) on "UpdateJobGLobalDimCode(PROCEDURE 32).Job(Variable 1004)".

}
