/// <summary>
/// Table Customer Overview Table (ID 50102).
/// </summary>
table 50102 "Customer Overview Table "
{
    DataClassification = ToBeClassified;
    Caption = 'Customer Overview Table';
    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Entry No.';
            NotBlank = true;

        }
        field(2; "Customer No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer No.';
            NotBlank = true;
        }
        field(3; "Customer Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Caption = 'Customer Name';
            NotBlank = true;
        }
        field(4; "Source Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = ' Source Code';
            NotBlank = true;

        }
        field(5; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
            Caption = 'Amount';
            NotBlank = true;

        }
        field(6; LastRunDate; DateTime)
        {
            DataClassification = ToBeClassified;
            Caption = 'Last Run Date';
            NotBlank = true;
        }
    }

    keys
    {
        // key(PK; "Entry No.")
        // {
        //     Clustered = true;
        // }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}