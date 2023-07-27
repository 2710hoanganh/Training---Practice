/// <summary>
/// Page Course Page List (ID 50101).
/// </summary>
page 50101 "Course Page List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Course Infomation Table";
    CardPageId = "Course Page Card";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(Level; Level)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(Suggestion; Suggestion)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field(SPA; SPA)
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
            action("Run Codeunit")
            {
                ApplicationArea = All;
                trigger OnAction()
                var
                    unc: Codeunit MyCodeunit;
                begin
                    unc.Run();
                end;
            }
            action(print)
            {
                ApplicationArea = all;
                trigger OnAction()
                var
                    c: Report "Course Report";
                begin

                    c.Run();
                end;
            }
            action("Export Course Data")
            {
                ApplicationArea = all;
                Promoted = true;

                Image = Export;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Xmlport.Run(50100, false, false);
                end;
            }
            action("Export Variable Text")
            {
                ApplicationArea = all;
                Promoted = true;
                Image = Export;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Xmlport.Run(50101, false, false);
                end;
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        Level := '';
        Suggestion := '';
        case rec.Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginer';
                    Suggestion := 'Take e-Learning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            8 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study';
                end;
        end;
        if (Rec."Passing Rate" >= 70) and (Rec.Difficulty >= 6)
        then
            SPA := true;
    end;




    var
        Suggestion, Level : Text;
        SPA: Boolean;


}