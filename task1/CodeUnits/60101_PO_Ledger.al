codeunit 60101 "Purchase Order Ledger Ext"
{
    EventSubscriberInstance = StaticAutomatic;

    trigger OnRun()
    begin

    end;//item Jer

    [EventSubscriber(ObjectType::Table, database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromPurchHeader', '', true, true)]
    local procedure OnAfterCopyGenJnlLineFromPurchHeader(PurchaseHeader: Record "Purchase Header"; var GenJournalLine: Record "Gen. Journal Line")
    // var
    //     purchaseLine: Record "Purchase Line";

    begin
        GenJournalLine."LC No." := PurchaseHeader."LC No.";
        GenJournalLine.Remarks := PurchaseHeader.Remarks;
        GenJournalLine."LC Date" := PurchaseHeader."LC Date";
        //GenJournalLine."Total Weight" := purchaseLine."Total Weight";
        //GenJournalLine."Total Hight" := purchaseLine."Total Hight";
    end;
    //Try to find Purch Line
    // [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'onaftercopyfrompurch', 'ElementName', SkipOnMissingLicense, SkipOnMissingPermission)]
    // local procedure MyProcedure()
    // begin

    // end;

    //Gen Jnl >>> GLEntry
    [EventSubscriber(ObjectType::Table, database::"G/L Entry", 'OnAfterCopyGLEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyGLEntryFromGenJnlLine(var GLEntry: Record "G/L Entry";var GenJournalLine: Record "Gen. Journal Line")
    begin
        GLEntry."LC No." := GenJournalLine."LC No.";
        GLEntry.Remarks := GenJournalLine.Remarks;
        GLEntry."LC Date" := GenJournalLine."LC Date";
        GLEntry."Total Weight" := GenJournalLine."Total Weight";
        GLEntry."Total Hight" := GenJournalLine."Total Hight";
    end;

    //Gen Jnl >>> VenderLedger
    [EventSubscriber(ObjectType::Table, database::"Vendor Ledger Entry", 'OnAfterCopyVendLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure OnAfterCopyVendLedgerEntryFromGenJnlLine(var VendorLedgerEntry: Record "Vendor Ledger Entry"; GenJournalLine: Record "Gen. Journal Line")
    begin
        VendorLedgerEntry."LC No." := GenJournalLine."LC No.";
        VendorLedgerEntry.Remarks := GenJournalLine.Remarks;
        VendorLedgerEntry."LC Date" := GenJournalLine."LC Date";
        VendorLedgerEntry."Total Weight" := GenJournalLine."Total Weight";
        VendorLedgerEntry."Total Hight" := GenJournalLine."Total Hight";
    end;

    //PurchHead >>> ItemJnl
    // [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchHeader', '', true, true)]
    // local procedure OnAfterCopyItemJnlLineFromPurchHeader(PurchHeader: Record "Purchase Header"; var ItemJnlLine: Record "Item Journal Line")
    // begin
    //     ItemJnlLine."LC No." := PurchHeader."LC No.";
    //     ItemJnlLine.Remarks := PurchHeader.Remarks;
    //     ItemJnlLine."LC Date" := PurchHeader."LC Date";

    // end;

    //PurchLine >>> ItemJnl
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromPurchLine', '', true, true)]
    local procedure OnAfterCopyItemJnlLineFromPurchLine(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."Total Weight" := PurchLine."Total Weight";
        ItemJnlLine."Total Hight" := PurchLine."Total Hight";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure OnAfterCopyTrackingFromItemJnlLine(var NewItemLedgEntry: Record "Item Ledger Entry"; var ItemJournalLine: Record "Item Journal Line"; var ItemLedgEntryNo: Integer)
    begin
        NewItemLedgEntry."Total Weight" := ItemJournalLine."Total Weight";
        NewItemLedgEntry."Total Hight" := ItemJournalLine."Total Hight";
    end;




}