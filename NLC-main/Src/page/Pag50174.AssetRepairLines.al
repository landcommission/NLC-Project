#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50174 "Asset Repair Lines"
{
    PageType = ListPart;
    SourceTable = "Asset Repair Lines";
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Request No."; "Request No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(AssetType; Rec."Asset Type")
                {
                    ApplicationArea = Basic;
                }
                field(RegistartionNo; Rec."Registartion No")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AssetNo; Rec."Asset No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ServiceProvider; Rec."Service Provider")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceProviderName; Rec."Service Provider Name")
                {
                    ApplicationArea = Basic;
                }
                field(TypeofMaitenance; Rec."Type of Maitenance")
                {
                    ApplicationArea = Basic;
                }
                field(MaitenanceDescription; Rec."Maitenance Description")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceDate; Rec."Service Date")
                {
                    ApplicationArea = Basic;
                }
                field(CurrentMileage; Rec."Current Mileage")
                {
                    ApplicationArea = Basic;
                }
                field(NextServiceMileage; Rec."Next Service Mileage")
                {
                    ApplicationArea = Basic;
                }
                field(ServiceMileage; Rec."Service Mileage")
                {
                    ApplicationArea = Basic;
                }
                field(ApproximateServiceDate; Rec."Approximate Service Date")
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        CurrPage.Update;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Officer Recommendation")
            {
                ApplicationArea = Basic;
                Image = Comment;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Repair Recommendation Card";
                RunPageLink = "Repair No" = field("Request No."),
                              "Vehicle No" = field("Registartion No");

                trigger OnAction()
                begin
                    //test Amos
                end;
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    begin
        CurrPage.Update;
    end;
}
