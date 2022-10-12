report 60101 "Sales Reports"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    //DefaultRenderingLayout = LayoutName;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report_Layouts/Sales_Reports.rdl';

    dataset
    {
        dataitem("Sales Invoice Line"; "Sales Invoice Line")
        {
            column(PostingDate_SalesInvoiceLine; "Posting Date")
            {
            }
            column(Document_No_; "Document No.")
            {
            }
            column(BilltoCustomerNo_SalesInvoiceLine; "Bill-to Customer No.")
            {
            }
            column(No_SalesInvoiceLine; "No.")
            {
            }

            column(Description_SalesInvoiceLine; Description)
            {
            }
            column(Quantity_SalesInvoiceLine; Quantity)
            {
            }
            column(Amount_SalesInvoiceLine; Amount)
            {
            }

            trigger OnPreDataItem()
            var
            //salesHead:
            begin
                SetRange("Posting Date", st_date, ed_date);
            end;

        }
        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {

            column(PostingDate_SalesCrMemoLine; "Posting Date")
            {
            }
            column(DocumentNo_SalesCrMemoLine; "Document No.")
            {
            }
            column(BilltoCustomerNo_SalesCrMemoLine; "Bill-to Customer No.")
            {
            }
            column(No_SalesCrMemoLine; "No.")
            {
            }
            column(Description_SalesCrMemoLine; Description)
            {
            }
            column(Quantity_SalesCrMemoLine; Quantity)
            {
            }
            column(Amount_SalesCrMemoLine; Amount)
            {
            }

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                SetRange("Posting Date", st_date, ed_date);
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

                    // field(Name; SourceExpression)
                    // {
                    //     ApplicationArea = All;

                    // }
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
        myInt: Integer;
        st_date: Date;
        ed_date: Date;

}