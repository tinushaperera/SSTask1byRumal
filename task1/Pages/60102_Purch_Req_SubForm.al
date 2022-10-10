page 60102 "Purchase Request Sub Form"
{
    Caption = 'Purchase Request Sub Form';
    PageType = ListPart;
    SourceTable = "Purchase Request Line";
    AutoSplitKey = true; // Primary key auto increment; Starting no 10000
    layout
    {
        area(content)
        { 
            repeater(General)
            {
                // field("Total Amount"; Rec."Total Amount")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Total Amount field.';
                // }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Editable = false;

                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Line Nombers are auto Increment';
                    Editable = false;
                }
                field("Type"; Rec."Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Description "; Rec."Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description  field.';
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount  field.';
                }



            }
        }
    }
}
