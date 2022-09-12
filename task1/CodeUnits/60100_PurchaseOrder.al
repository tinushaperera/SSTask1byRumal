codeunit 60100 "Create Purchase Order FPR"
{
    trigger OnRun()
    begin

    end;


    procedure CreatePurchaseOrder(PurchReqHead: Record "Purchase Request Header") //Pss PR
    var
        purchaseHead: Record "Purchase Header"; //PO Header
        purchaseLine: Record "Purchase Line"; // PO Header
        purchReqLine: Record "Purchase Request Line"; //PR Line
        inx: Integer;

    begin
        purchaseHead.Init();
        purchaseHead."Document Type" := purchaseHead."Document Type"::Order;
        purchaseHead."No." := PurchReqHead."No.";
        purchaseHead.Validate("Buy-from Vendor No.", PurchReqHead."Vendor No.");
        // PurchReqHead.Validate("Document Date", PurchReqHead."Document Date");
        //PurchReqHead.Validate(Status, PurchReqHead.Status);

        purchaseHead.Insert();
        Message('Purchase Order %1 has been Created,Head Only;))_', purchaseHead."No.");

        purchaseLine.Reset();
        purchReqLine.SetRange("Document No.", PurchReqHead."No.");
        if purchReqLine.FindFirst() then
            repeat
                //inx += 10000;
                purchaseLine.Init();
                purchaseLine."Document Type" := purchaseLine."Document Type"::Order;
                purchaseLine."Document No." := PurchReqHead."No.";
                purchaseLine."Line No." := purchReqLine."Line No.";/* inx;*/

                if purchReqLine.Type = purchReqLine.Type::Item then
                    purchaseLine.Validate(Type, purchaseLine.Type::Item)

                else
                    if purchReqLine.Type = purchReqLine.Type::"GL Account" then
                        purchaseLine.Validate(Type, purchaseLine.Type::"G/L Account");


                // purchaseLine.Type := purchReqLine.Type;


                // purchaseLine.Validate(Type, purchReqLine.Type);
                purchaseLine.Validate("No.", purchReqLine."No.");
                purchaseLine.Validate(Quantity, purchReqLine.Quantity);
                purchaseLine.Validate("Direct Unit Cost", purchReqLine."Unit Price");
                //purchaseLine.Validate("Line Amount", purchReqLine.Amount);
                // purchaseLine.Quantity := purchReqLine.Quantity;
                // purchaseLine."Direct Unit Cost" := purchReqLine."Unit Price";
                // purchaseLine."Line Amount" := purchReqLine.Amount;

                purchaseLine.Insert();


            until purchReqLine.Next() = 0;

        Message('Purchase Order %1 has been Created With Line :))))_', purchaseHead."No.");

    end;

    var
        myInt: Integer;
}