tableextension 60109 "Vendor Ledger Entry Ext" extends "Vendor Ledger Entry"
{
    fields
    {
        field(60100; "LC No."; code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(60101; Remarks; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(60102; "LC Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(60103; "Total Weight"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(60104; "Total Hight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}