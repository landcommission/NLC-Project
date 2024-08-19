#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50160 pageextension50160 extends "Sales Manager Role Center"
{

    //Unsupported feature: Property Modification (Name) on ""Sales Manager Role Center"(Page 9005)".

    layout
    {
        modify(Control4)
        {

            //Unsupported feature: Property Modification (PagePartID) on "Control4(Control 4)".

            Caption = 'Employees Cue';
        }

        //Unsupported feature: Property Modification (PartType) on "Control1(Control 1)".


        //Unsupported feature: Property Insertion (SystemPartID) on "Control1(Control 1)".


        //Unsupported feature: Property Modification (ControlType) on "Control6(Control 6)".


        //Unsupported feature: Property Modification (Name) on "Control6(Control 6)".


        //Unsupported feature: Property Insertion (ContainerType) on "Control6(Control 6)".


        modify(Control1900724808)
        {
            Visible = false;
        }

        modify(Control1907692008)
        {
            Visible = false;
        }
        modify(Control1900724708)
        {
            Visible = false;
        }
        modify(Control11)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (PagePartID) on "Control1(Control 1)".


        //Unsupported feature: Property Deletion (Visible) on "Control1(Control 1)".

        modify(Control1902476008)
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Level) on "Control6(Control 6)".


        //Unsupported feature: Property Deletion (PagePartID) on "Control6(Control 6)".


        //Unsupported feature: Property Deletion (PartType) on "Control6(Control 6)".

        modify(Control31)
        {
            Visible = false;
        }
        addafter(Control6)
        {
            group(Control5) { }
        }
        addafter(Control4)
        {
            group(Control3)
            {
                systempart(Control2; Links)
                {
                    ApplicationArea = All;
                }
            }
        }

    }
    actions
    {

        //Unsupported feature: Property Modification (ActionType) on ""Sales Analysis Reports"(Action 9)".


        //Unsupported feature: Property Modification (Name) on ""Sales Analysis Reports"(Action 9)".


        //Unsupported feature: Property Insertion (ActionContainerType) on ""Sales Analysis Reports"(Action 9)".

        modify("Sales Budgets")
        {
            Caption = 'HR Leave Application';

            //Unsupported feature: Property Modification (RunObject) on ""Sales Budgets"(Action 8)".


            //Unsupported feature: Property Modification (Name) on ""Sales Budgets"(Action 8)".


            //Unsupported feature: Property Insertion (Promoted) on ""Sales Budgets"(Action 8)".


            //Unsupported feature: Property Insertion (Image) on ""Sales Budgets"(Action 8)".

        }
        /* modify(Open)
        {
            Caption = 'HR Leave Balance';

            //Unsupported feature: Property Modification (RunObject) on "Open(Action 7)".


            //Unsupported feature: Property Modification (Image) on "Open(Action 7)".


            //Unsupported feature: Property Modification (Name) on "Open(Action 7)".


            //Unsupported feature: Property Insertion (Promoted) on "Open(Action 7)".

        }
        modify(ActionContainer1900000006)
        {
            Visible = false;
        } */
        modify("Customer - &Order Summary")
        {
            Visible = false;
        }
        modify("Customer - &Top 10 List")
        {
            Visible = false;
        }

        modify("S&ales Statistics")
        {
            Visible = false;
        }
        modify("Salesperson - Sales &Statistics")
        {
            Visible = false;
        }
        modify("Salesperson - &Commission")
        {
            Visible = false;
        }

        modify("Campaign - &Details")
        {
            Visible = false;
        }


        //Unsupported feature: Property Deletion (Level) on ""Sales Analysis Reports"(Action 9)".


        //Unsupported feature: Property Deletion (CaptionML) on ""Sales Analysis Reports"(Action 9)".


        //Unsupported feature: Property Deletion (RunObject) on ""Sales Analysis Reports"(Action 9)".


        //Unsupported feature: Property Deletion (ApplicationArea) on ""Sales Analysis Reports"(Action 9)".

        modify("Sales Analysis by Dimensions")
        {
            Visible = false;
        }
        modify("Sales Quotes")
        {
            Visible = false;
        }


        //Unsupported feature: Property Deletion (ShortCutKey) on "Open(Action 7)".


        //Unsupported feature: Property Deletion (RunPageView) on "Open(Action 7)".


        modify(Items)
        {
            Visible = false;
        }
        modify(Contacts)
        {
            Visible = false;
        }
        modify(Customers)
        {
            Visible = false;
        }
        modify(Campaigns)
        {
            Visible = false;
        }
        modify(Segments)
        {
            Visible = false;
        }

        modify(Teams)
        {
            Visible = false;
        }

        modify("Administration Sales/Purchase")
        {
            Visible = false;
        }
        modify("Salespeople/Purchasers")
        {
            Visible = false;
        }
        modify("Cust. Invoice Discounts")
        {
            Visible = false;
        }
        modify("Vend. Invoice Discounts")
        {
            Visible = false;
        }
        modify("Item Disc. Groups")
        {
            Visible = false;
        }


        modify("Sales Price &Worksheet")
        {
            Visible = false;
        }

        modify("Sales &Prices")
        {
            Visible = false;
        }
        modify("Sales Line &Discounts")
        {
            Visible = false;
        }

        addfirst(sections)
        {
            group("HR Leave Management")
            {
                Caption = 'HR Leave Management';
                Image = HumanResources;
                action("HR Leave Application")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Application';
                    RunObject = page "HR Leave Applications List";
                    ToolTip = 'Executes the HR Leave Application action.';
                }
                action("HR Leave Reimbursment ")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Reimbursment ';
                    RunObject = page "HR Leave Reimbursment List";
                    ToolTip = 'Executes the HR Leave Reimbursment  action.';
                }
                action("HR Leave Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Types';
                    RunObject = page "HR Leave Types";
                    ToolTip = 'Executes the HR Leave Types action.';
                }
            }
        }
    }
}

