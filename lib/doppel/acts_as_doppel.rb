module Doppel
  module ActsAsDoppel
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def has_many_doppels(fields = [], options = {})
        options = Doppel::ActsAsDoppel.merge_default_options(options)
        other_table_name = "doppel_#{table_name}"
        table_name_key = "#{table_name}.#{primary_key}"
        other_table_name_key = "#{other_table_name}.#{primary_key}"
        fields.each do |field|
          class_eval <<-END, __FILE__, __LINE__ + 1
            scope "with_#{field}_doppels", lambda { |count = #{options[:count]}, lev = #{options[:sensitivity]}|
              select("DISTINCT #{table_name}.*")
                .where("#{table_name_key} != #{other_table_name_key}")
                .where("levenshtein(#{table_name}.#{field}, #{other_table_name}.#{field}) < \#\{lev\}")
                .from("#{table_name}, #{table_name} as #{other_table_name}")
                .group(table_name_key).having("COUNT(#{other_table_name_key}) > \#\{count\}")
            }

            def #{field}_doppels
              @#{field}_doppels ||= self.where("levenshtein(\#\{self.sanitize(#{field})\}, #{table_name}.#{field}) < 2").where.not(#{primary_key}: #{primary_key})
            end
          END
          # scope "with_#{field}_doppels", lambda { |count = options[:count], lev = options[:sensitivity]|
          #   select("DISTINCT #{table_name}.*")
          #     .where("#{table_name_key} != #{other_table_name_key}")
          #     .where("levenshtein(#{table_name}.#{field}, #{other_table_name}.#{field}) < #{lev}")
          #     .from("#{table_name}, #{table_name} as #{other_table_name}")
          #     .group(table_name_key).having("COUNT(#{other_table_name_key}) > #{count}")
          # }
        end

        # scope 'with_any_doppels', lambda { |count = options[:count], lev = options[:sensitivity]|
        #   fields.inject(self) { |query, field| query.merge(send("with_#{field}_doppels")) }
        # }

        # alias_method 'with_dopels', "with_#{fields.first}_doppels" if fields.one?
      end
    end

    def self.merge_default_options(options = {})
      {
        sensitivity: 2,
        count: 0
      }.merge(options)
    end
  end
end
