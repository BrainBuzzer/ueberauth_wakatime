# Überauth Wakatime

> Wakatime OAuth2 strategy for Überauth.

## Installation

1. Setup your application at [Wakatime Apps](https://wakatime.com/apps).

1. Add `:ueberauth_wakatime` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:ueberauth_wakatime, "~> 0.1"}]
    end
    ```

1. Add the strategy to your applications:

    ```elixir
    def application do
      [applications: [:ueberauth_wakatime]]
    end
    ```

1. Add Wakatime to your Überauth configuration:

    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        discord: {Ueberauth.Strategy.Wakatime, []}
      ]
    ```

1.  Update your provider configuration:

    ```elixir
    config :ueberauth, Ueberauth.Strategy.Wakatime.OAuth,
      client_id: System.get_env("WAKATIME_CLIENT_ID"),
      client_secret: System.get_env("WAKATIME_CLIENT_SECRET")
    ```

1.  Include the Überauth plug in your controller:

    ```elixir
    defmodule MyApp.AuthController do
      use MyApp.Web, :controller
      plug Ueberauth
      ...
    end
    ```

1.  Create the request and callback routes if you haven't already:

    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

    And make sure to set the correct redirect URI(s) in your Wakatime application to wire up the callback.

1. Your controller needs to implement callbacks to deal with `Ueberauth.Auth` and `Ueberauth.Failure` responses.

For an example implementation see the [Überauth Example](https://github.com/ueberauth/ueberauth_example) application.

## Calling

Depending on the configured url you can initialize the request through:

    /auth/wakatime

Or with options:

    /auth/wakatime?scope=email,read_logged_time

By default the requested scope is "email". Scope can be configured either explicitly as a `scope` query value on the request path or in your configuration:

```elixir
config :ueberauth, Ueberauth,
  providers: [
    wakatime: {Ueberauth.Strategy.Wakatime, [default_scope: "email,read_logged_time"]}
  ]
```

## License

Please see [LICENSE](https://github.com/BrainBuzzer/ueberauth_wakatime/blob/master/LICENSE) for licensing details.
