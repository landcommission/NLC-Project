#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52193898 "Compliance journal List"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Compliance journal";
    ApplicationArea = All;
    Caption = 'Compliance journal List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Grant No"; Rec."Grant No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grant No field.';
                }
                field("Compliance Code"; Rec."Compliance Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Compliance Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Complied; Rec.Complied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complied field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Post Compliance Report")
            {
                ApplicationArea = Basic;
                Caption = 'Post Compliance Report';
                ToolTip = 'Executes the Post Compliance Report action.';
                trigger OnAction()
                begin
                    objcomplianceJournal.Reset();
                    objcomplianceJournal.SetRange(objcomplianceJournal."Grant No", Rec."Grant No");
                    //objcomplianceJournal.SETRANGE(objcomplianceJournal."Compliance Code","Compliance Code");
                    objcomplianceJournal.SetRange(objcomplianceJournal."Document No", Rec."Document No");
                    objcomplianceJournal.SetRange(objcomplianceJournal.Complied, false);
                    if objcomplianceJournal.Find('-') then
                        Error('One or more compliance not yet');

                    if Confirm('Are you sure you want to post the compliance report') then begin

                        //Insert sasa--------------------------------------------------------------------------------------
                        objcomplianceJournal.Reset();
                        objcomplianceJournal.SetRange(objcomplianceJournal."Grant No", Rec."Grant No");
                        objcomplianceJournal.SetRange(objcomplianceJournal."Document No", Rec."Document No");
                        if objCompliance.Find('-') then
                            repeat
                                objCompLedgerEntries.Init();
                                objCompLedgerEntries."Grant No" := objcomplianceJournal."Grant No";
                                objCompLedgerEntries."Compliance Code" := objcomplianceJournal."Compliance Code";
                                objCompLedgerEntries.Description := objcomplianceJournal.Description;
                                objCompLedgerEntries."Document No" := objcomplianceJournal."Document No";
                                objCompLedgerEntries."Document Date" := objcomplianceJournal."Document Date";
                                objCompLedgerEntries.User := UserId;
                                objCompLedgerEntries.Amount := objcomplianceJournal.Amount;
                                objCompLedgerEntries.Comments := objcomplianceJournal.Comments;
                                objCompLedgerEntries.Insert();
                            until objcomplianceJournal.Next() = 0;
                    end;

                    //Delete journal entries--------------------------------------------------------------------------
                    objcomplianceJournal.Reset();
                    objcomplianceJournal.SetRange(objcomplianceJournal."Grant No", Rec."Grant No");
                    objcomplianceJournal.SetRange(objcomplianceJournal."Document No", Rec."Document No");
                    objcomplianceJournal.SetRange(objcomplianceJournal.Complied, true);
                    if objcomplianceJournal.Find('-') then
                        objcomplianceJournal.DeleteAll();

                    Message('Compliance Successfully updated');
                end;
            }
        }
    }

    var
        objCompliance: Record "Grants Compliance";
        objCompLedgerEntries: Record "Compliance ledger Entries";
        objcomplianceJournal: Record "Compliance journal";
}
