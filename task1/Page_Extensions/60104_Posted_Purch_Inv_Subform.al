pageextension 60104 "Posted Purch Inv Subform" extends "Posted Purch. Invoice Subform"
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