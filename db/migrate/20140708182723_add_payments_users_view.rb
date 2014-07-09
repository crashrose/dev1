class AddPaymentsUsersView < ActiveRecord::Migration
  def change
create_view :payments_users,        "select distinct groups_payments.payment_id AS payment_id
,groups_users.user_id AS user_id
,concat(groups_payments.payment_id,'_',groups_users.user_id) AS id 
from (groups_payments 
join groups_users on((groups_users.group_id = groups_payments.group_id)))"	
  end
end
