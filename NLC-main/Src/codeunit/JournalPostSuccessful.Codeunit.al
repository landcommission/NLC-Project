#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
codeunit 52193452 "Journal Post Successful"
{



    procedure PostedSuccessfully() Posted: Boolean
    var
        ValPost: Record "Value Posting";
    begin

        Posted := false;
        ValPost.SetRange(ValPost.UserID, UserId);
        ValPost.SetRange(ValPost."Value Posting", 1);
        if ValPost.Find('-') then
            Posted := true;
    end;
}
