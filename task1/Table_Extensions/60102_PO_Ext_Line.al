tableextension 60102 "PO Ext Line" extends "Purchase Line"
{
    fields
    {
        field(60100;"Total Weight";Decimal)
        {
            DataClassification = ToBeClassified;
            
        }
        field(60101;"Total Hight";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    
    var
        myInt: Integer;
}