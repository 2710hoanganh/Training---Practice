/// <summary>
/// Codeunit Customer Update (ID 50103).
/// </summary>
codeunit 50103 "Customer Update"
{
    trigger OnRun()
    begin
        UpdateCustomerOverview();
    end;



    local procedure UpdateCustomerOverview()
    var
        GLEntry: Record "G/L Entry";
        Customer: Record Customer;
        "CustomerOverview": Record "Customer Overview Table ";
    begin
        Customer.Reset();//remove filter
        Customer.FindSet();//find set of customer record
        repeat//loop
            GLEntry.SetRange("Source Type", GLEntry."Source Type"::Customer);//filter
            GLEntry.SetRange("Source Code", 'SALES');//filter
            GLEntry.SetRange("Source No.", Customer."No.");//filter
            if GLEntry.FindSet then begin
                repeat//loop
                    CustomerOverview.Init;
                    CustomerOverview."Entry No." := CustomerOverview."Entry No." + 1;
                    CustomerOverview."Customer No." := Customer."No.";
                    CustomerOverview."Customer Name" := Customer."Name";
                    CustomerOverview."Source Code" := GLEntry."Source Code";
                    CustomerOverview."Amount" := GLEntry."Amount";
                    CustomerOverview.LastRunDate := CURRENTDATETIME;
                    CustomerOverview.Insert;
                until GLEntry.Next = 0;

            end;
        until Customer.Next() = 0;


        // if Customer.FindSet() then begin
        //     repeat
        //         if GLEntry.FindSet() then begin
        //             repeat
        //                 CustomerOverview.Init();
        //                 CustomerOverview."Entry No." := myInt + 1;
        //                 CustomerOverview."Customer No." := Customer."No.";
        //                 CustomerOverview."Customer Name" := Customer."Name";
        //                 CustomerOverview."Source Code" := GLEntry."Source Code";
        //                 CustomerOverview."Amount" := GLEntry."Amount";
        //                 CustomerOverview.LastRunDate := CURRENTDATETIME;
        //                 CustomerOverview.Insert;
        //             until GLEntry.Next() = 0;
        //         end;
        //     until Customer.Next() = 0;
        // end;
    end;

    local procedure Auto()
    var
        "CustomerOverview": Record "Customer Overview Table ";
    begin
        if CustomerOverview.FindLast() then begin
            myInt := "CustomerOverview"."Entry No.";
        end
        else begin
            myInt := "CustomerOverview"."Entry No.";
        end;

    end;

    local procedure Delete()
    var
        "CustomerOverview": Record "Customer Overview Table ";
    begin
        CustomerOverview.DeleteAll();
    end;

    var
        myInt: Integer;
}