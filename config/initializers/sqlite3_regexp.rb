require 'active_record/connection_adapters/sqlite3_adapter'

class ActiveRecord::ConnectionAdapters::SQLite3Adapter
  def initialize(db, logger, *args)
    #
    # Disagreement about initialize contract between 
    # /usr/local/bundle/gems/activerecord-7.0.0/lib/active_record/connection_adapters/sqlite3_adapter.rb:40:in `new'
    # and
    # /usr/local/bundle/gems/activerecord-7.0.0/lib/active_record/connection_adapters/abstract_adapter.rb:82:in `initialize'
    #

    if args.length == 1
      config = args.first
    elsif args.length == 2
      config = args.second
    end

    ####

    super(db, logger, config)

    ## SELECT "dishes".* FROM "dishes" WHERE (name REGEXP 'pattern')

    db.create_function('regexp', 2) do |func, pattern, expression|
      regexp = Regexp.new(pattern.to_s, Regexp::IGNORECASE)
      if expression.to_s.match(regexp)
        func.result = 1
      else
        func.result = 0
      end
    end
  end
end
