#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50080 "Items PO Lines Portal"
{
    Editable = true;
    PageType = List;
    SourceTable = "Store Requistion Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    OptionCaption = 'Item,Asset';
                }
                field("Requistion No";"Requistion No")
                {
                    ApplicationArea = Basic;
                }
                field("No.";"No.")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                         ItemRec.Reset;
                         ItemRec.SetRange(ItemRec."No.","No.");
                         if ItemRec.Find('-') then
                            "Unit of Measure":=ItemRec."Purch. Unit of Measure";
                             //"Unit Cost":=ItemRec."Last Direct Cost";
                    end;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Issuing Store";"Issuing Store")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure";"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 1 Code";"Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Shortcut Dimension 2 Code";"Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Quantity Requested";"Quantity Requested")
                {
                    ApplicationArea = Basic;
                }
                field("Unit Cost";"Unit Cost")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin

                        "Line Amount":="Unit Cost"*"Quantity Delivered"
                    end;
                }
                field("Line Amount";"Line Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Request Status";"Request Status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("PO No";"IFMIS Nos")
                {
                    ApplicationArea = Basic;
                    Caption = 'PO No';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
           Type:=Type::Item;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
          Type:=Type::Item;
    end;

    var
        ItemRec: Record Item;
}

