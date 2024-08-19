// tableextension 50001 "Company Info" extends "Company Information"
// {
//     // fields
//     {

//         //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 7)".


//         //Unsupported feature: Property Modification (Data type) on ""Phone No. 2"(Field 8)".

//         field(50000; "Tel Phone"; Code[30])
//         {
//         }
//         field(50001; Hotline; Code[30])
//         {
//         }
//         field(50002; "Country/Region Name"; Text[50])
//         {
//         }
//         field(49000; "N.S.SF. No."; Code[20])
//         {
//         }
//         field(59001; "N.H.I.F No."; Code[20])
//         {
//         }
//         field(59003; RubberStamp; Blob)
//         {
//             Caption = 'Picture';
//             SubType = Bitmap;
//         }
//         field(59008; "Pin No"; Text[30])
//         {
//         }
//         field(70000; "Procurement Support E-mail"; Text[80])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(70001; "Administrator Email"; Text[80])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(80000; Vision; Text[255])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//         }
//         field(80001; Mission; Text[255])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//         }
//         field(80002; Motto; Text[255])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//         }
//         field(80003; "Headed By"; Text[255])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//             //TableRelation = "Company Positions"."Position ID";
//         }
//         field(80004; "Current Head"; Text[255])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//             TableRelation = Employee;
//         }
//         field(80005; "HR Document Link"; Text[255])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(80006; "Current Head Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//         }
//         field(80007; "Position Name"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//             Description = 'SPM';
//         }
//         field(80008; "Legal Head Email"; Text[100])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(80009; "Company Watermark"; Blob)
//         {
//             SubType = Bitmap;

//         }

//     }

// }
