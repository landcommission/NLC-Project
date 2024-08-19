#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 60002 "Code Coverage Code"
{
    // **************************************************************************************************************************
    // Microsoft provides programming examples for illustration only, without warranty either expressed or implied, including,
    // but not limited to, the implied warranties of merchantability or fitness for a particular purpose. This posting assumes
    // that you are familiar with the programming language that is being demonstrated and the tools that are used to create and
    // debug procedures.
    //
    // Copyright ® Microsoft Corporation. All Rights Reserved.
    // This code released under the terms of the
    // Microsoft Public License (MS-PL, http://opensource.org/licenses/ms-pl.html)
    // **************************************************************************************************************************

    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Code Coverage";
    ApplicationArea = All;
    Caption = 'Code Coverage Code';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = LineStyle;
                    ToolTip = 'Specifies the line number, when tracking which part of the application code has been exercised during test activity.';
                }
                field(Line; Rec.Line)
                {
                    ApplicationArea = Basic;
                    StyleExpr = LineStyle;
                    ToolTip = 'Specifies the value of the Line field.';
                }
            }
        }
    }

    actions { }

    trigger OnAfterGetRecord()
    begin
        LineStyle := 'None';

        case true of
            Rec."Line Type" = Rec."Line Type"::Object:
                LineStyle := 'Strong';
            Rec."Line Type" = Rec."Line Type"::"Trigger/Function":
                LineStyle := 'StrongAccent';
            (Rec."Line Type" = Rec."Line Type"::Code) and (Rec."No. of Hits" = 0):
                LineStyle := 'Ambiguous';
            (Rec."Line Type" = Rec."Line Type"::Empty):
                LineStyle := 'Ambiguous';
        end;
    end;

    var
        LineStyle: Text;
}
