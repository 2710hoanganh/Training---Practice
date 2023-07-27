/// <summary>
/// Table Course Infomation Table (ID 50100).
/// </summary>
table 50100 "Course Infomation Table"
{
    DataClassification = ToBeClassified;
    Caption = 'Course Table';
    fields
    {
        field(10; "Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            Caption = ' Course Code';
            NotBlank = true;
        }
        field(20; Name; Text[30])
        {
            Caption = 'Course Name';
            NotBlank = true;
        }
        field(30; Description; Text[70])
        {
            Caption = 'Course Description';
            NotBlank = true;
        }
        field(40; "Type"; Enum "Course Type")
        {
            Caption = 'Course Type';
            NotBlank = true;
        }
        field(50; "Duration"; Decimal)
        {
            Caption = 'Course Duration';
            NotBlank = true;
        }
        field(60; "Price"; Decimal)
        {
            Caption = 'Course Price';
            NotBlank = true;
        }
        field(70; "Active"; Boolean)
        {
            Caption = 'IsActive';
        }
        field(80; "Difficulty"; Integer)
        {
            Caption = 'Course Difficulty';
            NotBlank = true;
        }
        field(90; "Passing Rate"; Integer)
        {
            Caption = 'Course Passing Rate';
            NotBlank = true;
        }
        field(100; "Instructor Code"; Code[20])
        {
            Caption = 'Instructor Code';
            TableRelation = Resource where(Type = const(Person));

        }
        field(120; "Intructor Name"; Text[50])
        {
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD("Instructor Code")));
        }


    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
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



enum 50100 "Course Type"
{
    Extensible = true;

    value(0; "Remote Training")
    {
    }
    value(1; "Instructor Led") { }
    value(2; "e-Learning") { }
}