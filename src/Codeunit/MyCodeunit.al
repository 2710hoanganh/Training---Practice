/// <summary>
/// Codeunit MyCodeunit (ID 50101).
/// </summary>
codeunit 50101 MyCodeunit // variable
{
    trigger OnRun()
    begin
        MESSAGE('The value of %1 is %2', 'YesOrNo', YesOrNo);
        MESSAGE('The value of %1 is %2', 'Amount', Amount);
        MESSAGE('The value of %1 is %2', 'When Was It', "When Was It");
        MESSAGE('The value of %1 is %2', 'What Time', "What Time");
        MESSAGE('The value of %1 is %2', 'Description', Description);
        MESSAGE('The value of %1 is %2', 'Code Number', "Code Number");
        MESSAGE('The value of %1 is %2', 'Ch', Ch);
        MESSAGE('The value of %1 is %2', 'Color', Color::Blue);
    end;

    var
        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Enum ColorEnum;
}


enum 50101 ColorEnum
{
    Extensible = true;

    value(0; Blue)
    {
    }
}