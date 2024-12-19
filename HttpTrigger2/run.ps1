using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)
Import-Module Az.Compute

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function (2) processed a request."

# Interact with query parameters or the body of the request.
$name = $Request.Query.Name
if (-not $name) {
    $name = $Request.Body.Name
}

$body = "This HTTP triggered function (2) (version $($env:APP_VERSION)) executed successfully. Pass a name in the query string or in the request body for a personalized response."

if ($name) {
    $body = "Hello, $name. This HTTP triggered function (2) executed successfully."
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
