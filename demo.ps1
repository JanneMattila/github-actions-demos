$payload = @{
    event_type     = "app_deployed"
    client_payload = @{
        name = "Demo from VS Code"
    }
}

$headers = @{
    Accept     = "application/vnd.github.v3+json"
}

$uri = "https://api.github.com/repos/jannemattila/github-actions-demos/dispatches"

$body = ConvertTo-Json $payload
$body

$response = Invoke-RestMethod -Body $body -Headers $headers -ContentType "application/json" -Method "POST" -DisableKeepAlive -Uri $uri
$response

# Invoke-RestMethod: {"message":"Not Found","documentation_url":"https://docs.github.com/rest/reference/repos#create-a-repository-dispatch-event"}