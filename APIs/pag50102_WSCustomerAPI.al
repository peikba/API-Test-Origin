page 50102 "DIR WS Customer API"
{
    PageType = API;
    Caption = 'WS Customer API';
    APIPublisher = 'DirectionsEMEA';
    APIGroup = 'APIs';
    APIVersion = 'v1.0';
    EntityName = 'WSCustomer';
    EntitySetName = 'WSCustomers';
    ODataKeyFields = Id;
    SourceTable = Customer;
    DelayedInsert = true;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No"; "No.")
                {
                    Caption = 'No.';
                }
                field("Name"; "Name")
                {
                    Caption = 'Name';
                }
                field("DateFilter"; "Date Filter")
                {
                    Caption = 'Date Filter';
                }
                field("SalesLCY"; "Sales (LCY)")
                {
                    Caption = 'Sales (LCY)';
                }
            }
        }
    }
}