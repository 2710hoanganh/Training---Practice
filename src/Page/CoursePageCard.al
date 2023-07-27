/// <summary>
/// Page Course Page Card (ID 50100).
/// </summary>
/// <summary>
/// Page Course Page Card (ID 50100).
/// </summary>
page 50100 "Course Page Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    SourceTable = "Course Infomation Table";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Code"; rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = all;
                }
                field(Price; Rec.Price)
                {
                    ApplicationArea = all;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                }
                field(Active; Rec.Active)
                {
                    ApplicationArea = All;
                }
                field("Instructor Code"; Rec."Instructor Code")
                {
                    ApplicationArea = all;
                }
                field("Intructor Name"; Rec."Intructor Name")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Resource Card")
            {
                ApplicationArea = All;
                RunObject = Page "Resource Card";
                RunPageLink = "No." = field("Instructor Code");
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin

                end;
            }
            action(print)
            {
                ApplicationArea = All;
                Image = Print;
                trigger OnAction()
                var
                    r: Report "Course Report";
                    c: Record "Course Infomation Table";
                begin
                    c.SetRange(Code, rec.Code);
                    c.FindSet();
                    REPORT.RunModal(Report::"Course Report", true, true, c);
                end;
            }
        }
    }

    var
        myInt: Integer;
}