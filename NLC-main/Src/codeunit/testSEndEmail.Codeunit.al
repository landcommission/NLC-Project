#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 50003 testSEndEmail
{

    trigger OnRun()
    var
        Subject: Text[250];
        Body: Text[250];
    // SMTPSetup: Codeunit "SMTP Mail";
    begin
        Subject := 'Vehicle Allocation for Transport Request';
        Body := 'This is to inform you that you have been allocated Vehicle No';
        //   SMTPSetup.CreateMessage('TEST','notifications@landcommission.go.ke','nathan.muoka@greencom.co.ke',Subject,Body,true);
        //   SMTPSetup.Send;
    end;
}
