pageextension 60102 "Purchase Order Subform Ext" extends "Purchase Order Subform"
{
    layout
    {
        addbefore(Description)
        {

            field("Total Hight"; Rec."Total Hight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Total Hight field.';
            }
            field("Total Weight"; Rec."Total Weight")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Total Weight field.';
            }
        }
    }
}
