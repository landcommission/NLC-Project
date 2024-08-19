#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
xmlport 50069 "HR Leave Ledger Entries"
{
    Format = VariableText;
    Caption = 'HR Leave Ledger Entries';
    schema
    {
        textelement(root)
        {
            tableelement("HR Leave Ledger Entries"; "HR Leave Ledger Entries")
            {
                XmlName = 'HRLeaveLedgerEntries';
                fieldelement(HHHHG; "HR Leave Ledger Entries"."Entry No.") { }
                fieldelement(b; "HR Leave Ledger Entries"."Leave Calendar Code")
                {
                    MinOccurs = Zero;
                }
                fieldelement(c; "HR Leave Ledger Entries"."Staff No.")
                {
                    MinOccurs = Zero;

                    trigger OnAfterAssignField()
                    begin
                        if HREmp.Get("HR Leave Ledger Entries"."Staff No.") then
                            "HR Leave Ledger Entries"."Staff Name" := UpperCase(HREmp."Full Name");
                    end;
                }
                fieldelement(hhj; "HR Leave Ledger Entries"."Staff Name") { }
                fieldelement(d; "HR Leave Ledger Entries"."Posting Date")
                {
                    MinOccurs = Zero;
                }
                fieldelement(i; "HR Leave Ledger Entries"."Journal Batch Name")
                {
                    MinOccurs = Zero;
                }
                fieldelement(JJJJ; "HR Leave Ledger Entries"."Leave Approval Date") { }
                fieldelement(f; "HR Leave Ledger Entries"."Document No.")
                {
                    MinOccurs = Zero;
                }
                fieldelement(g; "HR Leave Ledger Entries"."No. of days")
                {
                    MinOccurs = Zero;
                }
                fieldelement(h; "HR Leave Ledger Entries"."Leave Posting Description")
                {
                    MinOccurs = Zero;
                }
                fieldelement(e; "HR Leave Ledger Entries"."Leave Entry Type")
                {
                    MinOccurs = Zero;
                }
                fieldelement(j; "HR Leave Ledger Entries"."Leave Type")
                {
                    MinOccurs = Zero;
                }
            }
        }
    }

    requestpage
    {

        layout { }

        actions { }
    }

    trigger OnPostXmlPort()
    begin
        Message('Process Complete');
    end;

    var
        HREmp: Record "HR Employees";
}
