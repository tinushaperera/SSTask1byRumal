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
            //     myInt: Integer;
            // begin
            //     "Line No." := "Line No." + 1;
            // end;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
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

        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

}
