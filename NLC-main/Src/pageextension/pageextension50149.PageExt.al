#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50149 pageextension50149 extends "Approval User Setup"
{
    layout
    {

        //Unsupported feature: Property Modification (SourceExpr) on ""Approver ID"(Control 19)".


        //Unsupported feature: Property Modification (Name) on ""Approver ID"(Control 19)".

        modify("Salespers./Purch. Code")
        {
            Visible = false;
        }
        modify("Sales Amount Approval Limit")
        {
            Visible = false;
        }
        modify("Unlimited Sales Approval")
        {
            Visible = false;
        }
        modify("Purchase Amount Approval Limit")
        {
            Visible = false;
        }
        modify("Unlimited Purchase Approval")
        {
            Visible = false;
        }
        modify("Request Amount Approval Limit")
        {
            Visible = false;
        }
        modify("Unlimited Request Approval")
        {
            Visible = false;
        }
        modify("Approver ID")
        {
            Caption = 'Recommender ID';
        }
    }
    actions
    {
        addafter("&Approval User Setup Test")
        {
            action("Import Users")
            {
                ApplicationArea = Basic;
                Caption = 'Import Users';
                ToolTip = 'Executes the Import Users action.';
                trigger OnAction()
                begin
                    Error('disabled');

                    /*
                    IF CONFIRM('Import Users?',FALSE) = FALSE THEN ERROR('Aborted');


                    //From Users table
                    User.RESET;
                    IF User.FIND('-') THEN
                    BEGIN
                        REPEAT
                            UserSetup.RESET;
                            UserSetup.SETRANGE(UserSetup."User ID",User."User Name");
                            IF NOT UserSetup.FIND('-') THEN
                            BEGIN
                                UserSetup.INIT;

                                UserSetup."User ID":=User."User Name";

                                UserSetup.INSERT;
                                counter +=1;
                            END;
                        UNTIL User.NEXT =0;
                        MESSAGE('Done %1 users imported from AD',counter);
                    END;



                    HREmp.RESET;
                    HREmp.SETFILTER(HREmp."User ID",'<>%1','');
                    IF HREmp.FIND('-') THEN
                    BEGIN
                        REPEAT

                            String :='';
                            String := HREmp."User ID";
                            Where := '<>';
                            Which := 'LC\';
                            NewString := LOWERCASE(DELCHR(String, Where, Which))+'@landcommission.go.ke';

                            HREmp."Company E-Mail":=NewString;
                            HREmp.MODIFY;

                            Counter +=1;

                        UNTIL HREmp.NEXT =0;
                        MESSAGE('Done %1 records modified',Counter);
                    END;

                    */

                end;
            }
        }
    }
    trigger OnOpenPage()

    begin
        Codeunit.Run(Codeunit::"Super Controller");
    end;

    var
        User: Record User;
        UserSetup: Record "User Setup";
        Where: Text;
        Which: Text;
        HREmp: Record "HR Employees";
        String: Text;
        NewString: Text;
        Counter: Integer;
}
