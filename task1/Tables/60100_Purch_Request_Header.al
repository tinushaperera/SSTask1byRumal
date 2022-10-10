table 60100 "Purchase Request Header"
{
    DataCaptionFields = "No.", "Description";
    Caption = 'Purchase Request Header';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;

        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description ';
            DataClassification = ToBeClassified;
            //IF turn on no one create new field without status set to open
            //so i Disable it
            // trigger OnValidate()
            // begin
            //     TestField(Status, Status::Open);
            // end;
        }

        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor;


            trigger OnValidate()
            var
                venRec: Record Vendor;
            //test : Record "Purchase Header";

            begin


                if venRec.get("Vendor No.") then;
                "Vendor Name" := venRec.Name;
                //test."Document Type"::

            end;

        }
        field(4; "Vendor Name"; Text[100])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
            Editable = false;


        }


        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
            Editable = true;

        }

        field(6; Status; Option)
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
            OptionMembers = " ",Open,"Released";
            OptionCaption = ' ,Open,Released';

        }

        // field(7; "Total Amount"; Decimal)
        // {
        //     trigger OnValidate()
        //     var
        //         puchLineRec: Record "Purchase Request Line";
        //     begin
        //         puchLineRec.Get();
        //         "Total Amount" := puchLineRec."Total Amount";
        //     end;
        // }

    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


    trigger OnInsert()

    begin
        "Document Date" := WorkDate();
    end;

    //This one is fully Functional bye bye 
    // trigger OnModify()
    // begin

    //     if Status = Status::Released then
    //         Error('Can not change/Enter data when document is Released');

    // end;   /// to here^^^^^^



    // trigger OnModify()
    // var
    //     venStsRec: Record "Purchase Request Header";

    // begin
    //     Message('hELO');
    //     venStsRec.Get("No.");

    //     if venStsRec.Status = venStsRec.Status::Released then
    //         Error('Can not change/Enter data when document is Released');

    // end;

    var
        purcLineRec: Record "Purchase Request Line";



}
