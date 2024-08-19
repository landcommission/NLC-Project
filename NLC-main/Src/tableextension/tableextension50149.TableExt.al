/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50149 tableextension50149 extends "Approval Templates"
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Table ID"(Field 1)".


        //Unsupported feature: Property Modification (OptionString) on ""Document Type"(Field 4)".

        modify("Limit Type")
        {
            OptionCaption = 'Approval Limits,Credit Limits,Request Limits,No Limits,Tiered';

            //Unsupported feature: Property Modification (OptionString) on ""Limit Type"(Field 5)".

        }

        //Unsupported feature: Property Deletion (OptionCaptionML) on ""Document Type"(Field 4)".

        field(50000;"Responsibility Center";Code[20])
        {
            TableRelation = "Responsibility Center BR NEW".Code;
        }
    }
}
 */