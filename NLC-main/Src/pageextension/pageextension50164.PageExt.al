#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50164 pageextension50164 extends "User Card"
{


    //Unsupported feature: Property Modification (ExternalDataType) on ""Windows User Name"(Control 7).OnAssistEdit.DSOP(Variable 1000)".

    //var
    //>>>> ORIGINAL VALUE:
    //"Windows User Name" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //"Windows User Name" : 'Microsoft.Dynamics.Nav.Management.DSObjectPickerWrapper, Version=14.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35'.Microsoft.Dynamics.Nav.Management.DSObjectPicker.DSObjectPickerWrapper;
    //Variable type has not been exported.

    var
        UserSetup: Record "User Setup";
}
