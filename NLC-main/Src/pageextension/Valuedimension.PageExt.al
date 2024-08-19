pageextension 50004 "Value dimension" extends "Dimension Value List"
{
    layout
    {
        addafter(Name)
        {
            field("Dimension Code"; "Dimension Code")
            {
                ApplicationArea = all;
            }
            field("Hardship Area"; "Hardship Area")
            {
                ApplicationArea = Basic;
                Editable = true;
                ToolTip = 'Specifies the value of the area conditions field.';
            }
        }
    }
}
