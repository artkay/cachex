defmodule Cachex.Cache do
  @moduledoc false
  # Main struct module for a Cachex cache instance.
  #
  # This represents the state being passed around when dealing with a cache. Internally
  # all calls will use an instance of this cache, even if the main API is dealing with
  # only the name of the cache (to make it convenient for callers).

  # import records
  import Cachex.Spec

  # our opaque type
  @opaque t :: %__MODULE__{ }

  # internal state struct
  defstruct [
    name: nil,              # the name of the cache
    commands: %{},          # any custom commands attached to the cache
    default_ttl: nil,       # any default ttl values to use
    fallback: fallback(),   # the default fallback implementation
    hooks: hooks(),         # any hooks to attach to the cache
    limit: limit(),         # any limit to apply to the cache
    ode: true,              # whether we enable on-demand expiration
    transactions: false,    # whether to enable transactions
    ttl_interval: nil       # the ttl check interval
  ]
end
