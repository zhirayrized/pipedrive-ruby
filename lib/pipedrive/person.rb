module Pipedrive
  class Person < Base

    class << self
      def find_or_create_by_email(email, opts={})
        find_by_name(email, :search_by_email => 1, :org_id => opts[:org_id]).first || create(opts.merge(:email => email))
      end

      def find_or_create_by_name(name, opts={})
        find_by_name(name, :org_id => opts[:org_id]).first || create(opts.merge(:name => name))
      end
    end

    def deals()
      Deal.all(get "#{resource_path}/#{id}/deals", :everyone => 1)
    end
  end
end
