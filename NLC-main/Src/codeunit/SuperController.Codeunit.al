codeunit 50034 "Super Controller"
{
    trigger OnRun()
    var
        UserPermissions: Codeunit "User Permissions";
    begin
        if not UserPermissions.IsSuper(UserSecurityId()) then
            Error('You do not have sufficient rights to open this page');
    end;
}
