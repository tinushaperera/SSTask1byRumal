report 60100 "Purchase Request Report"
{
    UsageCategory = ReportsAndAnalysis;
    //ApplicationArea = All;
    Caption = 'Purchase Request Report';
    DefaultLayout = RDLC;
    RDLCLayout = 'Report_Layouts/Purch_Req_Report.rdl';

    dataset
    {
        dataitem("Purchase Request Header"; "Purchase Request Header")
        {
            //Purchase Request Header 
            column(No; "No.")
            {
            }
            column(Description; Description)
            {
            }
            column(VendorNo; "Vendor No.")
            {
            }
            column(VendorName; "Vendor Name")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }
            column(Status; repStatus)
            {

            }



            //Get Company Info

            column(compName; compRec.Name)
            { }
            column(compAddress1; compRec.Address)
            { }
            column(compAddress2; compRec."Address 2")
            { }
            column(compCity; compRec.City)
            { }
            column(compPhone; compRec."Phone No.")
            { }
            column(compFax; compRec."Fax No.")
            { }
            column(compEmail; compRec."E-Mail")
            { }
            column(compPicture; compRec.Picture)
            { }
            column(compWebSite; compRec.Company_Web)
            { }


            //Link Line Table

            dataitem("Purchase Request Line"; "Purchase Request Line")
            {
                DataItemLinkReference = "Purchase Request Header";
                DataItemLink = "Document No." = field("No.");

                column(Type; Type)
                { }
                column(No_; "No.")
                { }
                column(DescriptionLine; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_Price; "Unit Price")
                { }
                column(Amount; Amount)
                { }


            }

            trigger OnAfterGetRecord() //On Pre Recors : To save Compute power 

            begin
                compRec.Get();
                compRec.CalcFields(Picture);

                if Status = Status::Open then
                    repStatus := 'Pending'


                else
                    if Status = Status::Released then
                        repStatus := 'Approved';

            end;


        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }

    var
        compRec: Record "Company Information";
        repStatus: Text[20];


}
