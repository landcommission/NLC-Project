#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 70004 "Object Virtual Table"
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
    SourceTable = Object;
    ApplicationArea = All;
    Caption = 'Object Virtual Table';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Name field.';
                }
                field(ID; Rec.ID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Modified; Rec.Modified)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Modified field.';
                }
                field(Compiled; Rec.Compiled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compiled field.';
                }
                field("Version List"; Rec."Version List")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Version List field.';
                }
                field(Caption; Rec.Caption)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Caption field.';
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

                    if Confirm('Update object names with "_D" characters at the end?', false) = false then
                        Error('Process aborted');

                    Object_VT.Reset();
                    Object_VT.SetRange(ID, 39003900, 60000000); //Coretec object ranges
                    if Object_VT.FindSet() then begin
                        repeat
                            //Remove charaters "_D" on the object name
                            Object_VT.Name := DelChr(Object_VT.Name, '>', '_D');

                            //Add "_D" charater to object name at the end
                            Object_VT.Name := Object_VT.Name + '_D';

                            //Maximum length of object name is 50 characters
                            if StrLen(Object_VT.Name) >= 50 then;
                            //ERROR('%1 name exceeds 50 characters maximum',FORMAT(Object_VT.ID) + ' - ',FORMAT(Object_VT.Type) + ' - ' + Object_VT.Name);

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
                                if Object_VT.Modify() then;


                        until Object_VT.Next() = 0;
                        Message('Process complete');
                    end else
                        Error('No objects found within the filter');
                end;
            }
            action("Update Compiled")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Update Compiled action.';
                trigger OnAction()
                begin
                    Object_VT.Reset();
                    if Object_VT.FindSet() then begin
                        Object_VT.ModifyAll(Compiled, true);
                        Message(MsgComplete);
                    end else
                        Error(ErrAppliedFilters);
                end;
            }
        }
    }

    var
        Object_VT: Record Object;
        MsgComplete: Label 'Process Complete';
        ErrAppliedFilters: Label 'Applied filters do not apply';
}
