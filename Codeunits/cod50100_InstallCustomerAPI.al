codeunit 50100 "DIR Install Customer API"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        WebServiceManagement: codeunit "Web Service Management";
        ObjectType: Option "TableData","Table",,"Report",,"Codeunit","XMLport","MenuSuite","Page","Query","System","FieldNumber";
    begin
        WebServiceManagement.CreateWebService(ObjectType::Page, Page::"DIR WS Customer SOAP", 'WSCustomerSOAP', true);
        WebServiceManagement.CreateWebService(ObjectType::Page, Page::"DIR WS Customer OData", 'WSCustomerOData', true);
        WebServiceManagement.CreateWebService(ObjectType::Page, Page::"DIR WS Customer API", 'WSCustomerAPI', true);
    end;
}