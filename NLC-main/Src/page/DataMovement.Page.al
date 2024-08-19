/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 70000 "Data Movement"
{
    // GetTableID(TableName : Text[250]) TableID : Integer
    // Object.SETRANGE(Typ,Object.Typ::Table);
    // Object.SETRANGE(Mandantenname,COMPANYNAME);
    // Object.SETRANGE(Name,TableName);
    // IF Object.FIND('-') THEN
    // EXIT(Object.ID)
    // ELSE BEGIN
    // Object.SETRANGE(Mandantenname);
    // IF Object.FIND('-') THEN
    // EXIT(Object.ID)
    // ELSE
    // EXIT(0);
    // END;

    PageType = List;
    PromotedActionCategories = 'New,Process,Reports,Functions';
    SourceTable = "Data Movement Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Old Name";Rec."Old Name")
                {
                    ApplicationArea = Basic;
                }
                field("New No";Rec."New No")
                {
                    ApplicationArea = Basic;
                }
                field("New Name";Rec."New Name")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Existing Records";Rec."Existing Records")
                {
                    ApplicationArea = Basic;
                }
                field("Moved Records";Rec."Moved Records")
                {
                    ApplicationArea = Basic;
                }
                field("Data Count";Rec."Data Count")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Transfer Data from Old Tables")
            {
                ApplicationArea = Basic;
                Caption = 'Transfer Data from Old Tables';
                Image = DataEntry;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    DataMovement: Record "Data Movement Table";
                    Window: Dialog;
                    TotalTables: Integer;
                    TablesProcessed: Integer;
                begin
                    if not Confirm('Transfer Data', false) then exit;

                    DataMovement.Reset();
                    if DataMovement.FindSet then DataMovement.ModifyAll(DataMovement.Status,DataMovement.Status::Pending);

                    DataMovement.Reset();
                    if DataMovement.FindSet() then
                    begin

                        Window.Open(
                                     'Source Table        :       #1######################## ' +
                                     '\Target Table       :       #2######################## ' +
                                     '\Company Name       :       #3######################## ' +
                                     '\Total Tables       :       #4######################## ' +
                                     '\Tables Processed   :       #5########################'
                                   );

                        TotalTables:=DataMovement.Count();

                        Window.Update(4, Format(TotalTables));

                        repeat
                            TablesProcessed:=TotalTables - 1;

                            Window.Update(1, Format(DataMovement.No) + ' - ' + DataMovement."Old Name");
                            Window.Update(2, Format(DataMovement."New No")+ ' - ' + DataMovement."New Name");
                            Window.Update(3, COMPANYNAME);
                            Window.Update(5, TablesProcessed);

                            fn_TransferData(DataMovement.No,DataMovement."New No");

                            DataMovement.Status:=DataMovement.Status::Complete;
                            DataMovement.Modify;
                        until DataMovement.Next() = 0;
                        Window.Close;
                        Message('Transfer Complete');
                    end else
                    begin
                       Error('Records dont exist in data movement table');
                    end;
                end;
            }
            action("Update Profiles, App Entry, App Templates and Additional Approvers")
            {
                ApplicationArea = Basic;
                Caption = 'emplates and Additional Approvers';
                Image = PaymentPeriod;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    "Profile": Record "Profile";
                    // ObjectRenumberingTool: Record "Object Renumbering Tool";
                    ApprovalEntry: Record "Approval Entry";
                    ApprovalCommentLine: Record "Approval Comment Line";
                begin

                    //Update Profiles
                    ObjectRenumberingTool.Reset();
                    // ObjectRenumberingTool.SetRange("Source Type",ObjectRenumberingTool."source type"::Page);
                    // ObjectRenumberingTool.SetRange("Source ID",39003900,62018767);
                    if ObjectRenumberingTool.FindSet(false,false) then
                    begin
                        repeat
                            Profile.Reset();
                            Profile.SetRange("Role Center ID",ObjectRenumberingTool."Source ID");
                            if Profile.FindSet() then
                            begin
                                repeat
                                    Profile."Role Center ID":=ObjectRenumberingTool."Destination ID";
                                    Profile.Modify();
                                until Profile.Next() = 0;
                            end;
                        until ObjectRenumberingTool.Next() = 0;
                    end else
                    begin
                        Error('No data exist in object renumber tool');
                    end;

                    //Update Approval Entry
                    ObjectRenumberingTool.Reset();
                    // ObjectRenumberingTool.SetRange("Source Type",ObjectRenumberingTool."source type"::Table);
                    // ObjectRenumberingTool.SetRange("Source ID",39003900,62018767);
                    if ObjectRenumberingTool.FindSet(false,false) then
                    begin
                        repeat
                            //Approval Entry
                            ApprovalEntry.Reset();
                            ApprovalEntry.SetRange(ApprovalEntry."Table ID",ObjectRenumberingTool."Source ID");
                            if ApprovalEntry.FindSet() then
                            begin
                                repeat
                                    ApprovalEntry."Table ID":=ObjectRenumberingTool."Destination ID";
                                    ApprovalEntry.Modify();
                                until ApprovalEntry.Next() = 0;
                            end;

                            //Approval Comment Line
                            ApprovalCommentLine.Reset();
                            ApprovalCommentLine.SetRange("Table ID",ObjectRenumberingTool."Source ID");
                            if ApprovalCommentLine.FindSet() then
                            begin
                                repeat
                                    ApprovalCommentLine."Table ID":=ObjectRenumberingTool."Destination ID";
                                    ApprovalCommentLine.Modify();
                                until ApprovalCommentLine.Next() = 0;
                            end;

                            //Approval Templates
                            ApprovalTemplates.Reset();
                            ApprovalTemplates.SetRange("Table ID",ObjectRenumberingTool."Source ID");
                            if ApprovalTemplates.FindSet() then
                            begin
                                repeat
                                    ApprovalTemplates."Table ID":=ObjectRenumberingTool."Destination ID";
                                    ApprovalTemplates.Modify();
                                until ApprovalTemplates.Next() = 0;
                            end;



                        until ObjectRenumberingTool.Next() = 0;

                        Message('Profiles updated with new Page IDs, Approval Entry and Approval Comment Line updated with new Table IDs');

                    end else
                    begin
                        Error('No data exist in object renumber tool');
                    end;
                end;
            }
            action("Update Web Services")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //PAGE
                    ObjectRenumberingTool.Reset();
                    ObjectRenumberingTool.SetRange("Source Type",ObjectRenumberingTool."source type"::Page);
                    ObjectRenumberingTool.SetRange("Source ID",39003900,62018767);
                    if ObjectRenumberingTool.FindSet(false,false) then
                    begin
                      repeat
                          WebService.Reset;
                          WebService.SetRange(WebService."Object Type",WebService."object type"::Page);
                          WebService.SetRange(WebService."Object ID",ObjectRenumberingTool."Source ID");
                          if WebService.FindFirst then
                          begin
                              WebService."Object ID":=ObjectRenumberingTool."Destination ID";
                              WebService.Validate(WebService."Object ID");
                              WebService.Modify;
                          end;
                      until ObjectRenumberingTool.Next = 0;
                    end;

                    //CU
                    ObjectRenumberingTool.Reset();
                    ObjectRenumberingTool.SetRange("Source Type",ObjectRenumberingTool."source type"::Codeunit);
                    ObjectRenumberingTool.SetRange("Source ID",39003900,62018767);
                    if ObjectRenumberingTool.FindSet(false,false) then
                    begin
                      repeat
                          WebService.Reset;
                          WebService.SetRange(WebService."Object Type",WebService."object type"::Codeunit);
                          WebService.SetRange(WebService."Object ID",ObjectRenumberingTool."Source ID");
                          if WebService.FindFirst then
                          begin
                              WebService."Object ID":=ObjectRenumberingTool."Destination ID";
                              WebService.Validate(WebService."Object ID");
                              WebService.Modify;
                          end;
                      until ObjectRenumberingTool.Next = 0;
                    end;

                    //Query
                    ObjectRenumberingTool.Reset();
                    ObjectRenumberingTool.SetRange("Source Type",ObjectRenumberingTool."source type"::Query);
                    ObjectRenumberingTool.SetRange("Source ID",39003900,62018767);
                    if ObjectRenumberingTool.FindSet(false,false) then
                    begin
                      repeat
                          WebService.Reset;
                          WebService.SetRange(WebService."Object Type",WebService."object type"::Query);
                          WebService.SetRange(WebService."Object ID",ObjectRenumberingTool."Source ID");
                          if WebService.FindFirst then
                          begin
                              WebService."Object ID":=ObjectRenumberingTool."Destination ID";
                              WebService.Validate(WebService."Object ID");
                              WebService.Modify;
                          end;
                      until ObjectRenumberingTool.Next = 0;
                    end;


                    Message('Done');
                end;
            }
            action("Update Approval Entry")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    //Update Approval Entry
                    ObjectRenumberingTool.Reset();
                    ObjectRenumberingTool.SetRange("Source Type",ObjectRenumberingTool."source type"::Table);
                    ObjectRenumberingTool.SetRange("Source ID",39003900,62018767);
                    if ObjectRenumberingTool.FindSet(false,false) then
                    begin
                        repeat
                            ApprovalEntry.Reset;
                            ApprovalEntry.SetRange(ApprovalEntry."Table ID",ObjectRenumberingTool."Source ID");
                            ApprovalEntry.SetRange(ApprovalEntry.Status,ApprovalEntry.Status::Open);
                            //ApprovalEntry.SETRANGE(ApprovalEntry."Entry No",42843);
                            if ApprovalEntry.FindSet(true,true) then
                            begin
                                repeat
                                   ApprovalEntry.Rename(ObjectRenumberingTool."Destination ID",ApprovalEntry."Document Type"
                                                       ,ApprovalEntry."Document No.",ApprovalEntry."Sequence No.");

                               //   ApprovalEntry."table id":=ObjectRenumberingTool."Destination ID";
                              ///   ApprovalEntry.modify;
                                until ApprovalEntry.Next = 0;
                            end;
                        until     ObjectRenumberingTool.Next = 0;
                    end;
                    //what do we do you can't change approval entries

                    Message('Done4');
                end;
            }
        }
    }

    var
        Company: Record Company;
        ObjectRenumberingSetup: Record "Object Renumbering Setup";
        Text0002: label 'Transferring Data \Table: #1#######';
        ApprovalEntry: Record "Approval Entry";
        ObjectRenumberingTool: Record "Object Renumbering Tool";
        ApprovalCommentLine: Record "Approval Comment Line";
        ApprovalTemplates: Record "Approval Templates";
        WebService: Record "Web Service";
        Result: Boolean;


    procedure fn_TransferData(SourceTableID: Integer;TargetTableID: Integer)
    var
        SourceRef: RecordRef;
        TargetRef: RecordRef;
        FldRef: FieldRef;
        FieldsSource: Record "Field";
        FieldsTarget: Record "Field";
        FieldsNoToTransfer: Record "Integer" temporary;
    begin
        FieldsSource.SetRange(TableNo,SourceTableID);
        FieldsSource.SetRange(Class,FieldsSource.Class::Normal);
        FieldsSource.SetRange(Enabled,true);
        if FieldsSource.FindSet then
          repeat
            if FieldsTarget.Get(TargetTableID,FieldsSource."No.") then // does the field exists in target table
              if (FieldsTarget.Class = FieldsSource.Class) and
                 (FieldsTarget.Type = FieldsSource.Type) then begin    // do I want to transfer the field. Add more test if needed..
                FieldsNoToTransfer.Number := FieldsSource."No.";       // if so fill the field number into the fieldlist table
                FieldsNoToTransfer.Insert;
              end;
          until FieldsSource.Next = 0;
        if FieldsNoToTransfer.IsEmpty then
          exit;   // No fields to the transferred

        SourceRef.Open(SourceTableID);
        TargetRef.Open(TargetTableID);
        if SourceRef.FindSet then
          repeat
            FieldsNoToTransfer.FindSet;
            repeat     // Assign all fields
              FldRef := TargetRef.Field(FieldsNoToTransfer.Number);
              FldRef.Value := SourceRef.Field(FieldsNoToTransfer.Number).Value;
            until FieldsNoToTransfer.Next = 0;
            if TargetRef.Insert then ;
            //TargetRef.INSERT;                 // Insert then record
          until SourceRef.Next = 0;
    end;
}
 */