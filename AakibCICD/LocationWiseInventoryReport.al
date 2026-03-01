report 50001 "Location-wise Inventory"
{
    ApplicationArea = All;
    Caption = 'Location-wise Inventory';
    UsageCategory = ReportsAndAnalysis;
    DefaultRenderingLayout = LocationWiseInventoryLayout;

    dataset
    {
        dataitem(Item; Item)
        {
            RequestFilterFields = "No.", "Item Category Code";
            column(ItemNo; "No.")
            {
            }
            column(ItemDescription; Description)
            {
            }
            column(BaseUnitOfMeasure; "Base Unit of Measure")
            {
            }
            column(ItemCategoryCode; "Item Category Code")
            {
            }
            dataitem(Location; Location)
            {
                column(LocationCode; Code)
                {
                }
                column(LocationName; Name)
                {
                }
                column(Inventory; Inventory)
                {
                }
                trigger OnPreDataItem()
                begin
                    // Get all locations
                end;

                trigger OnAfterGetRecord()
                begin
                    // Calculate inventory for this item at this location
                    Item.SetRange("Location Filter", Location.Code);
                    Item.CalcFields(Inventory);
                    Inventory := Item.Inventory;
                end;
            }
        }
    }

    rendering
    {
        layout(LocationWiseInventoryLayout)
        {
            Type = RDLC;
            LayoutFile = './LocationWiseInventoryReport.rdl';
            Caption = 'Location-wise Inventory Layout';
            Summary = 'Standard layout for Location-wise Inventory Report';
        }
    }

    var
        Inventory: Decimal;
}
