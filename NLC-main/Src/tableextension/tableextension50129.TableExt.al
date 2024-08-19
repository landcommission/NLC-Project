#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
tableextension 50129 tableextension50129 extends Job
{
    fields
    {
        field(50001; "Approval Status"; Option)
        {
            Editable = true;
            OptionMembers = Open,"Pending Approval",Approved;
            Caption = 'Approval Status';
            DataClassification = CustomerContent;
        }
        field(39004240; Type; Option)
        {
            OptionCaption = ' ,WIP';
            OptionMembers = " ",WIP;
            Caption = 'Type';
            DataClassification = CustomerContent;
        }
        field(39004241; "WIP Vendor"; Code[20])
        {
            TableRelation = Vendor;
            Caption = 'WIP Vendor';
            DataClassification = CustomerContent;
        }
        field(39004242; "FA Class Code"; Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
            DataClassification = CustomerContent;
        }
        field(39004243; "FA Subclass Code"; Code[10])
        {
            Caption = 'FA Subclass Code';
            TableRelation = "FA Subclass";
            DataClassification = CustomerContent;

        }
        field(39004244; "Expected FA Quantity"; Integer)
        {
            InitValue = 1;
            MinValue = 1;
            Caption = 'Expected FA Quantity';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.TestField(Rec."No. of FA Created", 0);
                Rec."FA Quantity to Register" := 0;
            end;
        }
        field(39004245; "FA No."; Code[20])
        {
            CalcFormula = lookup("Fixed Asset"."No." where("WIP No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'FA No.';
        }
        field(39004246; "Depreciation Book Code"; Code[10])
        {
            Caption = 'Depreciation Book Code';
            NotBlank = true;
            TableRelation = "Depreciation Book";
            DataClassification = CustomerContent;
        }
        field(39004247; "Depreciation Method"; Option)
        {
            Caption = 'Depreciation Method';
            OptionCaption = 'Straight-Line,Declining-Balance 1,Declining-Balance 2,DB1/SL,DB2/SL,User-Defined,Manual';
            OptionMembers = "Straight-Line","Declining-Balance 1","Declining-Balance 2","DB1/SL","DB2/SL","User-Defined",Manual;
            DataClassification = CustomerContent;
        }
        field(39004248; "Straight-Line %"; Decimal)
        {
            Caption = 'Straight-Line %';
            DecimalPlaces = 2 : 8;
            MinValue = 0;
            DataClassification = CustomerContent;
        }
        field(39004249; "FA Posting Group"; Code[10])
        {
            Caption = 'FA Posting Group';
            TableRelation = "FA Posting Group";
            DataClassification = CustomerContent;
        }
        field(39004250; "No. of FA Created"; Integer)
        {
            Editable = false;
            Caption = 'No. of FA Created';
            DataClassification = CustomerContent;
        }
        field(39004251; "FA Quantity to Register"; Integer)
        {
            MinValue = 0;
            Caption = 'FA Quantity to Register';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if Rec."FA Quantity to Register" = 0 then
                    exit;

                if (Rec."No. of FA Created" + Rec."FA Quantity to Register") > Rec."Expected FA Quantity" then
                    Error(Text103, Rec."Expected FA Quantity" - Rec."No. of FA Created", FA.TableCaption);
            end;
        }
        field(39004252; "FA Location Code"; Code[10])
        {
            Caption = 'FA Location Code';
            TableRelation = "FA Location";
            DataClassification = CustomerContent;
        }
        field(39004253; "Amount Posted to FA"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Job Task"."Amount Posted to FA" where("Job No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Amount Posted to FA';
        }
        field(39004254; "WIP Re-Opened By"; Code[20])
        {
            Caption = 'WIP Re-Opened By';
            DataClassification = CustomerContent;
        }
        field(39004255; "WIP Re-Opened Date-Time"; DateTime)
        {
            Editable = false;
            Caption = 'WIP Re-Opened Date-Time';
            DataClassification = CustomerContent;
        }
        field(39004256; "Last Cost Transferred"; Decimal)
        {
            Editable = false;
            Caption = 'Last Cost Transferred';
            DataClassification = CustomerContent;
        }
        field(39004257; "Invoice Posting Status"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Created,Posted';
            OptionMembers = " ",Created,Posted;
            Caption = 'Invoice Posting Status';
            DataClassification = CustomerContent;
        }
        field(39004258; "WIP Cost Transferred"; Boolean)
        {
            Editable = false;
            Caption = 'WIP Cost Transferred';
            DataClassification = CustomerContent;
        }
        field(39004259; "Date Filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowFilter;
        }
        field(39004260; "Resource Cost"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Price" where("Job No." = field("No."),
                                                                       "Line Type" = filter("Both Budget and Billable" | Billable),
                                                                       Type = const(Resource)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Resource Cost';
        }
        field(39004261; "Usage Cost Invoice"; Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Price" where("Job No." = field("No."),
                                                                       "Line Type" = filter("Both Budget and Billable" | Billable),
                                                                       Type = filter(<> Resource)));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'Usage Cost Invoice';
        }
        field(39004262; "WIP GL Balance (LCY)"; Decimal)
        {
            CalcFormula = sum("Job WIP G/L Entry"."WIP Entry Amount" where("Job No." = field("No."),
                                                                            "Posting Date" = field("Date Filter")));
            Editable = false;
            FieldClass = FlowField;
            Caption = 'WIP GL Balance (LCY)';
        }
        field(39004263; "Actual Completion Time"; Time)
        {
            Caption = 'Actual Completion Time';
            DataClassification = CustomerContent;
        }
        field(39004264; "Planned Starting Date"; Date)
        {
            Caption = 'Planned Starting Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.CheckDateConsistency();
            end;
        }
        field(39004265; "Planned Ending Date"; Date)
        {
            Caption = 'Planned Ending Date';
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                Rec.CheckDateConsistency();
            end;
        }
        field(39004266; "Last Modified By"; Code[20])
        {
            Editable = false;
            TableRelation = User;
            Caption = 'Last Modified By';
            DataClassification = CustomerContent;
        }
        field(39004267; "FA Description"; Text[30])
        {
            Caption = 'FA Description';
            DataClassification = CustomerContent;
        }
        field(39004268; "FA Description 2"; Text[30])
        {
            Caption = 'FA Description 2';
            DataClassification = CustomerContent;
        }
        field(39004269; "Usage (Cost)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where("Entry Type" = const(Usage),
                                                                           "Job No." = field("No."),
                                                                           "Posting Date" = field("Date Filter")));
            Caption = 'Usage (Cost)';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    procedure CheckDateConsistency()
    begin
        case CurrFieldNo of
            Rec.FieldNo(Rec."Planned Starting Date"):
                begin
                    if (Rec."Planned Starting Date" > Rec."Planned Ending Date") and (Rec."Planned Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Planned Starting Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                    if (Rec."Planned Starting Date" < Rec."Starting Date") and (Rec."Starting Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Planned Starting Date"));
                    if (Rec."Planned Starting Date" > Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Planned Starting Date"), Rec.FieldCaption(Rec."Ending Date"));
                end;
            Rec.FieldNo(Rec."Starting Date"):
                begin
                    if (Rec."Starting Date" > Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Ending Date"));
                    if (Rec."Starting Date" < Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Ending Date"), Rec.FieldCaption(Rec."Starting Date"));
                    if (Rec."Starting Date" < Rec."Planned Starting Date") and (Rec."Planned Starting Date" <> 0D) and (Rec."Starting Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Planned Starting Date"));
                end;
            Rec.FieldNo(Rec."Ending Date"):
                begin
                    Rec.TestField(Rec."Starting Date");
                    if (Rec."Ending Date" < Rec."Starting Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Ending Date"));
                    if (Rec."Ending Date" < Rec."Planned Starting Date") and (Rec."Planned Starting Date" <> 0D) and (Rec."Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Ending Date"), Rec.FieldCaption(Rec."Planned Starting Date"));
                end;
            Rec.FieldNo(Rec."Planned Ending Date"):
                begin
                    Rec.TestField(Rec."Planned Starting Date");
                    if (Rec."Planned Ending Date" < Rec."Planned Starting Date") and (Rec."Planned Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Planned Starting Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                    if (Rec."Planned Ending Date" > Rec."Ending Date") and (Rec."Ending Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Ending Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                    if (Rec."Planned Ending Date" < Rec."Starting Date") and (Rec."Starting Date" <> 0D) then
                        Error(Text115, Rec.FieldCaption(Rec."Starting Date"), Rec.FieldCaption(Rec."Planned Ending Date"));
                end;
        end;
    end;

    procedure InitTaskLine()
    var
        Maintenance: Record Maintenance;
        JTIndent: Codeunit "Job Task-Indent";
        JT: Record "Job Task";
        JT1: Record "Job Task";
        Text102: Label 'TOTAL';
        SuggestLines: Record "FA WIP Suggest Lines";
        LineNo: Integer;
    begin
        if (Rec."Bill-to Customer No." = '') or (Rec.Description = '') then
            exit;

        JT.Init();
        JT."Job No." := Rec."No.";
        JT."Job Task No." := '1000';
        JT."Job Task Type" := JT."Job Task Type"::"Begin-Total";
        JT.Description := Rec.Description;
        if not JT.Insert() then
            JT.Modify();


        JT.Init();
        JT."Job No." := Rec."No.";
        JT."Job Task No." := '99999';
        JT."Job Task Type" := JT."Job Task Type"::"End-Total";
        JT.Description := CopyStr(Text102 + ' ' + Rec.Description, 1, MaxStrLen(JT.Description));
        if not JT.Insert() then
            JT.Modify();


        //Insert the task lines
        Clear(SuggestLines);
        if not SuggestLines.FindFirst() then
            exit;
        LineNo := 1;
        repeat
            JT.Init();
            JT."Job Task No." := Format(1000 + LineNo);
            JT.Description := SuggestLines.Description;
            if not JT.Insert() then
                JT.Modify();

            LineNo += 1;
        until SuggestLines.Next(1) = 0;

        JTIndent.Indent(Rec."No.");
    end;

    var
        Text103: Label 'You cannot create more than %1 %2 on this account.';
        Text115: Label '%1 cannot be after %2';
        FA: Record "Fixed Asset";
}
