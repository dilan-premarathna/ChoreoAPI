## Fossa ServiceNow API

An API to Retrieve a list of both projects and issues from fossa which are stored in redis.

## Instructions to add configurables

Create a `Config.toml` file inside the folder with the following content

```toml
[configurables]
fossaUrl = "https://app.fossa.com"
fossaToken = "<fossa_token>"
redisUser = "<redis_user>"
redisPassword = "<redis_password>"
```
