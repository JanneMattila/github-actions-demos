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

# Get yourself Personal Access Token with "repo" 
$token = ConvertTo-SecureString -AsPlainText "<a_guid_like_magic_string>"

$response = Invoke-RestMethod -Authentication Bearer -Token $token -Body $body -Headers $headers -ContentType "application/json" -Method "POST" -DisableKeepAlive -Uri $uri
$response
