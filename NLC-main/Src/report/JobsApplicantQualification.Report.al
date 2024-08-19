#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 52193709 "Jobs Applicant Qualification"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Jobs Applicant Qualification.rdlc';
    ApplicationArea = All;
    Caption = 'Jobs Applicant Qualification';
    dataset { }

    requestpage
    {

        layout { }

        actions { }
    }

    labels { }

    var
        HasMasters: Boolean;
        HasDegree: Boolean;
        HasCert: Boolean;
        Cert: Text;
        Degree: Text;
        Master: Text;
        HRApplicantQualifications: Record "HR Applicant Qualifications";
        HasCert1: Boolean;
        Cert1: Text;
        HasDegree1: Boolean;
        Degree1: Text;
        HasMasters1: Boolean;
        Master1: Text;
        Course: Text;
        Guide: Text[100];
        HasDiploma: Boolean;
        Diploma: Text;
        HasDiploma1: Boolean;
        Diploma1: Text;
}
