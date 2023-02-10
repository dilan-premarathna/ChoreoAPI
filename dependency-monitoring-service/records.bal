# Holds FOSSA related congigurables 
# 
# + fossaUrl - Holds the URL for the FOSSA API
# + fossaToken - Holds the access token used when sending a request to FOSSA

type FossaConfigurables record {|
    string fossaUrl;
    string fossaToken;
|};

# Holds redis related configurables
# 
# + redisUser - Holds the connection string used to acces the redis cache
# + redisPassword - Holds the cache Key used to access the redis cache
type RedisConfigurables record {|
    string redisUser;
    string redisPassword;
|};
