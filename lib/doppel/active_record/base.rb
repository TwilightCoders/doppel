module Doppel
  # == Multi-Table Inheritance
  module ActiveRecord
    module Base
      extend ActiveSupport::Concern

      included do
        scope :find_similar, -> (column, sensitivity: 2.0, count: 0, debug: false) {
          at1 = arel_table
          at2 = at1.alias
          lev = Arel::Nodes::NamedFunction.new("levenshtein", [at1[column.to_sym], at2[column.to_sym]])

          selects = [at1[Arel.star]]
          selects << lev.clone.as('lev') if debug

          select(selects).
          where(at1[primary_key].not_eq(at2[primary_key])).
          where(lev.lteq(sensitivity)).
          from([at1, at2]).
          group(at1[primary_key], at1[column.to_sym], at2[column.to_sym]).
          having(at1[primary_key].count.gt(count)).distinct(at1[Arel.star])
        }

        scope :find_exact, -> (column, count: 0) {
          find_similar(column, sensitivity: 0, count: count)
        }
      end

    end
  end
end
