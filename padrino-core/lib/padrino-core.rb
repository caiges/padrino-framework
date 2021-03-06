require 'sinatra/base'
require 'padrino-core/support_lite' unless defined?(SupportLite)

FileSet.glob_require('padrino-core/application/*.rb', __FILE__)
FileSet.glob_require('padrino-core/*.rb', __FILE__)

# Defines our Constants
PADRINO_ENV  = ENV["PADRINO_ENV"]  ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = ENV["PADRINO_ROOT"] ||= File.dirname(Padrino.first_caller) unless defined?(PADRINO_ROOT)

module Padrino
  class ApplicationLoadError < RuntimeError # @private
  end

  class << self
    #
    # Helper method for file references.
    #
    # @param [Array<String>] args
    #   The directories to join to {PADRINO_ROOT}.
    #
    # @return [String]
    #   The absolute path.
    #
    # @example
    #   # Referencing a file in config called settings.yml
    #   Padrino.root("config", "settings.yml")
    #   # returns PADRINO_ROOT + "/config/setting.yml"
    #
    def root(*args)
      File.expand_path(File.join(PADRINO_ROOT, *args))
    end

    #
    # Helper method that return {PADRINO_ENV}.
    #
    # @return [Symbol]
    #   The Padrino Environment.
    #
    def env
      @_env ||= PADRINO_ENV.to_s.downcase.to_sym
    end

    #
    # The resulting rack builder mapping each 'mounted' application.
    #
    # @return [Padrino::Router]
    #   The router for the application.
    #
    # @raise [ApplicationLoadError]
    #   No applications were mounted.
    #
    def application
      raise ApplicationLoadError, "At least one app must be mounted!" unless Padrino.mounted_apps && Padrino.mounted_apps.any?
      router = Padrino::Router.new
      Padrino.mounted_apps.each { |app| app.map_onto(router) }

      unless middleware.empty?
        builder = Rack::Builder.new
        middleware.each { |c,a,b| builder.use(c, *a, &b) }
        builder.run(router)
        builder.to_app
      else
        router
      end
    end

    #
    # Configure Global Project Settings for mounted apps. These can be overloaded
    # in each individual app's own personal configuration. This can be used like:
    #
    # @yield []
    #   The given block will be called to configure each application.
    #
    # @example
    #   Padrino.configure_apps do
    #     enable  :sessions
    #     disable :raise_errors
    #   end
    #
    def configure_apps(&block)
      @_global_configuration = block if block_given?
    end

    #
    # Returns project-wide configuration settings defined in
    # {configure_apps} block.
    #
    def apps_configuration
      @_global_configuration
    end

    #
    # Default encoding to UTF8.
    #
    def set_encoding
      if RUBY_VERSION < '1.9'
        $KCODE='u'
      else
        Encoding.default_external = Encoding::UTF_8
        Encoding.default_internal = Encoding::UTF_8
      end
      nil
    end

    #
    # Determines whether the dependencies are locked by Bundler.
    # otherwise return nil
    #
    # @return [:locked, :unlocked, nil]
    #   Returns +:locked+ if the +Gemfile.lock+ file exists, or +:unlocked+
    #   if only the +Gemfile+ exists.
    #
    def bundle
      return :locked   if File.exist?(root('Gemfile.lock'))
      return :unlocked if File.exist?(root("Gemfile"))
    end

    #
    # A Rack::Builder object that allows to add middlewares in front of all
    # Padrino applications.
    #
    # @return [Array<Array<Class, Array, Proc>>]
    #   The middleware classes.
    #
    def middleware
      @middleware ||= []
    end

    #
    # Clears all previously configured middlewares.
    #
    def clear_middleware!
      @middleware = []
    end

    #
    # Convenience method for adding a Middleware to the whole padrino app.
    #
    # @param [Class] m
    #   The middleware class.
    #
    # @param [Array] args
    #   The arguments for the middleware.
    #
    # @yield []
    #   The given block will be passed to the initialized middleware.
    #
    def use(m, *args, &block)
      middleware << [m, args, block]
    end
  end # self
end # Padrino
