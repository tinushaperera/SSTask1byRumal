tableextension 60106 "Purch Rcpt Line" extends "Purch. Rcpt. Line"
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