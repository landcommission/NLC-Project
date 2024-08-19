#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50073 "Acceptance Signature"
{
    DeleteAllowed = true;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "HR Asset Transfer Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                }
                // field("User Signature"; "User Signature")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sign Now")
            {
                ApplicationArea = Basic;
                Caption = 'Sign Now';
                Ellipsis = true;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    SalesInvHeader: Record 112;


                    i: Integer;
                    ExportDir: Text;
                begin

                    // ProcessStartInfo := ProcessStartInfo.ProcessStartInfo;
                    // ProcessStartInfo.FileName := '\\192.168.10.53\Signature\WindowsApplication2.exe';
                    // CmdFilePath := '\\192.168.10.53\Signature\WindowsApplication2.exe';
                    // ProcessStartInfo.Arguments := "No."; //STRSUBSTNO('-cmd %1',CmdFilePath);
                    // Process := Process.Process;
                    // Process.Start(ProcessStartInfo);
                end;
            }
        }
    }

    var
        TEst2: Text;

        //
        CmdFilePath: Text;
        SignatureText: BigText;
        aaset: Codeunit 50003;
}

