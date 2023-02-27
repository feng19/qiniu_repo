import Config

config :qiniu, Qiniu,
  up_host: "http://up-z2.qiniu.com",
  rs_host: "http://rs-z2.qiniu.com",
  rsf_host: "http://rsf-z2.qbox.me",
  io_host: "http://iovip-z2.qbox.me",
  access_key: "access_key",
  secret_key: "secret_key"

config :mini_repo,
  port: 4000,
  url: "http://localhost:4000"

store = {MiniRepo.Store.Qiniu, root: "data"}

config :mini_repo,
  auth_token: "secret--------------------sdfsdfsdfsfsf",
  repositories: [
    hexpm_mirror: [
      store: store,
      upstream_name: "hexpm",
      upstream_url: "https://repo.hex.pm",

      # 5min
      sync_interval: 5 * 60 * 1000,
      sync_opts: [max_concurrency: 10, timeout: 10_000],

      # https://hex.pm/docs/public_keys
      upstream_public_key: """
      -----BEGIN PUBLIC KEY-----
      MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApqREcFDt5vV21JVe2QNB
      Edvzk6w36aNFhVGWN5toNJRjRJ6m4hIuG4KaXtDWVLjnvct6MYMfqhC79HAGwyF+
      IqR6Q6a5bbFSsImgBJwz1oadoVKD6ZNetAuCIK84cjMrEFRkELtEIPNHblCzUkkM
      3rS9+DPlnfG8hBvGi6tvQIuZmXGCxF/73hU0/MyGhbmEjIKRtG6b0sJYKelRLTPW
      XgK7s5pESgiwf2YC/2MGDXjAJfpfCd0RpLdvd4eRiXtVlE9qO9bND94E7PgQ/xqZ
      J1i2xWFndWa6nfFnRxZmCStCOZWYYPlaxr+FZceFbpMwzTNs4g3d4tLNUcbKAIH4
      0wIDAQAB
      -----END PUBLIC KEY-----
      """
    ]
  ]

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: []

config :logger,
  level: :info,
  backends: [
    :console,
    {LoggerFileBackend, :file_info},
    {LoggerFileBackend, :file_error}
  ]

file_format = "$date $time $metadata[$level] $message\n"
rotate = %{max_bytes: 20 * 1024 * 1024, keep: 5}

config :logger, :file_info,
  path: "log/info.log",
  metadata: [:module, :line],
  format: file_format,
  rotate: rotate,
  level: :info

config :logger, :file_error,
  path: "log/error.log",
  metadata: [:module, :line],
  format: file_format,
  rotate: rotate,
  level: :error
