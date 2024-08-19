#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 70005 "Object Renumbering Setup"
{
    // Object_VT.SETFILTER(Type,'%1|%2|%3|%4|%5|%6',1,3,5,6,8,9); //Table,Report,Codeunit,XMLport,Page,Query
    // Object_VT.SETRANGE(Type,Object_VT.Type::Table);
    // Object_VT.SETRANGE(Type,Object_VT.Type::Report);
    // Object_VT.SETRANGE(Type,Object_VT.Type::Codeunit);
    // Object_VT.SETRANGE(Type,Object_VT.Type::XMLport);
    // Object_VT.SETRANGE(Type,Object_VT.Type::Page);
    // Object_VT.SETRANGE(Type,Object_VT.Type::Query);

    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "Object Renumbering Setup";
    ApplicationArea = All;
    Caption = 'Object Renumbering Setup';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Key field.';
                }
                field("Database Name"; Rec."Database Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Database Name field.';
                }
                field("Connnection String"; Rec."Connnection String")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Connnection String field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Change Coretec Object Names")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Change Coretec Object Names action.';
                trigger OnAction()
                begin

                    if Confirm('Update object names with "_OLD" characters at the end?', false) = false then
                        Error('Process aborted');

                    Object_VT.Reset();
                    Object_VT.SetRange(Type, Object_VT.Type::Report);
                    Object_VT.SetRange(ID, 39003900, 60000000); //Coretec object ranges
                    if Object_VT.FindSet() then begin
                        repeat
                            //Remove charaters "_OLD" on the object name
                            Object_VT.Name := DelChr(Object_VT.Name, '>', '_OLD');

                            //Add "_0LD" charater to object name at the end
                            Object_VT.Name := Object_VT.Name + '_OLD';

                            //Maximum length of object name is 50 characters
                            if StrLen(Object_VT.Name) >= 50 then
                                Error('%1 name exceeds 50 characters maximum', Format(Object_VT.ID) + ' - ', Format(Object_VT.Type) + ' - ' + Object_VT.Name);

                            //Change only these object types
                            if Object_VT.Type in [
                                                  Object_VT.Type::Table,
                                                  Object_VT.Type::Page,
                                                  Object_VT.Type::Report,
                                                  Object_VT.Type::Codeunit,
                                                  Object_VT.Type::Query,
                                                  Object_VT.Type::XMLport
                                                 ]
                                                 then
                                Object_VT.Modify();


                        until Object_VT.Next() = 0;
                        Message('Process complete');
                    end else
                        Error('No objects found within the filter');
                end;
            }
        }
    }

    var
        Object_VT: Record Object;
}
