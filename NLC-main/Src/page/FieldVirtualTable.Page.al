#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 70010 "Field Virtual Table"
{
    PageType = List;
    SourceTable = "Field";
    SourceTableView = where(TableNo = filter(39003900 .. 80000000));
    ApplicationArea = All;
    Caption = 'Field Virtual Table';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(TableNo; Rec.TableNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the table number.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID number of the field in the table.';
                }
                field(TableName; Rec.TableName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the table.';
                }
                field(FieldName; Rec.FieldName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the field in the table.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of the field in the table, which indicates the type of data it contains.';
                }
                field(Len; Rec.Len)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Len field.';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of class. Normal is data entry, FlowFields calculate and display results immediately, and FlowFilters display results based on user-defined filter values that affect the calculation of a FlowField.';
                }
                field(Enabled; Rec.Enabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enabled field.';
                }
                field("Type Name"; Rec."Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of data.';
                }
                field("Field Caption"; Rec."Field Caption")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the caption of the field, that is, the name that will be shown in the user interface.';
                }
                field(RelationTableNo; Rec.RelationTableNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID number of a table from which the field on the current table gets data. For example, the field can provide a lookup into another table.';
                }
                field(RelationFieldNo; Rec.RelationFieldNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of any related field.';
                }
                field(SQLDataType; Rec.SQLDataType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the SQL data type.';
                }
                field(OptionString; Rec.OptionString)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the option string.';
                }
            }
        }
    }

    actions { }
}
