class AddEventUserViewToSchema < ActiveRecord::Migration
    def up
      self.connection.execute %Q( CREATE OR REPLACE VIEW event_users AS    
          SELECT DISTINCT
                 event_groups.event_id AS event_id,
                 groups_users.user_id AS user_id,
                 CONCAT(event_groups.event_id, '_', groups_users.user_id) AS event_user
             FROM event_groups
             	INNER JOIN groups_users ON groups_users.group_id = event_groups.group_id
          )
    end

    def down
      self.connection.execute "DROP VIEW IF EXISTS event_users;"
    end

end
