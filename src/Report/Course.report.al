/// <summary>
/// Report Course Report (ID 50100).
/// </summary>
report 50100 "Course Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    RDLCLayout = 'report.rdl';
    WordLayout = 'report.docx';
    dataset
    {
        dataitem(Course; "Course Infomation Table")
        {
            RequestFilterFields = Code;
            column(Code; Code)
            {

            }
            column(Name; Name)
            {
            }
            column(Description; Description) { }
            column(Type; Type) { }
            column(Duration; Duration) { }
            column(Price; Price) { }
            column(Active; Active) { }
            column(Difficulty; Difficulty) { }
            column(Passing_Rate; "Passing Rate") { }
            column(Instructor_Code; "Instructor Code") { }
            column(Intructor_Name; "Intructor Name") { }
            column(SystemCreatedAt; SystemCreatedAt) { }
        }
    }

    requestpage
    {
        // layout
        // {
        //     area(Content)
        //     {
        //         group(GroupName)
        //         {
        //             field(Name; SourceExpression)
        //             {
        //                 ApplicationArea = All;

        //             }
        //         }
        //     }
        // }

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

    var
        myInt: Integer;
}