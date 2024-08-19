#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
report 60000 "Generate Role Data"
{
    // SauravNavRP.NAVW17.01 #Saurav Dhyani #07-05-2015
    //   # New Report Created For Generating Role and Permissions Withing Role
    //
    // SauravNavRP.NAVW17.01.02 #Saurav Dhyani #10-08-2015
    //   # Code Added to Add Permission on Existing Role

    Caption = 'Generate Role Data';
    Description = 'SauravNav.00.01';
    ProcessingOnly = true;
    ApplicationArea = All;

    dataset
    {
        dataitem("Code Coverage"; "Code Coverage")
        {
            DataItemTableView = sorting("Object Type", "Object ID", "Line No.") order(ascending);
            column(ReportForNavId_1; 1) { }

            trigger OnAfterGetRecord()
            begin
                TempPermissionSetForRole.Reset();
                TempPermissionSetForRole.SetRange("Object Type", "Code Coverage"."Object Type");
                TempPermissionSetForRole.SetRange("Object ID", "Code Coverage"."Object ID");
                if not TempPermissionSetForRole.FindSet() then begin
                    PermissionForRole2.Reset();
                    PermissionForRole2.SetCurrentKey("Object Type", "Object ID");
                    PermissionForRole2.SetRange("Object Type", "Code Coverage"."Object Type");
                    PermissionForRole2.SetRange("Object ID", "Code Coverage"."Object ID");
                    if not PermissionForRole2.FindSet() then begin
                        InsertPermissionForRole.Init();
                        InsertPermissionForRole."Role ID" := AddToRole;
                        InsertPermissionForRole."User Role Name" := RoleName;
                        InsertPermissionForRole."Object Type" := "Code Coverage"."Object Type";
                        InsertPermissionForRole."Object ID" := "Code Coverage"."Object ID";

                        if (InsertPermissionForRole."Object Type" = InsertPermissionForRole."Object Type"::Table) then begin    // TABLE WILL HAVE BY DEFAULT READ/INSERT/MODIFY Permission
                            InsertPermissionForRole."Read Permission" := InsertPermissionForRole."Read Permission"::Yes;
                            InsertPermissionForRole."Insert Permission" := InsertPermissionForRole."Insert Permission"::Yes;
                            InsertPermissionForRole."Modify Permission" := InsertPermissionForRole."Modify Permission"::Yes;
                            InsertPermissionForRole."Delete Permission" := InsertPermissionForRole."Delete Permission"::" ";
                            InsertPermissionForRole."Execute Permission" := InsertPermissionForRole."Execute Permission"::" ";
                        end else begin                                                 // EXECUTE PERMISSION FOR OTHER OBJECT TYPES
                            InsertPermissionForRole."Read Permission" := InsertPermissionForRole."Read Permission"::" ";
                            InsertPermissionForRole."Insert Permission" := InsertPermissionForRole."Insert Permission"::" ";
                            InsertPermissionForRole."Modify Permission" := InsertPermissionForRole."Modify Permission"::" ";
                            InsertPermissionForRole."Delete Permission" := InsertPermissionForRole."Delete Permission"::" ";
                            InsertPermissionForRole."Execute Permission" := InsertPermissionForRole."Execute Permission"::Yes;
                        end;
                        InsertPermissionForRole.Insert();
                    end;
                end;
            end;

            trigger OnPreDataItem()
            begin
                if AddToRole = '' then
                    Error(Error001);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field("New Role Code"; AddToRole)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the AddToRole field.';
                    }
                    field("New Role Name"; RoleName)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the RoleName field.';
                    }
                }
            }
        }

        actions { }
    }

    labels { }

    trigger OnPreReport()
    begin
        TempPermissionSetForRole.DeleteAll();

        Permission.Reset();
        Permission.SetRange("Role ID", AddToRole);
        if Permission.FindSet() then
            repeat
                TempPermissionSetForRole.Init();
                TempPermissionSetForRole.TransferFields(Permission);
                TempPermissionSetForRole.Insert();
            until (Permission.Next() = 0);

        PermissionForRole.Reset();
        if PermissionForRole.FindSet() then
            repeat
                Permission.Reset();
                Permission.SetRange("Role ID", PermissionForRole."Role ID");
                if Permission.FindSet() then
                    repeat
                        TempPermissionSetForRole.Init();
                        TempPermissionSetForRole.TransferFields(Permission);
                        if not TempPermissionSetForRole.Insert() then
                            TempPermissionSetForRole.Modify();
                    until (Permission.Next() = 0);
            until (PermissionForRole.Next() = 0);
    end;

    var
        TempPermissionSetForRole: Record Permission temporary;
        PermissionForRole: Record "Permission For Roles";
        Permission: Record Permission;
        AddToRole: Code[20];
        PermissionForRole2: Record "Permission For Roles";
        InsertPermissionForRole: Record "Permission For Roles";
        RoleName: Text[30];
        PermissionSetForRole: Record "Permission Set For Roles";
        Error001: Label 'Role Name Required.';
}
