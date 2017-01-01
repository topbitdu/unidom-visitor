module Unidom
  module Visitor

    class Engine < ::Rails::Engine

      include Unidom::Common::EngineExtension

      isolate_namespace ::Unidom::Visitor

      enable_initializer enum_enabled: true, migration_enabled: true

    end

  end
end
