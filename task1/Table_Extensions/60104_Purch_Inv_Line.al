tableextension 60104 "Purch Inv Line Ext" extends "Purch. Inv. Line"
{
    fields
    {
        field(60100; "Total Weight"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(60101; "Total Hight"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    var
        myInt: Integer;
}