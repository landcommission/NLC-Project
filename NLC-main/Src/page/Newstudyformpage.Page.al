#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193945 "New study form page"
{
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "Investigator Information";
    ApplicationArea = All;
    Caption = 'New study form page';
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Investigator Information';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                /* field("Project Title";Rec."Project Title")
                {
                    ApplicationArea = Basic;
                }
                field("PI Name";Rec."PI Name")
                {
                    ApplicationArea = Basic;
                }
                field("PI Postal Address";Rec."PI Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("PI Email";Rec."PI Email")
                {
                    ApplicationArea = Basic;
                }
                field("CPI Name";Rec."CPI Name")
                {
                    ApplicationArea = Basic;
                }
                field("CPI Postal Address";Rec."CPI Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field("CPI Telephone";Rec."CPI Telephone")
                {
                    ApplicationArea = Basic;
                }
                field("CPI Email";Rec."CPI Email")
                {
                    ApplicationArea = Basic;
                } */
                field("Ampath Consortium Collaborator"; Rec."Ampath Consortium Collaborator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Need assistance to identify Collaborator? field.';
                }
            }
            group("Study Summary")
            {
                part("Project areas of focus"; "Appraisal Performance")
                {
                    SubPageLink = "Overall Comment" = field(Code);
                }
                field("Study Type"; Rec."Study Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study type will be a: field.';
                }
                field("Primary Objectives"; Rec."Primary Objectives")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the List primary objectives field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Provide project description field.';
                }
                field(Funding; Rec.Funding)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seeking funding for project? field.';
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Attached field.';
                }
                field("Support Description"; Rec."Support Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the If no, how will project be supported field.';
                }
                field("Funding Application Deadline"; Rec."Funding Application Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Application Deadline field.';
                }
                field("Res. & Working Approval"; Rec."Res. & Working Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received research working group approval? field.';
                }
                field("Ampath Data Anlsys Team App"; Rec."Ampath Data Anlsys Team App")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Ampath Data analysis approval? field.';
                }
                field("IREC Approval"; Rec."IREC Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received IREC approval? field.';
                }
                field("EIPL Approval"; Rec."EIPL Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Export/Import Permits for Laboratory Specimens? field.';
                }
            }
            group(Biostatistics)
            {
                field("Study Population"; Rec."Study Population")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe study population yoiu plan to work with field.';
                }
                field("Sampling methods"; Rec."Sampling methods")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe proposed sampling methods field.';
                }
                field("Dependent Variables"; Rec."Dependent Variables")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe dependent variables for this study field.';
                }
                field("Independent Variables"; Rec."Independent Variables")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe independent variables included field.';
                }
                field("Project Statistician Name"; Rec."Project Statistician Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Statistician Name field.';
                }
                field("PS Primary Inst. Affiliation"; Rec."PS Primary Inst. Affiliation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project statistician primary institution affiliation field.';
                }
                field("PS Address"; Rec."PS Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project statistician address field.';
                }
                field(PSTelephone; Rec.PSTelephone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Statistician Telephone field.';
                }
                field("PS Fax"; Rec."PS Fax")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Statistician FAX';
                    ToolTip = 'Specifies the value of the Project Statistician FAX field.';
                }
                field("PS Email"; Rec."PS Email")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project Statistician Emaill';
                    ToolTip = 'Specifies the value of the Project Statistician Emaill field.';
                }
            }
            group("Lab Requirements")
            {
                field("LTA Test  Known"; Rec."LTA Test  Known")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lab testing algorithm known field.';
                }
                field("LTA Proposal Submission"; Rec."LTA Proposal Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Algorithm included with this proposal submission field.';
                }
                field("LTA Description"; Rec."LTA Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe proposed testing schedule field.';
                }
                field("Covered Tests"; Rec."Covered Tests")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Are all test lists covered by current test list? field.';
                }
                field("SPR study"; Rec."SPR study")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special processing requirements required? field.';
                }
                field("SPR Description"; Rec."SPR Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe special processing required field.';
                }
                field("Sample Storage Requirements"; Rec."Sample Storage Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special storage requirements for samples? field.';
                }
                field(SampleStorgePeriod; Rec.SampleStorgePeriod)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the How long do samples need to be stored? field.';
                }
                field("SSR Destruction prot"; Rec."SSR Destruction prot")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special protocol required for sample destruction? field.';
                }
                field("SSR Shipment?"; Rec."SSR Shipment?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Do samples need to be shipped? field.';
                }
                field("SSR Description"; Rec."SSR Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe above special requirements field.';
                }
                field("Data Storage Requirements"; Rec."Data Storage Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special data storage requirements? field.';
                }
                field("DSR Description"; Rec."DSR Description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe special data storage requirements field.';
                }
                field("Special Requirements"; Rec."Special Requirements")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Requirements for laboratory staff? field.';
                }
                field("Odd Working Hours"; Rec."Odd Working Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is there need for extended working hours field.';
                }
                field("Odd working hours description"; Rec."Odd working hours description")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Describe above field.';
                }
                field("Staff Specification"; Rec."Staff Specification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staff Specification field.';
                }
            }
        }
    }

    actions { }
}
