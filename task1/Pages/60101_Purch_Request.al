page 60101 "Purchase Request"
{
    Caption = 'Purchase Request';
    PageType = Card;
    SourceTable = "Purchase Request Header";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
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

            part("Purchase Request Sub Form"; "Purchase Request Sub Form")
            {
                ApplicationArea = all;
                SubPageLink = "Document No." = field("No.");
            }
        }
    }

    actions
    {
        area(Reporting)
        {
            action("Purchase Request Report")
            {
                ApplicationArea = All;
                Image = PrintReport;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()

                begin
                    //Status := "Open";
                    PutchReqHead.Reset();
                    PutchReqHead.SetCurrentKey("No.");
                    PutchReqHead.SetRange("No.", rEC."No.");
                    if PutchReqHead.FindFirst() then begin
                        if PutchReqHead.Status = PutchReqHead.Status::Open then
                            Error('Document %1 Should be Released', Rec."No.")
                        else begin
                            Report.RunModal(60100, true, true, PutchReqHead);

                        end;
                    end;
                    // PutchReqHead.SetRange(Status, rec.Status);

                    // // if (PutchReqHead.Status = )
                    // // while (PutchReqHead.Status)


                end;
            }
        }
    }





    // trigger OnInit()
    // var
    //     myInt: Integer;
    // begin
    //     if (PutchReqHead.Status = PutchReqHead.Status::Released) then
    //     Error('Can not Edit document after Released')
    //     else begin
    //         Page.RunModal()
    //     end;


    // end;

    var
        PutchReqHead: Record "Purchase Request Header";

}
