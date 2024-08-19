#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
pageextension 50122 pageextension50122 extends "G/L Budget Names"
{
    var
        BatchName: Record "G/L Budget Name";
        GenJnlBatch: Record "G/L Budget Name";
        JournalPosted: Codeunit "Journal Post Successful";
        Text002: Label 'Budget %1 Approvals exists.';
}
