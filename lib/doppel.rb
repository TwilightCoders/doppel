require 'doppel/acts_as_doppel'

module Doppel
end

ActiveRecord::Base.send :include, Doppel::ActsAsDoppel
