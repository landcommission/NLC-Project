/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70005300 "Outlook Synch. Setup Mgt.5300"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Outlook Synch. Setup Mgt."(Codeunit 5300)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09162022D;
        //      Time=144432T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Outlook Synch. Setup Mgt."(Codeunit 5300);
        //    }
        //    CHANGES
        //    {
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..10
        //                                          END;
        //
        //                                          ItemName := ShowLookupNames(TempOSynchLookupName);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..13
        //                                          }}
        //                                        END;
        //
        //                           Target=ShowOItemsList(PROCEDURE 4) }
        //      { Deletion          ;Target=ShowOItemProperties(PROCEDURE 8).PropertyList(Variable 1003);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1003 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..13
        //                                            END;
        //
        //                                          PropertyName := ShowLookupNames(TempOSynchLookupName);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..16
        //                                            }}
        //                                        END;
        //
        //                           Target=ShowOItemProperties(PROCEDURE 8) }
        //      { Deletion          ;Target=ShowOCollectionsList(PROCEDURE 5).PropertyList(Variable 1003);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1003 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..13
        //                                            END;
        //
        //                                          CollectionName := COPYSTR(ShowLookupNames(TempOSynchLookupName),1,250);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..16
        //                                            }}
        //                                        END;
        //
        //                           Target=ShowOCollectionsList(PROCEDURE 5) }
        //      { Deletion          ;Target=ShowOCollectionProperties(PROCEDURE 10).PropertyList(Variable 1005);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1005 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ShowOCollectionProperties(PROCEDURE 10).InnerPropertyList(Variable 1006);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyList@1006 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..17
        //                                              END;
        //
        //                                          PropertyName := ShowLookupNames(TempOSynchLookupName);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..20
        //                                              }}
        //                                        END;
        //
        //                           Target=ShowOCollectionProperties(PROCEDURE 10) }
        //      { Deletion          ;Target=ShowEnumerationsLookup(PROCEDURE 31).PropertyList(Variable 1008);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1008 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ShowEnumerationsLookup(PROCEDURE 31).InnerPropertyList(Variable 1010);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyList@1010 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ShowEnumerationsLookup(PROCEDURE 31).PropertyItem(Variable 1009);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyItem@1009 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyInfo";
        //                           }
        //                            }
        //      { Deletion          ;Target=ShowEnumerationsLookup(PROCEDURE 31).InnerPropertyItem(Variable 1011);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyItem@1011 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyInfo";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..42
        //                                                    END;
        //                                                END;
        //                                              END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..45
        //                                            }}
        //                                        END;
        //
        //                           Target=ShowEnumerationsLookup(PROCEDURE 31) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..15
        //                                          OSynchOptionCorrel.SETRANGE("Element No.",OSynchFieldIn."Element No.");
        //                                          OSynchOptionCorrel.SETRANGE("Field Line No.",OSynchFieldIn."Line No.");
        //                                          PAGE.RUNMODAL(PAGE::"Outlook Synch. Option Correl.",OSynchOptionCorrel);
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..18
        //                                            }}
        //                                        END;
        //
        //                           Target=ShowOOptionCorrelForm(PROCEDURE 13) }
        //      { Deletion          ;Target=ValidateEnumerationValue(PROCEDURE 33).PropertyList(Variable 1011);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1011 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ValidateEnumerationValue(PROCEDURE 33).InnerPropertyList(Variable 1013);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyList@1013 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ValidateEnumerationValue(PROCEDURE 33).PropertyItem(Variable 1012);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyItem@1012 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyInfo";
        //                           }
        //                            }
        //      { Deletion          ;Target=ValidateEnumerationValue(PROCEDURE 33).InnerPropertyItem(Variable 1014);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyItem@1014 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyInfo";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..78
        //                                                END;
        //                                              END;
        //                                            END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..81
        //                                            }}
        //                                        END;
        //
        //                           Target=ValidateEnumerationValue(PROCEDURE 33) }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..16
        //                                            InputString := TempOSynchLookupName.Name;
        //                                            EXIT(TRUE);
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..19
        //                                          }}
        //                                        END;
        //
        //                           Target=ValidateOutlookItemName(PROCEDURE 25) }
        //      { Deletion          ;Target=ValidateOutlookCollectionName(PROCEDURE 18).PropertyList(Variable 1003);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1003 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..19
        //                                            InputString := TempOSynchLookupName.Name;
        //                                            EXIT(TRUE);
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..22
        //                                            }}
        //                                        END;
        //
        //                           Target=ValidateOutlookCollectionName(PROCEDURE 18) }
        //      { Deletion          ;Target=ValidateOItemPropertyName(PROCEDURE 11).PropertyList(Variable 1007);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1007 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ValidateOItemPropertyName(PROCEDURE 11).PropertyItem(Variable 1006);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyItem@1006 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyInfo";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF ISNULL(OObjLibrary) THEN
        //                                            IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                              ERROR(Text014);
        //                                          #4..25
        //                                            IsReadOnly := PropertyItem.IsReadOnly;
        //                                            EXIT(TRUE);
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..28
        //                                            }}
        //                                        END;
        //
        //                           Target=ValidateOItemPropertyName(PROCEDURE 11) }
        //      { Deletion          ;Target=ValidateOCollectPropertyName(PROCEDURE 26).PropertyList(Variable 1008);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1008 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=ValidateOCollectPropertyName(PROCEDURE 26).InnerPropertyList(Variable 1009);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyList@1009 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          CLEAR(OObjLibrary);
        //                                          IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                            ERROR(Text014);
        //                                          #4..37
        //                                                    END;
        //                                                  END;
        //                                                END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..40
        //                                            }}
        //                                        END;
        //
        //                           Target=ValidateOCollectPropertyName(PROCEDURE 26) }
        //      { Deletion          ;Target=CheckOEnumeration(PROCEDURE 32).PropertyList(Variable 1007);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             PropertyList@1007 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { Deletion          ;Target=CheckOEnumeration(PROCEDURE 32).InnerPropertyList(Variable 1008);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             InnerPropertyList@1008 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookPropertyList";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          IF ISNULL(OObjLibrary) THEN
        //                                            IF NOT CANLOADTYPE(OObjLibrary) THEN
        //                                              ERROR(Text014);
        //                                          #4..26
        //                                                END;
        //                                              END;
        //                                          END;
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..29
        //                                           }}
        //                                        END;
        //
        //                           Target=CheckOEnumeration(PROCEDURE 32) }
        //      { Deletion          ;Target=OObjLibrary(Variable 1005);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             OObjLibrary@1005 : DotNet "'Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.OLSyncSupplier.OutlookObjectLibrary";
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