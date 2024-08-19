#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
page 60001 "Assign Permissions To Role"
{
    // SauravNavRP.NAVW17.01 #Saurav Dhyani #07-05-2015
    //   # New Page Created To Modify Permission before Creating Role
    //
    // SauravNavRP.NAVW17.01.02 #Saurav Dhyani #10-08-2015
    //   # Code Added to Add Permission on Existing Role

    PageType = List;
    SourceTable = "Permission For Roles";
    ApplicationArea = All;
    Caption = 'Assign Permissions To Role';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Role ID"; Rec."Role ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Role ID field.';
                }
                field("Role Name"; Rec."Role Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Role Name field.';
                }
                field("Object Type"; Rec."Object Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Object Type field.';
                }
                field("Object ID"; Rec."Object ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Object ID field.';
                }
                field("Object Name"; Rec."Object Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Object Name field.';
                }
                field("Read Permission"; Rec."Read Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read Permission field.';
                }
                field("Insert Permission"; Rec."Insert Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insert Permission field.';
                }
                field("Modify Permission"; Rec."Modify Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Modify Permission field.';
                }
                field("Delete Permission"; Rec."Delete Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delete Permission field.';
                }
                field("Execute Permission"; Rec."Execute Permission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Execute Permission field.';
                }
                field("Security Filter"; Rec."Security Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Filter field.';
                }
            }
        }
    }

    actions
    {
        area(Creation)
        {
            action("Save Role")
            {
                ApplicationArea = Basic;
                Image = Save;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Save Role action.';
                trigger OnAction()
                begin
                    PermissionSetCreated := PermissionSet.Get(Rec."Role ID");

                    PermissionInRole.Reset();
                    if PermissionInRole.FindSet() then
                        repeat
                            if not PermissionSetCreated then begin
                                PermissionSet.Init();
                                PermissionSet."Role ID" := PermissionInRole."Role ID";
                                PermissionSet.Name := PermissionInRole."User Role Name";
                                PermissionSet.Insert();
                                PermissionSetCreated := true;
                            end;

                            PermissionInSet.Init();
                            PermissionInSet.TransferFields(PermissionInRole);
                            if PermissionInSet."Object Type" = PermissionInSet."Object Type"::Table then
                                PermissionInSet."Object Type" := PermissionInSet."Object Type"::"Table Data";
                            if not PermissionInSet.Insert() then
                                PermissionInSet.Modify();
                        until (PermissionInRole.Next() = 0);

                    PermissionInRole.DeleteAll();
                end;
            }
        }
    }

    trigger OnClosePage()
    begin
        PermissionInRole.DeleteAll();
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if not PermissionSetCreated then
            if not Confirm('The Role Have Not Been Saved. Do You Want To Continue', false) then
                exit(false);
    end;

    var
        PermissionInRole: Record "Permission For Roles";
        PermissionSetCreated: Boolean;
        PermissionSet: Record "Permission Set";
        PermissionInSet: Record Permission;


    procedure SetRoleName(RName: Text)
    begin
    end;
}
