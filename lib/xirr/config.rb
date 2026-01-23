module Xirr
  class Configuration
    attr_accessor :eps, :period, :iteration_limit, :precision,
                  :default_method, :fallback, :replace_for_nil,
                  :compact, :raise_exception

    def initialize
      @eps = '1.0e-6'.to_f
      @period = 365.0
      @iteration_limit = 50
      @precision = 6
      @default_method = :newton_method
      @fallback = true
      @replace_for_nil = 0.0
      @compact = true
      @raise_exception = false
    end
  end

  # Sets as constants all the default values
  EPS = '1.0e-6'.to_f
  PERIOD = 365.0
  ITERATION_LIMIT = 50
  PRECISION = 6
  DEFAULT_METHOD = :newton_method
  FALLBACK = true
  REPLACE_FOR_NIL = 0.0
  COMPACT = true
  RAISE_EXCEPTION = false

  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    alias_method :config, :configuration

    def configure
      yield(configuration)
    end
  end
end
