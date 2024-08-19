#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50012 "User Signature"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "User Setup";
    ApplicationArea = All;
    Caption = 'User Signature';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("User Signature"; Rec."User Signature")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the User Signature field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Sign Now")
            {
                ApplicationArea = Basic;
                Caption = 'Sign Now';
                Ellipsis = true;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Sign Now action.';

                /*  trigger OnAction()
                 var
                     SalesInvHeader: Record "Sales Invoice Header";
                     [RunOnClient]
                     Process: dotnet Process;
                     i: Integer;
                     ExportDir: Text;
                 begin
                     ProcessStartInfo :=ProcessStartInfo.ProcessStartInfo;
                     ProcessStartInfo.FileName := '\\192.168.10.22\Signature\WindowsApplication.exe';
                     CmdFilePath:=   '\\192.168.10.22\Signature\WindowsApplication.exe';
                     ProcessStartInfo.Arguments :=Rec."User ID"; //STRSUBSTNO('-cmd %1',CmdFilePath);
                     Process := Process.Process;
                     Process.Start(ProcessStartInfo);
                 end; */
            }
        }
    }

    var
        // TEst2: Text;
        // [RunOnClient]
        // 
        CmdFilePath: Text;
        SignatureText: BigText;
}
