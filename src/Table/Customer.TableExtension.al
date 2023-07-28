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
        from := 20250117D;// from 17/1/2025 
        "to" := 20250120D;//20/1/2025
        "Cus ".SetRange("Posting Date", from, "to");//set range 3 ngày
        "Cus ".SetRange("Customer No.", Customer."No.");
        if "Cus ".FindSet() then begin
            "Cus ".CalcSums("Sales (LCY)");
            Cost := "Cus "."Sales (LCY)"
        end;
        exit(Cost)
    end;

    var
        myInt: Integer;
}