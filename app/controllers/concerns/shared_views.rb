module SharedViews
  extend ActiveSupport::Concern
  
  included do
    def self.local_prefixes
      [controller_path.sub(/^share\//, '')]
    end
  end
end
