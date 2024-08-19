#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69694 "Employee Exit Reason Code"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Separation Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Retirement,Resignation,Layoff,Termination By Mutual Agreement,Dismissal,Death';
            OptionMembers = " ",Retirement,Resignation,Layoff,"Termination By Mutual Agreement",Dismissal,Death;
        }
        field(4;"Turnover Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Involuntary Turnover,Voluntary Turnover';
            OptionMembers = " ","Involuntary Turnover","Voluntary Turnover";
        }
        field(5;"Consider for Rehire";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of exited employees";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

