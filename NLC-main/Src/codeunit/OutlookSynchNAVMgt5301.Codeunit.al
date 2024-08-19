/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70005301 "Outlook Synch. NAV Mgt5301"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Outlook Synch. NAV Mgt"(Codeunit 5301)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09162022D;
        //      Time=144655T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Outlook Synch. NAV Mgt"(Codeunit 5301);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF NOT (STRLEN(XMLMessage) > 0) THEN
        //                                            ERROR(Text001);
        //
        //                                          #4..33
        //                                            IF STRLEN(XMLMessage) = 0 THEN
        //                                              ERROR(Text001);
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..36
        //                                          }}
        //                                        END;
        //
        //                           Target=StartSynchronization(PROCEDURE 25) }
        //      { Deletion          ;Target=CollectConflictedEntities(PROCEDURE 11).XmlTextReader(Variable 1000);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             XmlTextReader@1000 : DotNet "'Microsoft.Dynamics.Nav.OLSync.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.Common.XmlTextReader";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          XmlTextReader := XmlTextReader.XmlTextReader;
        //
        //                                          IF NOT XmlTextReader.LoadXml(XMLMessage) THEN
        //                                          #4..96
        //                                            IF STRLEN(XMLMessage) = 0 THEN
        //                                              ERROR(Text001);
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..99
        //                                          }}
        //                                        END;
        //
        //                           Target=CollectConflictedEntities(PROCEDURE 11) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF NOT TempDeletedChangeLogEntry.FIND('-') THEN
        //                                            EXIT;
        //
        //                                          #4..33
        //                                                  ERROR(Text005,GlobalRecordIDBuffer."User ID",OSynchEntity.Code);
        //                                            END;
        //                                          UNTIL TempDeletedChangeLogEntry.NEXT = 0;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..36
        //                                          }}
        //                                        END;
        //
        //                           Target=ProcessDeletedEntityRecords(PROCEDURE 6) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          EVALUATE(RecID,FORMAT(EntityRecRef.RECORDID));
        //                                          LastModificationTime := OSynchOutlookMgt.GetLastModificationTime(RecID);
        //
        //                                          #4..22
        //                                            InsertCollections(EntityRecRef,SynchEntityCode);
        //
        //                                          XMLWriter.WriteEndElement;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..25
        //                                            }}
        //                                        END;
        //
        //                           Target=InsertEntity(PROCEDURE 50) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          OSynchSetupDetail.RESET;
        //                                          OSynchSetupDetail.SETRANGE("User ID",OSynchUserSetup."User ID");
        //                                          OSynchSetupDetail.SETRANGE("Synch. Entity Code",SynchEntityCode);
        //                                          #4..51
        //                                              XMLWriter.WriteEndElement;
        //                                              MasterRecRef.CLOSE;
        //                                            UNTIL OSynchSetupDetail.NEXT = 0;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..54
        //                                            }}
        //                                        END;
        //
        //                           Target=InsertCollections(PROCEDURE 51) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          REPEAT
        //                                            IF NOT SearchFields THEN BEGIN
        //                                              TempOSynchField.RESET;
        //                                          #4..159
        //                                                RelatedRecRef.CLOSE;
        //                                              END;
        //                                            UNTIL TempOSynchField.NEXT = 0;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..162
        //                                           }}
        //                                        END;
        //
        //                           Target=InsertFields(PROCEDURE 9) }
        //      { Deletion          ;Target=WriteLinkedOutlookEntryID(PROCEDURE 35).XMLTextWriter(Parameter 1002);
        //                           ChangedElements=ParameterCollection
        //                           {
        //                             { 1002;XMLTextWriter            ;DotNet       ;AsVar=Yes;
        //                                                                            ExternalDataType='Microsoft.Dynamics.Nav.OLSync.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.Common.XmlTextWriter }
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF NOT OSynchLink.GET(UserID,RecID) THEN
        //                                            EXIT;
        //
        //                                          #4..7
        //                                          XMLTextWriter.WriteStartElement('EntryID');
        //                                          XMLTextWriter.WriteElementTextContent(OSynchOutlookMgt.ConvertValueToBase64(EntryIDContainer));
        //                                          XMLTextWriter.WriteEndElement;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..10
        //                                            }}
        //                                        END;
        //
        //                           Target=WriteLinkedOutlookEntryID(PROCEDURE 35) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF UserID = '' THEN
        //                                            EXIT(FALSE);
        //
        //                                          OutlookSynchUserSetup.SETRANGE("User ID",UserID);
        //                                          EXIT(NOT OutlookSynchUserSetup.ISEMPTY);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..5
        //                                            }}
        //                                        END;
        //
        //                           Target=IsOSyncUser(PROCEDURE 7) }
        //      { Deletion          ;Target=XMLWriter(Variable 1000);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             XMLWriter@1000 : DotNet "'Microsoft.Dynamics.Nav.OLSync.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.Common.XmlTextWriter";
        //                           }
        //                            }
        //    }
        //    CODE
        //    {
        //
        //      BEGIN
        //      END.
        //    }
        //  }
        //
        //

    end;
}
 */