pageextension 60110 "Gen Jnl Line Ext" extends "Gen. Journal Line Entity"
{
    layout
    {
        addbefore(description)
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
            field("Total Weight"; Rec."Total Weight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Total Weight field.';
            }
            field("Total Hight"; Rec."Total Hight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Total Hight field.';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}