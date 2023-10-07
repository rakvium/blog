# My first blog web-application using Ruby on Rails Tutorial

[![codecov](https://codecov.io/gh/rakvium/blog/branch/master/graph/badge.svg)](https://codecov.io/gh/rakvium/blog)
[![Code Climate](https://codeclimate.com/github/rakvium/blog.png)](https://codeclimate.com/github/rakvium/blog)
[![#StandWithUkraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)

Link: https://hello-blog.herokuapp.com/

Thanks to:
[*Ruby on Rails Tutorial*](http://railstutorial.org/)
 [Michael Hartl](http://michaelhartl.com/).

### API documentations

GraphQL API documentations should be available at
`/graphql-docs` relative path after executing next rake tasks:

- ```rake graphql:dump_schema```
- ```rake graphql:generate_docs```

Also in the development environment you are allowed to play with GraphiQL IDE,
which by default is mounted at `/graphiql`.

### Authentication

Authentication is built using regular tokens saved in the separate authentication_tokens DB table.
Unfortunately, JSON Web Tokens (JWT) is not suitable for us, because we want to give the user
the opportunity at any time to invalidate his token, view and manage all of his sessions.
Tokens itself are saved using SHA256 hash function with random `salt`, which set
via `SECRET_ENCRYPTOR_KEY_SALT` environment variable.

#### Security side

You may notice, that tokens aren't securily compared and probably are vulnerable to timing attacks (`example: Attacker computes tons of hashes and stores them looking for a hash that starts with 0x00. Upon finding a plaintext with that value, send that plaintext, listen for timing on response. Do this for 255 more values until one value takes slightly longer. That's the first byte value of the hash created from the plaintext`), but...

This will almost certainly not matterm because to carry out the attack, the attacker must submit tokens whose hash value he knows. The hash value depends on the salt. Thus, unless the attacker somehow already knows the salt, this attack is not possible.

Thus, while there's indeed a possibility of such attack, it's extremely infeasible and it's not our case. The computation requirements for such attack are also enormous, and they keep grown exponentially with every bit discovered from the hash.

#### Authentication usage example

1. Call API to signUp user:

- ```curl -X POST -H "Content-Type: application/json" --data '{ "query": "mutation { signUp(email: \"test@example.com\", password: \"12345678\", passwordConfirmation: \"12345678\") { user { id email } token }}" }' localhost:3000/graphql```

- Expected response:
```{"data":{"signUp":{"user":{"id":"14","email":"test@example.com"},"token":"fPP4M97tEBnuHX3FK6K6jF32"}}}```

2. Save token and next time include its value with `X_AUTH_TOKEN` header to call all protected endpoints:
- ```curl -X POST -H "Content-Type: application/json" -H "X_AUTH_TOKEN: fPP4M97tEBnuHX3FK6K6jF32" --data '{ "query": "{ me { id email }}" }' localhost:3000/graphql```

- Expected response (with X_AUTH_TOKEN header):
```{"data":{"me":{"id":"14","email":"test@example.com"}}}```

- Expected response (without provided auth token):
```{"data":{"me":null},"errors":[{"message":"You need to authenticate to perform this action.","locations":[{"line":1,"column":3}],"path":["me"]}]}```
