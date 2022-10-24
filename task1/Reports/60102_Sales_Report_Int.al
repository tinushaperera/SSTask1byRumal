report 60102 "Sales Report Int"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report_Layouts/Sales_Report_Int.rdl';


    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            trigger OnPreDataItem()

            begin
                SetRange("Posting Date", st_date, ed_date);
            end;

            trigger OnAfterGetRecord()
            // var
            //     myInt: Integer;
            begin
                tempSalesInv.Init();
                tempSalesInv."Line No." := "Line No.";
                tempSalesInv."Document No." := "Document No.";
                tempSalesInv."Posting Date" := "Posting Date";
                tempSalesInv."Sell-to Customer No." := "Sell-to Customer No.";
                tempSalesInv."No." := "No.";
                tempSalesInv.Description := Description;
                tempSalesInv.Quantity := Quantity;
                tempSalesInv.Amount := Amount;
                tempSalesInv.Insert();

            end;
        }

        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            trigger OnPreDataItem()
            // var
            //     myInt: Integer;
            begin
                SetRange("Posting Date", st_date, ed_date);
            end;

            trigger OnAfterGetRecord()
            // var
            //     myInt: Integer;
            begin
                tempSalesInv.Init();
                tempSalesInv."Line No." := "Line No.";
                tempSalesInv."Document No." := "Document No.";
                tempSalesInv."Posting Date" := "Posting Date";
                tempSalesInv."Sell-to Customer No." := "Sell-to Customer No.";
                tempSalesInv."No." := "No.";
                tempSalesInv.Description := Description;
                tempSalesInv.Quantity := -Quantity;
                tempSalesInv.Amount := -Amount;
                tempSalesInv.Insert();
            end;
        }
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
            column(InvLineNo; tempSalesInv."Line No.")
            { }
            column(InvPosDate; tempSalesInv."Posting Date")
            { }
            column(InvDocNo; tempSalesInv."Document No.")
            { }
            column(InvSellToCusNo; tempSalesInv."Sell-to Customer No.")
            { }
            column(InvItemNo; tempSalesInv."No.")
            { }
            column(InvItemDes; tempSalesInv.Description)
            { }
            column(InvQtc; tempSalesInv.Quantity)
            { }
            column(InvAmount; tempSalesInv.Amount)
            { }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                IF Number = 1 THEN BEGIN
                    IF NOT tempSalesInv.FINDSET(FALSE, FALSE) THEN
                        CurrReport.BREAK;
                END ELSE
                    IF tempSalesInv.NEXT = 0 THEN
                        CurrReport.BREAK;
            end;

        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(st_date; st_date)
                    {
                        ApplicationArea = all;
                        Caption = 'Start Date';
                    }
                    field(ed_date; ed_date)
                    {
                        ApplicationArea = all;
                        Caption = 'End Date';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        //myInt: Integer;
        tempSalesInv: Record "Sales Invoice Line" temporary;
        //tempSalesCrMemo: Record "Sales Cr.Memo Line" temporary;
        st_date: Date;
        ed_date: Date;
        invCusName : text;
        crmCusName : text;
        recCust : Record Customer;
}