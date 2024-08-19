#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69721 "Background Checks Document"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Background Checks Header";
        }
        field(2;"Clearance Document Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Document Type" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                HRDocumentType.Reset;
                HRDocumentType.SetRange(Code,"Clearance Document Type");
                if HRDocumentType.FindSet then begin
                  Description:=HRDocumentType.Description;
                  end
            end;
        }
        field(3;Description;Text[400])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"External Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Clearing Agency";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Clearing Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Red Flag,Clean Record';
            OptionMembers = " ","Red Flag","Clean Record";
        }
        field(7;"Additional Comments";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Vacancy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Recruitment Requisition Header" where ("Document Type"=filter("Job Vacancy"));
        }
        field(9;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Applications";
        }
    }

    keys
    {
        key(Key1;"Document No.","Clearance Document Type","Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HRDocumentType: Record "HR Document Type";
}

