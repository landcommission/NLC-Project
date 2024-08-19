#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
query 50000 "Country_Region"
{
    Caption = 'Country_Region';
    elements
    {
        dataitem(Country_Region; "Country/Region")
        {
            column("Code"; "Code") { }
            column(Name; Name) { }
        }
    }
}
