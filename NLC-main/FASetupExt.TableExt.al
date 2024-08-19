#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 70014 "tableextension61100" extends "FA Setup"
{
    fields
    {
        field(50000; "Motor Vehicle Maintenance Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(39005475; "Asset Transfer Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(39005476; "Maintenance Plan Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(39005477; "Maintenance Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(39005478; "Asset Incident Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(39005479; "Repair Request Nos."; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(6000; "Asset Issue"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6001; "Asset Return Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6002; "Asset Allocation Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(6003; "Asset Incidence Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

        field(39003900; "Asset Clearance"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(39003901; "Asset Journal"; Code[20])
        {
            TableRelation = "No. Series";
        }


    }
}
