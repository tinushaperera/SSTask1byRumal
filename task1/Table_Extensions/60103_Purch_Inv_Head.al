tableextension 60103 "Purch Inv Header Ext" extends "Purch. Inv. Header"
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
        field(60102; "LC Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}