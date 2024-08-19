enum 50003 "HR Leave Plan Status"
{
    Extensible = true;

    value(0; New)
    {
        Caption = 'New';
    }
    value(1; "Pending Approval")
    {
        Caption = 'Pending Approval';
    }
    value(2; "HOD Approval")
    {
        Caption = 'HOD Approval';
    }
    value(3; "HR Approval")
    {
        Caption = 'HR Approval';
    }
    value(4; MDApproval)
    {
        Caption = 'Final Approval';
    }
    value(5; Rejected)
    {
        Caption = 'Rejected';
    }
    value(6; Canceled)
    {
        Caption = 'Canceled';
    }
    value(7; Approved)
    {
        Caption = 'Approved';
    }
    value(8; "On leave")
    {
        Caption = 'On leave';
    }
    value(9; Resumed)
    {
        Caption = 'Resumed';
    }
    value(10; Posted)
    {
        Caption = 'Posted';
    }
}