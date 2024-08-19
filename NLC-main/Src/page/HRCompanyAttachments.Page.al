#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 52194125 "HR Company Attachments"
{
    Caption = 'HR Company Attachments';
    PageType = List;
    SourceTable = "HR Company Attachments";
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1000000000)
            {
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Description field.';
                }
                field(Attachment; Rec.Attachment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment field.';
                }
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Attachment")
            {
                Caption = '&Attachment';
                action(Open)
                {
                    ApplicationArea = Basic;
                    Caption = 'Open';
                    ToolTip = 'Executes the Open action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(Rec.Code, Rec."Document Description") then
                            if InteractTemplLanguage.Get(DocLink.Code, DocLink."Language Code (Default)", DocLink."Document Description") then
                                InteractTemplLanguage.OpenAttachment();
                    end;
                }
                action(Create)
                {
                    ApplicationArea = Basic;
                    Caption = 'Create';
                    Ellipsis = true;
                    ToolTip = 'Executes the Create action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(Rec.Code, Rec."Document Description") then begin
                            if not InteractTemplLanguage.Get(DocLink.Code, DocLink."Language Code (Default)", DocLink."Document Description") then begin
                                InteractTemplLanguage.Init();
                                InteractTemplLanguage."Interaction Template Code" := Rec.Code;
                                InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                                InteractTemplLanguage.Description := Rec."Document Description";
                            end;
                            InteractTemplLanguage.CreateAttachment();
                            CurrPage.Update();
                            DocLink.Attachment := DocLink.Attachment::Yes;
                            DocLink.Modify();
                        end;
                    end;
                }
                action("Copy &from")
                {
                    ApplicationArea = Basic;
                    Caption = 'Copy &from';
                    Ellipsis = true;
                    Visible = false;
                    ToolTip = 'Executes the Copy &from action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(Rec.Code, Rec."Document Description") then begin

                            if InteractTemplLanguage.Get(DocLink.Code, DocLink."Language Code (Default)", DocLink."Document Description") then
                                InteractTemplLanguage.CopyFromAttachment();
                            CurrPage.Update();
                            //DocLink.Attachment:=DocLink.Attachment::Yes;
                            //DocLink.MODIFY;
                        end;
                    end;
                }
                action(Import)
                {
                    ApplicationArea = Basic;
                    Caption = 'Import';
                    Ellipsis = true;
                    ToolTip = 'Executes the Import action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(Rec.Code, Rec."Document Description") then begin
                            if not InteractTemplLanguage.Get(DocLink."Document Description", DocLink."Language Code (Default)") then begin
                                InteractTemplLanguage.Init();
                                InteractTemplLanguage."Interaction Template Code" := Rec.Code;
                                InteractTemplLanguage."Language Code" := DocLink."Language Code (Default)";
                                InteractTemplLanguage.Description := DocLink."Document Description";
                                InteractTemplLanguage.Insert();
                            end;
                            InteractTemplLanguage.ImportAttachment();
                            CurrPage.Update();
                            DocLink.Attachment := DocLink.Attachment::Yes;
                            DocLink.Modify();
                        end;
                    end;
                }
                action("E&xport")
                {
                    ApplicationArea = Basic;
                    Caption = 'E&xport';
                    Ellipsis = true;
                    ToolTip = 'Executes the E&xport action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(Rec.Code, Rec."Document Description") then
                            if InteractTemplLanguage.Get(DocLink.Code, DocLink."Language Code (Default)", DocLink."Document Description") then
                                InteractTemplLanguage.ExportAttachment();
                    end;
                }
                action(Remove)
                {
                    ApplicationArea = Basic;
                    Caption = 'Remove';
                    Ellipsis = true;
                    ToolTip = 'Executes the Remove action.';
                    trigger OnAction()
                    var
                        InteractTemplLanguage: Record "Interaction Tmpl. Language";
                    begin
                        if DocLink.Get(Rec.Code, Rec."Document Description") then
                            if InteractTemplLanguage.Get(DocLink.Code, DocLink."Language Code (Default)", DocLink."Document Description") then begin
                                InteractTemplLanguage.RemoveAttachment(true);
                                DocLink.Attachment := DocLink.Attachment::No;
                                DocLink.Modify();
                            end;
                    end;
                }
            }
        }
    }

    var
        InteractTemplLanguage: Record "Interaction Tmpl. Language";
        DocLink: Record "HR Company Attachments";


    procedure GetDocument() Document: Text[200]
    begin
        Document := Rec."Document Description";
    end;
}
