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

            trigger OnValidate()
            // var
            //     todayDate: Date;
            begin
                // todayDate := Today();
                "Document Date" := WorkDate();
            end;

        }
        field(2; "Description"; Text[100])
        {
            Caption = 'Description ';
            DataClassification = ToBeClassified;
        }

        field(3; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            DataClassification = ToBeClassified;
            TableRelation = Vendor."No.";

            trigger OnValidate()
            var
                venRec: Record Vendor;
            begin
                venRec.Get("Vendor No.");
                "Vendor Name" := venRec.Name;
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
            OptionMembers = " ","Open","Released";
            OptionCaption = ' ,Open,Released';

        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }




}
