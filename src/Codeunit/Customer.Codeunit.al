/// <summary>
/// Codeunit Customer Code Unit (ID 50105).
/// </summary>
codeunit 50105 "Customer Code Unit"
{
    trigger OnRun()
    begin

    end;

    /// <summary>
    /// UpdateCreditLimit.
    /// </summary>
    /// <param name="NewCreditLimit">VAR Decimal.</param>
    procedure UpdateCreditLimit(var NewCreditLimit: Decimal)
    begin

    end;



    /// <summary>
    /// CalculateCreditLimit.
    /// </summary>
    /// <param name="Customer">VAR Record Customer.</param>
    /// <returns>Return value of type Decima.</returns>
    procedure CalculateCreditLimit(var Customer: Record Customer): Decimal//trả về decimal
    var
        Cost: Decimal;
        from: Date;
        "to": Date;
        "Cus ": Record "Cust. Ledger Entry";
    begin
        Cost := 0;
        from := 20250117D;
        "to" := 20250120D;
        "Cus ".SetRange("Customer No.", Customer."No.");
        "Cus ".SetRange("Posting Date", from, "to");//set range 
        if "Cus ".FindSet() then begin
            repeat
                Cost := Cost + "Cus "."Sales (LCY)";
            until "Cus ".Next() = 0;
        end;
        exit(Cost);
    end;

    var
        myInt: Integer;
}