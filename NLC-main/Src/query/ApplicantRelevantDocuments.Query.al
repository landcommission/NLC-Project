#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
query 50005 "Applicant Relevant Documents"
{
    Caption = 'Applicant Relevant Documents';
    elements
    {
        dataitem(Applicant_Relevant_Documents; "Applicant Relevant Documents")
        {
            column(Applicant_No; "Applicant No") { }
            column(Job_Application_No; "Job Application No") { }
            column(Helb_Certificate; "Helb Certificate") { }
            column(Good_Conduct_Certificate; "Good Conduct Certificate") { }
            column(CRB_Certificate; "CRB Certificate") { }
            column(EACC_Certificate; "EACC Certificate") { }
            column(KRA_Pin_Certificate; "KRA Pin Certificate") { }
            column(Date_Modified; "Date Modified") { }
            column(Entry_No; "Entry No") { }
        }
    }
}
