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
            column(Sell_to_Customer_No_; invCusName)
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
            //invCusName : Text;
            begin
                SetRange("Posting Date", st_date, ed_date);

                // if recCustm.get("Sell-to Customer No.") then;
                //     invCusName := recCustm.Name;

            end;

            trigger OnAfterGetRecord()


            begin
                if recCustm.get("Sell-to Customer No.") then;
                invCusName := recCustm.Name;
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
            column(Sell_to_Customer_No_cr; CrCusName)
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

            trigger OnAfterGetRecord()
            // var
            //     myInt: Integer;
            begin
                if recCustm.get("Sell-to Customer No.") then;
                CrCusName := recCustm.Name;
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
        recCustm: Record Customer;
        invCusName: Text;
        CrCusName: Text;

}