pageextension 60100 Company_info extends "Company Information"
{
    layout
    {
        addlast(General)
        {
            field("Company Website"; Rec.Company_Web)
            {
                ApplicationArea = all;

            }
        }
    }

}
