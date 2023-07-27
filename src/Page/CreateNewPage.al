/// <summary>
/// Page My Test Page 1  (ID 50102).
/// </summary>
page 50102 "My Test Page 1 "
{
    layout
    {
        area(Content)
        {
            group(General)
            {
                group(Input)
                {
                    field(Value1; Value1)
                    {
                        ApplicationArea = All;
                    }
                    field(Value2; Value2)
                    {
                        ApplicationArea = All;
                    }
                }
                group(Output)
                {
                    field(Result; Result)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }

        }
    }




    actions
    {
        area(Processing)
        {
            action(Execute)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin
                    if Value1 > Value2 then
                        Result := true;
                end;
            }
        }
    }


    var
        Value1, Value2 : Integer;
        Result: Boolean;
}