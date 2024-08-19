report 69616 "Vacancy Announcement Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Vacancy Announcement Summary.rdlc';

    dataset
    {
        dataitem("Vacancy Announcement";"Vacancy Announcement")
        {
            column(Name;CI.Name)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(AnnouncementNo_VacancyAnnouncement;"Vacancy Announcement"."Announcement No.")
            {
            }
            column(PostingType_VacancyAnnouncement;"Vacancy Announcement"."Posting Type")
            {
            }
            column(RecruitmentAgencyNo_VacancyAnnouncement;"Vacancy Announcement"."Recruitment Agency No.")
            {
            }
            column(AgencyName_VacancyAnnouncement;"Vacancy Announcement"."Agency Name")
            {
            }
            column(ActualRecruiterFees_VacancyAnnouncement;"Vacancy Announcement"."Actual Recruiter Fees")
            {
            }
            column(CareerFairVenue_VacancyAnnouncement;"Vacancy Announcement"."Career Fair Venue")
            {
            }
            column(CareerFairDate_VacancyAnnouncement;"Vacancy Announcement"."Career Fair Date")
            {
            }
            column(CareerFairStartTime_VacancyAnnouncement;"Vacancy Announcement"."Career Fair Start Time")
            {
            }
            column(CareerFairEndTime_VacancyAnnouncement;"Vacancy Announcement"."Career Fair End Time")
            {
            }
            column(NoofParticipants_VacancyAnnouncement;"Vacancy Announcement"."No. of Participants")
            {
            }
            column(DocumentDate_VacancyAnnouncement;"Vacancy Announcement"."Document Date")
            {
            }
            column(HROfficerUserID_VacancyAnnouncement;"Vacancy Announcement"."HR Officer User ID")
            {
            }
            column(HROfficerStaffNo_VacancyAnnouncement;"Vacancy Announcement"."HR Officer Staff No.")
            {
            }
            column(StaffName_VacancyAnnouncement;"Vacancy Announcement"."Staff Name")
            {
            }
            column(Directorate_VacancyAnnouncement;"Vacancy Announcement".Directorate)
            {
            }
            column(Department_VacancyAnnouncement;"Vacancy Announcement".Department)
            {
            }
            column(Region_VacancyAnnouncement;"Vacancy Announcement".Region)
            {
            }
            column(FinancialYearCode_VacancyAnnouncement;"Vacancy Announcement"."Financial Year Code")
            {
            }
            column(DatePublished_VacancyAnnouncement;"Vacancy Announcement"."Date Published")
            {
            }
            column(ApplicationClosingDate_VacancyAnnouncement;"Vacancy Announcement"."Application Closing Date")
            {
            }
            column(ApplicationClosingTime_VacancyAnnouncement;"Vacancy Announcement"."Application Closing  Time")
            {
            }
            column(NoofJobVacancies_VacancyAnnouncement;"Vacancy Announcement"."No. of Job Vacancies")
            {
            }
            column(AdvertisementCost_VacancyAnnouncement;"Vacancy Announcement"."Advertisement Cost")
            {
            }
            column(ApprovalStatus_VacancyAnnouncement;"Vacancy Announcement"."Approval Status")
            {
            }
            column(CreatedOn_VacancyAnnouncement;"Vacancy Announcement"."Created On")
            {
            }
            column(CreatedTime_VacancyAnnouncement;"Vacancy Announcement"."Created Time")
            {
            }
            column(OrganizationName_VacancyAnnouncement;"Vacancy Announcement"."Organization Name")
            {
            }
            column(OrganizationOverview_VacancyAnnouncement;"Vacancy Announcement"."Organization Overview")
            {
            }
            column(Address_VacancyAnnouncement;"Vacancy Announcement".Address)
            {
            }
            column(Address2_VacancyAnnouncement;"Vacancy Announcement"."Address 2")
            {
            }
            column(City_VacancyAnnouncement;"Vacancy Announcement".City)
            {
            }
            column(PostCode_VacancyAnnouncement;"Vacancy Announcement"."Post Code")
            {
            }
            column(CountryRegionCode_VacancyAnnouncement;"Vacancy Announcement"."Country/Region Code")
            {
            }
            column(PhoneNo_VacancyAnnouncement;"Vacancy Announcement"."Phone No.")
            {
            }
            column(Contact_VacancyAnnouncement;"Vacancy Announcement".Contact)
            {
            }
            column(Email_VacancyAnnouncement;"Vacancy Announcement".Email)
            {
            }
            column(HomePage_VacancyAnnouncement;"Vacancy Announcement"."Home Page")
            {
            }
            column(NoSeries_VacancyAnnouncement;"Vacancy Announcement"."No. Series")
            {
            }
            column(CreatedBy_VacancyAnnouncement;"Vacancy Announcement"."Created By")
            {
            }
            column(Description_VacancyAnnouncement;"Vacancy Announcement".Description)
            {
            }
            dataitem("Vacancy Announcement Line";"Vacancy Announcement Line")
            {
                column(AnnouncementNo_VacancyAnnouncementLine;"Vacancy Announcement Line"."Announcement No.")
                {
                }
                column(PostingType_VacancyAnnouncementLine;"Vacancy Announcement Line"."Posting Type")
                {
                }
                column(VacancyID_VacancyAnnouncementLine;"Vacancy Announcement Line"."Vacancy ID")
                {
                }
                column(SourcingMethod_VacancyAnnouncementLine;"Vacancy Announcement Line"."Sourcing Method")
                {
                }
                column(PositionID_VacancyAnnouncementLine;"Vacancy Announcement Line"."Position ID")
                {
                }
                column(JobTitleDesignation_VacancyAnnouncementLine;"Vacancy Announcement Line"."Job Title/Designation")
                {
                }
                column(DutyStationID_VacancyAnnouncementLine;"Vacancy Announcement Line"."Duty Station ID")
                {
                }
                column(WorkLocationDetails_VacancyAnnouncementLine;"Vacancy Announcement Line"."Work Location Details")
                {
                }
                column(NoofOpenings_VacancyAnnouncementLine;"Vacancy Announcement Line"."No. of Openings")
                {
                }
                column(RecruitmentReasonCode_VacancyAnnouncementLine;"Vacancy Announcement Line"."Recruitment Reason Code")
                {
                }
                column(TargetCandidateSource_VacancyAnnouncementLine;"Vacancy Announcement Line"."Target Candidate Source")
                {
                }
                column(JobNo_VacancyAnnouncementLine;"Vacancy Announcement Line"."Job No.")
                {
                }
                column(TaskNo_VacancyAnnouncementLine;"Vacancy Announcement Line"."Task No.")
                {
                }
                column(FundingSourceID_VacancyAnnouncementLine;"Vacancy Announcement Line"."Funding Source ID")
                {
                }
                column(DesignationGroup_VacancyAnnouncementLine;"Vacancy Announcement Line"."Designation Group")
                {
                }
                column(DirectlyReportsTo_VacancyAnnouncementLine;"Vacancy Announcement Line"."(Directly) Reports To")
                {
                }
                column(IndirectlyReportsTo_VacancyAnnouncementLine;"Vacancy Announcement Line"."(Indirectly) Reports To")
                {
                }
                column(JobGradeID_VacancyAnnouncementLine;"Vacancy Announcement Line"."Job Grade ID")
                {
                }
                column(OverallAppointmentAuthority_VacancyAnnouncementLine;"Vacancy Announcement Line"."Overall Appointment Authority")
                {
                }
                column(SeniorityLevel_VacancyAnnouncementLine;"Vacancy Announcement Line"."Seniority Level")
                {
                }
                column(TermsofServiceCode_VacancyAnnouncementLine;"Vacancy Announcement Line"."Terms of Service Code")
                {
                }
                column(EmploymentType_VacancyAnnouncementLine;"Vacancy Announcement Line"."Employment Type")
                {
                }
                column(ApplicationClosingDate_VacancyAnnouncementLine;"Vacancy Announcement Line"."Application Closing Date")
                {
                }
                column(ApplicationClosingTime_VacancyAnnouncementLine;"Vacancy Announcement Line"."Application Closing  Time")
                {
                }
                column(LineBudgetCostLCY_VacancyAnnouncementLine;"Vacancy Announcement Line"."Line Budget Cost (LCY)")
                {
                }
                column(ActualJobBoardCost_VacancyAnnouncementLine;"Vacancy Announcement Line"."Actual Job Board  Cost")
                {
                }
                column(ActualRecruiterFees_VacancyAnnouncementLine;"Vacancy Announcement Line"."Actual Recruiter Fees")
                {
                }
                column(AdvertisementLineCost_VacancyAnnouncementLine;"Vacancy Announcement Line"."Advertisement Line Cost")
                {
                }
                column(LineNo_VacancyAnnouncementLine;"Vacancy Announcement Line"."Line No.")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

