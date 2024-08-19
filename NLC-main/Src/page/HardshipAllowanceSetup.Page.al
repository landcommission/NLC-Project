#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
page 69056 "Hardship Allowance Setup"
{
    Caption = 'Dimension Values';
    DataCaptionFields = "Dimension Code";
    DelayedInsert = true;
    PageType = List;
    SourceTable = "Dimension Value";
    SourceTableView = where("Dimension Code" = const('REGION'));
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                IndentationColumn = NameIndent;
                IndentationControls = Name;
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Dimensions;
                    Style = Strong;
                    StyleExpr = Emphasize;
                    ToolTip = 'Specifies the code for the dimension value.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Dimensions;
                    Style = Strong;
                    StyleExpr = Emphasize;
                    ToolTip = 'Specifies a descriptive name for the dimension value.';
                }
                field("Hardship Area"; Rec."Hardship Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hardship Area field.';
                    trigger OnValidate()
                    begin
                        if Rec."Hardship Area" = true then
                            Rec."Hardship Type" := Rec."Hardship Type"::Extreme
                        else
                            Rec."Hardship Type" := Rec."Hardship Type"::" ";
                    end;
                }
                field("Hardship Type"; Rec."Hardship Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hardship Type field.';
                    trigger OnValidate()
                    begin
                        if Rec."Hardship Type" = Rec."Hardship Type"::" " then
                            Rec."Hardship Area" := false
                        else
                            Rec."Hardship Area" := true;
                    end;
                }
            }
        }
        area(FactBoxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Indent Dimension Values")
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Indent Dimension Values';
                    Image = Indent;
                    RunObject = codeunit "Dimension Value-Indent";
                    RunPageOnRec = true;
                    ToolTip = 'Indent dimension values between a Begin-Total and the matching End-Total one level to make the list easier to read.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        NameIndent := 0;
        FormatLine();
    end;

    trigger OnOpenPage()
    var
        DimensionCode: Code[20];
    begin
        if Rec.GetFilter("Dimension Code") <> '' then
            DimensionCode := Rec.GetRangeMin("Dimension Code");
        if DimensionCode <> '' then begin
            Rec.FilterGroup(2);
            Rec.SetRange("Dimension Code", DimensionCode);
            Rec.FilterGroup(0);
        end;
    end;

    var
        [InDataSet]
        Emphasize: Boolean;
        [InDataSet]
        NameIndent: Integer;

    local procedure FormatLine()
    begin
        Emphasize := Rec."Dimension Value Type" <> Rec."Dimension Value Type"::Standard;
        NameIndent := Rec.Indentation;
    end;
}

#pragma implicitwith restore

