table 60101 "Purchase Request Line"
{
    Caption = 'Purchase Request Line';
    DataClassification = ToBeClassified;



    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;

            // trigger OnValidate()
            // var
            // //lnNo: Integer;
            // begin
            //     // lnNo := 1;

            //     if "Line No." = ' ' then
            //         "Line No." := 1
            //     else
            //         LstLineNoRec.Get("Line No.");
            //     "Line No." := "Line No." + 1;
            // end;


        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;


            //AutoIncrement = true;   
        }
        field(3; "Type"; Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Item","GL Account";
            OptionCaption = ' ,Item,GL Account';
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = if (Type = const(Item)) Item else
            if (Type = const("GL Account")) "G/L Account";

            trigger OnValidate()
            var
                item: Record Item;
                GLRec: Record "G/L Account";
            begin
                if Type = Type::Item then begin
                    item.Get("No.");
                    Description := item.Description;
                end;
                if Type = Type::"GL Account" then begin
                    GLRec.get("No.");
                    Description := GLRec.Name;
                end;
            end;

            // trigger OnValidate()
            // var
            //     // myInt: Integer;
            //     purchLineRec: Record "Purchase Request Line";
            //     itemRec: Record Item;
            //     glAcc: Record "G/L Account";
            // begin
            //     purchLineRec.Get("No.");
            //     // if(purchLineRec.Type = 'Item') then 
            //     //Description := itemRec.Description;
            //     //Description := glAcc.;



            // end;

            // trigger OnValidate()
            // var
            //     purchLineRec : Record "Purchase Request Line";
            //     itemRec : Record Item;
            //     glAcc : Record "G/L Account";
            // begin
            //     purchLineRec.Get("No.");
            //     purchLineRec.Get(SystemModifiedBy);
            //     Description = if (Type = const(itemRec))

            // end;


        }
        field(5; "Description"; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
            Editable = false;


        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                Amount := Quantity * "Unit Price";
            end;
        }
        field(7; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                Amount := Quantity * "Unit Price";
            end;



        }
        field(8; Amount; Decimal)
        {
            Caption = 'Amount ';
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                PurchLineRec: Record "Purchase Request Line";
                PurchHeadRec: Record "Purchase Request Header";
                tempTot: Decimal;

            begin
                // PurchHeadRec.Reset();
                // PurchHeadRec.SetRange("No.");

                PurchLineRec.Reset();
                PurchLineRec.SetRange("Line No.", "Line No.");
                if PurchLineRec.FindFirst() then begin
                    PurchLineRec.CalcSums(Amount);
                    tempTot := PurchLineRec.Amount;
                    Message('Total tempTot %1 = ', tempTot);
                end;

                "Total Amount" := tempTot;


                Message('Total tempTot %1 = ', tempTot);
            end;



        }
        field(9; "Total Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            //  "Total Amount" = sum(Amount);
            // trigger OnValidate()
            // var

            // begin
            //     "Total Amount" = sum(Amount);
            // end;

            // FieldClass = FlowField;
            // CalcFormula = sum("Purchase Request Line".Amount);

            // trigger OnValidate()
            // var
            //     PurchLineRec: Record "Purchase Request Line";
            //     PurchHeadRec: Record "Purchase Request Header";
            //     tempTot: Decimal;

            // begin
            //     // PurchHeadRec.Reset();
            //     // PurchHeadRec.SetRange("No.","Document No.");

            //     PurchLineRec.Reset();
            //     PurchLineRec.SetRange("Line No.", "Line No.");
            //     if PurchLineRec.FindFirst() then begin
            //         PurchLineRec.CalcSums(Amount);
            //         tempTot := PurchLineRec.Amount;
            //         Message('Total tempTot %1 = ', tempTot);
            //     end;


            //     // Message('Total tempTot %1 = ', tempTot);
            // end;


        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    var
        LstLineNoRec: Record "Purchase Request Line";

}

