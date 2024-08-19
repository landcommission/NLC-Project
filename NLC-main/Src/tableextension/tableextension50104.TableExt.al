#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50104 tableextension50104 extends Customer
{
    fields
    {

        //Unsupported feature: Code Modification on "Name(Field 2).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
         CustLedEntry.RESET;
         CustLedEntry.SETRANGE(CustLedEntry."Customer No.","No.");
         IF CustLedEntry.FINDFIRST THEN BEGIN
            IF (Name)<>(xRec.Name) THEN
               ERROR('There are already entries for Customer '+"No."+', Cannot change the Name');
         END;

        IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
          "Search Name" := Name;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Customer Posting Group"(Field 21)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
         CustLedEntry.RESET;
         CustLedEntry.SETRANGE(CustLedEntry."Customer No.","No.");
         IF CustLedEntry.FINDFIRST THEN BEGIN
            IF ("Customer Posting Group")<>(xRec."Customer Posting Group") THEN
               ERROR('There are already entries for Customer '+"No."+', Cannot change the posting group');
         END;
        */
        //end;
        field(39003900; "Account Type"; Option)
        {
            OptionCaption = ' ,Travel Advance,Staff Advance,Implementing Partner,Others,Donor,Contractor,skilled worker,Developer,Supervisor';
            OptionMembers = " ","Travel Advance","Staff Advance","Implementing Partner",Others,Donor,Contractor,"skilled worker",Developer,Supervisor;
            Caption = 'Account Type';
            DataClassification = CustomerContent;

        }
        field(39003901; "Employee Job Group"; Code[50])
        {
            TableRelation = "HR Employees"."No.";
            Caption = 'Employee Job Group';
            DataClassification = CustomerContent;
        }
        field(39003902; "Donor Category"; Option)
        {
            OptionCaption = ' ,Intramural,Extramural';
            OptionMembers = " ",Intramural,Extramural;
            Caption = 'Donor Category';
            DataClassification = CustomerContent;
        }
        field(39003903; "Allow Indirect Cost"; Boolean)
        {
            Caption = 'Allow Indirect Cost';
            DataClassification = CustomerContent;
        }
        field(39003904; "Staff No"; Code[20])
        {
            Editable = false;
            Caption = 'Staff No';
            DataClassification = CustomerContent;
        }
        field(39003905; "Registration No"; Code[20])
        {
            Editable = false;
            Caption = 'Registration No';
            DataClassification = CustomerContent;
        }
        field(39003906; Class; Text[30])
        {
            Editable = false;
            Caption = 'Class';
            DataClassification = CustomerContent;
        }
        field(39003907; Category; Code[10])
        {
            Editable = false;
            Caption = 'Category';
            DataClassification = CustomerContent;
        }
    }

    var
        CustLedEntry: Record "Cust. Ledger Entry";
}
