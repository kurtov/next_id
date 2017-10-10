class SimplePrimaryKeyWithOwner < ActiveRecord::Base
  self.table_name = "dba.simple_primary_keys"
  acts_as_next_id
end
