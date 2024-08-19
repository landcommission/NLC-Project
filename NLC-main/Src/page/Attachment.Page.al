#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 50011 Attachment
{
    Editable = true;
    PageType = List;
    SourceTable = Attachments;
    ApplicationArea = All;
    Caption = 'Attachment';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Document_No; Rec.Document_No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document_No field.';
                }
                field(Link; Rec.Link)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link field.';
                }
                field(Module; Rec.Module)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Module field.';
                }
                field(FileType; Rec.FileType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FileType field.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User field.';
                }
                field(FileName; Rec.FileName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FileName field.';
                }
                field(DocumentID; Rec.DocumentID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DocumentID field.';
                }
                field(Order_No; Rec.Order_No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Order_No field.';
                }
            }
        }
    }

    actions { }
}
