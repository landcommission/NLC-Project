pageextension 50001 "My Settings Ext" extends "My Settings"
{
    trigger OnOpenPage()
    begin
        Codeunit.Run(Codeunit::"Super Controller");
    end;
}
