pageextension 60103 "Posted Purchase Invoice"  extends "Posted Purchase Invoice"
{
    layout
    {
        addlast(General)
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
    
    actions
    {
        // Add changes to page actions here
    }
    
    var
        myInt: Integer;
}