#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194026 "Contracts Details Card"
{
    PageType = Document;
    SourceTable = Contracts;
    ApplicationArea = All;
    Caption = 'Contracts Details Card';
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Tel No."; Rec."Tel No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tel No. field.';
                }
                field("Advocate Name"; Rec."Advocate Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advocate Name field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Contract Type"; Rec."Contract Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Type field.';
                }
                field("Contract Line"; Rec."Contract Line")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line field.';
                }
                field("Contract Line Type"; Rec."Contract Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Line Type field.';
                }
                field("Contract Cycle"; Rec."Contract Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Cycle field.';
                }
                field("Gen.Category"; Rec."Line Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line Type field.';
                }
                field("Asset/Service No"; Rec."Asset/Service No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset/Service No field.';
                }
                field("Contract Value"; Rec."Contract Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Value field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Renewal No"; Rec."Renewal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal No field.';
                }
                field("Payment Terms"; Rec."Payment Terms")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Terms field.';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Amount Sales"; Rec."Amount Sales")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Sales field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
            }
            part(Others; Others) { }
            part("Contract Milestone Entries"; "Contract Milestone Entries")
            {
                SubPageLink = "Opportunity No." = field("Contract No");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(Expectation)
            {
                ApplicationArea = Basic;
                RunObject = page "Contract Expectation Details-L";
                ToolTip = 'Executes the Expectation action.';
            }
            action(Contract)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Contract action.';
            }
            action("Contract Renewal")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Contract Renewal action.';
                trigger OnAction()
                begin

                    if Rec.Status <> Rec.Status::Closed then begin
                        CopyContr.Type := Rec.Type;
                        CopyContr."Contractor No" := Rec."Contractor No";
                        CopyContr.Name := Rec.Name;
                        CopyContr.Address := Rec.Address;
                        CopyContr."Tel No." := Rec."Tel No.";
                        CopyContr."Contact Person" := Rec."Contact Person";
                        CopyContr."Start Date" := Rec."Start Date";
                        CopyContr."End Date" := Rec."End Date";
                        CopyContr.Status := Rec.Status;
                        CopyContr.Duration := Rec.Duration;
                        CopyContr."Contract Type" := Rec."Contract Type";
                        CopyContr."Contract Line" := Rec."Contract Line";
                        CopyContr."Contract Value" := Rec."Contract Value";
                        //CopyContr.Balance:=
                        CopyContr."Asset/Service No" := Rec."Asset/Service No";
                        CopyContr."Contract Cycle" := Rec."Contract Cycle";
                        CopyContr."Renewal No" := Rec."Contract No";
                        CopyContr.Insert(true);

                        Rec."Renewal No" := CopyContr."Contract No";
                        Rec.Modify();
                    end else
                        Error('The Contract is already Closed');
                end;
            }
            action("Co&mments")
            {
                ApplicationArea = Basic;
                RunObject = page "Comment Sheet";
                ToolTip = 'Executes the Co&mments action.';
            }
            action("Update Contract Milestone")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Update Contract Milestone action.';
                trigger OnAction()
                begin
                    ContMilestones.Reset();
                    ContMilestones.SetRange(ContMilestones."Opportunity No.", Rec."Contractor No");


                    LastStage := false;
                    Invoiced := false;
                    if Rec.Status <> Rec.Status::Active then
                        Error('The Contract should be Active for you to update the Milestones');
                    if Confirm('Are you sure you would like to Update to Next MileStone?', false) = true then begin
                        if Rec."Contract Cycle" = '' then
                            Error('Enter a Contract Cycle/Contract Type Details');

                        ContMilestones.Reset();
                        ContMilestones.SetRange(ContMilestones."Opportunity No.", Rec."Contract No");
                        ContMilestones.SetRange(ContMilestones.Active, true);
                        //If there exists records in contract milestone table then check wat stage and update with next
                        if ContMilestones.Find('-') then begin
                            StageNo := ContMilestones."Sales Cycle Stage";
                            ContMilestones.Active := false;
                            ContMilestones.Modify();
                            //Check whether Expectations Met for previous Stage
                            Expectations.Reset();
                            Expectations.SetRange(Expectations."Contract No", Rec."Contract No");
                            Expectations.SetRange(Expectations."Cycle Stage", StageNo);
                            Expectations.SetRange(Expectations.Done, false);
                            if Expectations.Find('-') then
                                Error('There are Expectations for Stage No. %1 not met Ensure they are met first', StageNo);

                            //Check if payment was expected and whether there exists any invoice details
                            AllStages.Reset();
                            AllStages.SetRange(AllStages."Contract No", Rec."Contract No");
                            AllStages.SetRange(AllStages."Cycle Stage", StageNo);
                            if AllStages.Find('-') then
                                if AllStages."Payment Expected" = AllStages."Payment Expected"::Yes then begin
                                    Expectations.Reset();
                                    Expectations.SetRange(Expectations."Contract No", Rec."Contract No");
                                    Expectations.SetRange(Expectations."Cycle Stage", StageNo);
                                    if Expectations.Find('-') then
                                        repeat
                                            if Expectations."Invoice No" <> '' then
                                                Invoiced := true;
                                        until Expectations.Next() = 0
                                    //Call and Error if no Invoice Linked
                                    //ERROR('Payment was expected for Stage No %1 Please enter the Invoice No.',StageNo);
                                    else
                                        Error('Payment was expected for Stage No %1 Please enter the Invoice No.', StageNo);
                                    if not Invoiced then
                                        Error('Payment was expected for Stage No %1 Please enter the Invoice No.', StageNo);
                                end;

                            //End Checking invoice
                            //End Checking Expectations

                            ContMilestones2.Reset();
                            ContMilestones2.SetRange(ContMilestones2."Sales Cycle Code", Rec."Contract Cycle");
                            ContMilestones2.SetRange(ContMilestones2."Contract Line Type", Rec."Contract Line Type");
                            ContMilestones2.SetRange(ContMilestones2.Stage, (StageNo + 1));

                            if ContMilestones2.Find('-') then begin
                                //Check if its Last Stage and Update as Last Stage
                                ChkContLastStage.Reset();
                                ChkContLastStage.SetRange(ChkContLastStage."Sales Cycle Code", Rec."Contract Cycle");
                                ChkContLastStage.SetRange(ChkContLastStage."Contract Line Type", Rec."Contract Line Type");
                                ChkContLastStage.SetRange(ChkContLastStage.Stage, (StageNo + 2));
                                if not ChkContLastStage.Find('-') then
                                    LastStage := true;
                                //
                                ContMilestones.Init();
                                ContMilestones."Opportunity No." := Rec."Contract No";
                                ContMilestones."Sales Cycle Code" := Rec."Contract Cycle";
                                ContMilestones."Sales Cycle Stage" := ContMilestones2.Stage;
                                ContMilestones."Stage Description" := ContMilestones2.Description;
                                //ContMilestones."Date of Change":=TODAY;
                                ContMilestones.Active := true;
                                ContMilestones."Action Taken" := ContMilestones."Action Taken"::Next;
                                ContMilestones."Previous Sales Cycle Stage" := StageNo;
                                /*Calculate Estimated Period Here*/
                                ContMilestones2.TestField("Date Formula");
                                ContMilestones."Estimated Close Date" := CalcDate(ContMilestones2."Date Formula", Today);
                                ContMilestones."Completed %" := ContMilestones2."Completed %";
                                ContMilestones."Date Closed" := Today;
                                //Update Status to Closed if Last Stage
                                if LastStage then begin
                                    Rec.Status := Rec.Status::Closed;
                                    Rec.Modify();
                                end;
                                //End Updating
                                ContMilestones.Insert();

                            end;
                        end else begin
                            ContMilestones2.Reset();
                            ContMilestones2.SetRange(ContMilestones2."Sales Cycle Code", Rec."Contract Cycle");
                            ContMilestones2.SetRange(ContMilestones2."Contract Line Type", Rec."Contract Line Type");
                            ContMilestones2.SetRange(ContMilestones2.Stage, 1);
                            if ContMilestones2.Find('-') then begin
                                //Check if its Last Stage and Update as Last Stage
                                ChkContLastStage.Reset();
                                ChkContLastStage.SetRange(ChkContLastStage."Sales Cycle Code", Rec."Contract Cycle");
                                ChkContLastStage.SetRange(ChkContLastStage."Contract Line Type", Rec."Contract Line Type");
                                ChkContLastStage.SetRange(ChkContLastStage.Stage, (StageNo + 1));
                                if not ChkContLastStage.Find('-') then
                                    LastStage := true;
                                //
                                ContMilestones.Init();
                                ContMilestones."Opportunity No." := Rec."Contract No";
                                ContMilestones."Sales Cycle Code" := Rec."Contract Cycle";
                                ContMilestones."Sales Cycle Stage" := ContMilestones2.Stage;
                                ContMilestones."Stage Description" := ContMilestones2.Description;
                                //ContMilestones."Date of Change":=TODAY;
                                ContMilestones.Active := true;
                                ContMilestones."Action Taken" := ContMilestones."Action Taken"::Next;
                                ContMilestones."Previous Sales Cycle Stage" := StageNo;
                                ContMilestones."Date Closed" := Today;
                                /*Calculate Estimated Period Here*/
                                ContMilestones2.TestField("Date Formula");
                                ContMilestones."Estimated Close Date" := CalcDate(ContMilestones2."Date Formula", Today);
                                ContMilestones."Completed %" := ContMilestones2."Completed %";
                                //Update Status to Closed if Last Stage
                                if LastStage then begin
                                    Rec.Status := Rec.Status::Closed;
                                    Rec.Modify();
                                end;
                                //End Updating
                                ContMilestones.Insert();

                            end;

                        end;

                    end;

                end;
            }
        }
    }

    var
        ContMilestones: Record "Contract Milestone Entry";
        ContMilestones2: Record "Contract Cycle Stage";
        StageNo: Integer;
        CopyContr: Record Contracts;
        ChkContLastStage: Record "Contract Cycle Stage";
        LastStage: Boolean;
        Expectations: Record "Contract Expectation Details";
        AllStages: Record "All Stages Per Contract";
        Invoiced: Boolean;
}
