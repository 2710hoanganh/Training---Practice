/// <summary>
/// TableExtension Customer Table Ext (ID 50100) extends Record Customer.
/// </summary>
tableextension 50100 "Customer Table Ext" extends Customer
{
    fields
    {
        // Add changes to table fields here
    }

    /// <summary>
    /// UpdateCreditLimit.
    /// </summary>
    /// <param name="NewCreditLimit">VAR Decimal.</param>
    /// <param name="c">Record Customer.</param>
    procedure UpdateCreditLimit(var NewCreditLimit: Decimal; c: Record Customer)
    var
    begin
        NewCreditLimit := Round(NewCreditLimit / 10000) * 10000;
        if NewCreditLimit > 0 then
            c.Validate("Credit Limit (LCY)", NewCreditLimit);
        c.SetRange("No.", C."No.");
        if c.FindSet() then begin
            repeat
                c."Credit Limit (LCY)" := NewCreditLimit;
                c.Modify(true);
            until c.Next() = 0;
        end;
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
        "Cus ".SetRange("Posting Date", from, "to");//set range 
        "Cus ".SetRange("Customer No.", Customer."No.");
        if "Cus ".FindSet() then begin
            repeat
                Cost += "Cus "."Sales (LCY)";
            until "Cus ".Next() = 0;
        end;
        exit(Cost)
    end;

    var
        myInt: Integer;
}