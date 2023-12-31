/// <summary>
/// PageExtension Customer Page Card Ext (ID 50101) extends Record MyTargetPage.
/// </summary>
pageextension 50101 "Customer Page Card Ext" extends "Customer Card"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addlast("F&unctions")
        {
            action(UpdateCreditLimit)// mở vào mục action trên page vào function chọn UpdateCreditLimit
            {
                Caption = 'Update Credit Limit';
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                Image = CalculateCost;
                trigger OnAction()
                begin
                    CallUpdateCreditLimit(Rec);
                end;
            }
            action("CalculateCreditLimit")// test tính credit limit
            {
                Caption = 'Calculate Credit Limit';
                ApplicationArea = all;
                Promoted = true;
                PromotedIsBig = true;
                Image = CalculateCost;
                trigger OnAction()
                var
                    c: Record Customer;
                begin
                    Message('%1', c.CalculateCreditLimit(Rec));
                end;
            }
        }
    }


    local procedure CallUpdateCreditLimit(var c: Record Customer)
    var
        CreditLimitCalculated, CreditLimitActual : Decimal;
    begin
        CreditLimitActual := c."Credit Limit (LCY)";
        CreditLimitCalculated := c.CalculateCreditLimit(Rec);
        if CreditLimitActual = Round(c.CalculateCreditLimit(Rec) / 10000) * 10000 then begin
            //line 52 làm tròn phòng trường hợp đã được update credit limit vd đã được update là 2400 sau khi tính lại chưa làm tròn là 2422 => 2400 != 2422 :)))
            Message("Up-to-date credit limit");
            EXIT;
        end;
        if CreditLimitActual <> CreditLimitCalculated then begin
            if Confirm("Confirm Message", true, CreditLimitCalculated) = true then begin
                c.UpdateCreditLimit(CreditLimitCalculated, Rec);
                Message("Rounded credit limit");
            end
            else begin
                EXIT;
            end;
        end;
    end;



    var
        myInt: Integer;
        "Confirm Message": Label 'Are you sure you want to set the Credit Limit (LCY) to %1';
        "Rounded credit limit": Label 'The credit limit was rounded to  0 to comply with company policies';
        "Up-to-date credit limit": Label 'Your credit limit is up to date!';


}