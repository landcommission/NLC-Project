/* #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Codeunit 70005311 "Outlook Synch. Finalize5311"
{

    trigger OnRun()
    begin

        //  OBJECT Modification "Outlook Synch. Finalize"(Codeunit 5311)
        //  {
        //    OBJECT-PROPERTIES
        //    {
        //      Date=09162022D;
        //      Time=145519T;
        //      Modified=Yes;
        //      Version List=NAVW18.00;
        //    }
        //    PROPERTIES
        //    {
        //      Target="Outlook Synch. Finalize"(Codeunit 5311);
        //    }
        //    CHANGES
        //    {
        //      { Deletion          ;Target=Finalize(PROCEDURE 1).XmlTextReader(Variable 1002);
        //                           ChangedElements=VariableCollection
        //                           {
        //                             XmlTextReader@1002 : DotNet "'Microsoft.Dynamics.Nav.OLSync.Common, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.NAV.OLSync.Common.XmlTextReader";
        //                           }
        //                            }
        //      { CodeModification  ;OriginalCode=BEGIN
        //                                          XmlTextReader := XmlTextReader.XmlTextReader;
        //
        //                                          IF NOT XmlTextReader.LoadXml(XMLMessage) THEN
        //                                          #4..13
        //
        //                                          UpdateLastSynchronizationTime(UserID,StartSynchTime);
        //                                          XMLMessage := '';
        //                                        END;
        //
        //                           ModifiedCode=BEGIN
        //                                          {{
        //                                          #1..16
        //                                               }}
        //                                        END;
        //
        //                           Target=Finalize(PROCEDURE 1) }
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