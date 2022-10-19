pageextension 60106 "Posted Purch Rcpt Subform" extends "Posted Purchase Rcpt. Subform"
{
    layout
    {
        addafter(Description)
        {

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