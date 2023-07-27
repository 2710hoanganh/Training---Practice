xmlport 50101 "Export Variable Text"
{
    Format = VariableText;
    Direction = Export;
    TextEncoding = UTF16;
    // UseRequestPage = false;
    // TableSeparator = '';

    schema
    {
        textelement(Root)
        {
            tableelement(Course; "Course Infomation Table")
            {
                XmlName = 'Course';
                fieldattribute("Code"; Course.Code)
                {

                }
                fieldattribute(Name; Course.Name)
                {

                }
                fieldattribute(Description; Course.Description)
                {

                }
                fieldattribute("Type"; Course.Type)
                {

                }
                fieldattribute("Duration"; Course.Duration)
                {

                }
                fieldattribute(Price; Course.Price)
                {

                }
                fieldattribute(Active; Course.Active)
                {

                }
                fieldattribute(Difficulty; Course.Difficulty)
                {

                }
                fieldattribute(PassingRate; Course."Passing Rate")
                {

                }

            }
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
                    // field(Name; SourceExpression)
                    // {

                    // }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {

                }
            }
        }
    }

    var
        myInt: Integer;
}