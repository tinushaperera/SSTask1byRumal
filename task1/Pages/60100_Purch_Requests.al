page 60100 "Purchase Requests"
{
    ApplicationArea = All;
    Caption = 'Purchase Requests';
    PageType = List;
    SourceTable = "Purchase Request Header";
    UsageCategory = Lists;
    CardPageId = 60101;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Description "; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description  field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }



            }
            // field("Total Amount"; Rec."Total Amount")
            // {
            //     ApplicationArea = All;
            //     ToolTip = 'Specifies the value of the Total Amount field.';
            // }
        }
    }
}
