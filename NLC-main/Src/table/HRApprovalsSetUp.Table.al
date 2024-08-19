table 52193879 "HR Approvals Set Up"
{
    Caption = 'HR Approvals Set Up';
    DataClassification = CustomerContent;
    //DrillDownPageID = 39004275;
    //LookupPageID = 39004275;

    fields
    {
        field(1; "Approval Type"; Option)
        {
            OptionMembers = Loans,"Bridging Loans","Personal Loans",Refunds,"Funeral Expenses","Withdrawals - Resignation","Withdrawals - Death","Branch Loans",Journals,"File Movement","Appeal Loans","Bosa Loan Approval";
            Caption = 'Approval Type';
        }
        field(2; Stage; Integer)
        {
            Caption = 'Stage';
        }
        field(3; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(4; Station; Code[50])
        {
            Caption = 'Station';
        }
        field(5; "Duration (Hr)"; Decimal)
        {
            Caption = 'Duration (Hr)';
        }
    }

    keys
    {
        key(Key1; "Approval Type", Stage, Station)
        {
            Clustered = true;
        }
    }

    fieldgroups { }
}

