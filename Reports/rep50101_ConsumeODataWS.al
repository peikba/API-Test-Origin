report 50101 "DIR Consume OData WS"
{
    Caption = 'Consume OData WS';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    UseRequestPage = false;

    trigger OnInitReport()
    var
        HttpClient: HttpClient;
        HttpResponseMessage: HttpResponseMessage;
        JsonToken: JsonToken;
        JsonObject: JsonObject;
        JsonArray: JsonArray;
        JsonText: text;
        Customer: Record Customer temporary;
        Url: Text;
    begin
        Url := 'http://NAVTraining:7048/BC140/ODataV4/Company(''CRONUS%20International%20Ltd.'')/WSCustomerOData';
        HttpClient.UseWindowsAuthentication('Admin', '1<3VScode', 'NavTraining');
        if not HttpClient.Get(Url, HttpResponseMessage) then
            Error('The call to the web service failed.');
        if not HttpResponseMessage.IsSuccessStatusCode then
            error('The web service returned an error message:\\' + 'Status code: %1\' + 'Description: %2', HttpResponseMessage.HttpStatusCode, HttpResponseMessage.ReasonPhrase);
        HttpResponseMessage.Content.ReadAs(JsonText);
        error(JsonText);
        JsonText := '[' + JsonText + ']';
        if not JsonArray.ReadFrom(JsonText) then
            Error('Invalid response, expected an JSON array as root object');
        foreach jsonToken in JsonArray do begin
            JsonObject := JsonToken.AsObject;
        end;
    end;
}