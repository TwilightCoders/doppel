require 'rails/railtie'

module Doppel
  class Railtie < Rails::Railtie
    initializer 'doppel.load' do |_app|
      Doppel.logger.debug "active_record-mti.load"
      ActiveSupport.on_load(:active_record) do
        Doppel.load
      end
    end
  end
end

