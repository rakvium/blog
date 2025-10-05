# My first blog web-application using Ruby on Rails Tutorial

[![#StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)

Link: https://hello-blog.herokuapp.com/

Thanks to:
[*Ruby on Rails Tutorial*](http://railstutorial.org/)
 [Michael Hartl](http://michaelhartl.com/).

### API documentation

GraphQL API documentation should be available at
`/graphql-docs` relative path after executing next rake tasks:

- ```rake graphql:dump_schema```
- ```rake graphql:generate_docs```

Also, you are allowed to play with GraphiQL IDE in the development environment,
which is mounted by default at `/graphiql`.

### Authentication

Authentication is built using regular tokens saved in the separate authentication_tokens DB table.
Unfortunately, JSON Web Tokens (JWT) are not suitable for us, because we want to give the user
the opportunity to invalidate their token, view and manage all of their sessions at any time.
Tokens themselves are saved using SHA256 hash function with random `salt`, which is set
via `SECRET_ENCRYPTOR_KEY_SALT` environment variable.

#### Security side

You may notice, that tokens aren't securely compared and are probably vulnerable to timing attacks (`example: an attacker computes tons of hashes and stores them looking for a hash that starts with 0x00. Upon finding a plaintext with that value, they send that plaintext, they listen for timing on response. They do this for 255 more values until one value takes slightly longer. That's the first byte value of the hash created from the plaintext`), but...

This will almost certainly not matter because to carry out the attack, the attacker must submit tokens whose hash value they know. The hash value depends on the salt. Thus, unless the attacker somehow already knows the salt, carrying out this attack is not possible.

Thus, while there's indeed a possibility of such an attack, it's extremely infeasible and it's not our case. The computation requirements for such an attack are also enormous, and they keep growing exponentially with every bit discovered from the hash.

#### Authentication usage example

1. Call API to sign the user up:

- ```curl -X POST -H "Content-Type: application/json" --data '{ "query": "mutation { signUp(email: \"test@example.com\", password: \"12345678\", passwordConfirmation: \"12345678\") { user { id email } token }}" }' localhost:3000/graphql```

- Expected response:
```{"data":{"signUp":{"user":{"id":"14","email":"test@example.com"},"token":"fPP4M97tEBnuHX3FK6K6jF32"}}}```

2. Save the token and next time include its value with `X_AUTH_TOKEN` header to call all protected endpoints:
- ```curl -X POST -H "Content-Type: application/json" -H "X_AUTH_TOKEN: fPP4M97tEBnuHX3FK6K6jF32" --data '{ "query": "{ me { id email }}" }' localhost:3000/graphql```

- Expected response (with X_AUTH_TOKEN header):
```{"data":{"me":{"id":"14","email":"test@example.com"}}}```

- Expected response (without provided auth token):
```{"data":{"me":null},"errors":[{"message":"You need to authenticate to perform this action.","locations":[{"line":1,"column":3}],"path":["me"]}]}```
