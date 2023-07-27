/// <summary>
/// Page Customer Overview Page List (ID 50103).
/// </summary>
page 50103 "Customer Overview Page List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Customer Overview Table ";

    layout
    {
        area(Content)
        {
            repeater("Customer List")
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Source Code"; Rec."Source Code")
                {

                    ApplicationArea = All;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {

                    ApplicationArea = All;
                    Editable = false;
                }
                field(LastRunDate; Rec.LastRunDate)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Update Customer Overview")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    c: Codeunit "Customer Update";
                begin
                    c.Run();
                end;
            }
        }
    }

    var
        myInt: Integer;
}