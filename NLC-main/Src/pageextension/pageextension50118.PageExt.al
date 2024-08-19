#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50118 pageextension50118 extends "Job List"
{
    actions
    {

        //Unsupported feature: Code Modification on ""Dimensions-&Multiple"(Action 12).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(Job);
        DefaultDimMultiple.SetMultiJob(Job);
        DefaultDimMultiple.RUNMODAL;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CurrPage.SETSELECTIONFILTER(Job);
        ///DefaultDimMultiple.SetMultiJob(Job);
        ///DefaultDimMultiple.RUNMODAL;
        */
        //end;
    }
}
