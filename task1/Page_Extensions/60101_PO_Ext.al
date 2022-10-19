pageextension 60101 "Purchase Orders Ext " extends "Purchase Order"
{
    layout
    {
        addfirst(General)
        {
            field("LC No."; Rec."LC No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LC No. field.';
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Remarks field.';
            }
            field("LC Date"; Rec."LC Date")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LC Date field.';
            }


        }
    }
}
