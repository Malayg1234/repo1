page 50002 "Item Entry List"
{
    Caption = 'Item Entry List';
    PageType = List;
    SourceTable = "Item Entry";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
