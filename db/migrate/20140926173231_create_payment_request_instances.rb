class CreatePaymentRequestInstances < ActiveRecord::Migration
    def up
      self.connection.execute %Q( CREATE OR REPLACE VIEW payment_request_instances AS
SELECT DISTINCT groups_payment_requests.payment_request_id AS payment_request_id,
                groups_users.user_id AS user_id,
                CONCAT(groups_payment_requests.payment_request_id, '_', groups_users.user_id) AS id,
                sum(CASE WHEN payment_transactions.status = 'VERIFIED' THEN payment_transactions.amount ELSE 0 END) AS sum_verified,
                sum(CASE WHEN payment_transactions.status = 'PENDING VERIFICATION' THEN payment_transactions.amount ELSE 0 END) AS sum_pending_verification,
                sum(CASE WHEN payment_transactions.status = 'SUBMITTED' THEN payment_transactions.amount ELSE 0 END) AS sum_submitted,
                sum(CASE WHEN payment_transactions.status = 'ADDRESSED' THEN payment_transactions.amount ELSE 0 END) AS sum_addressed,
                count(payment_transactions.id) AS total_transactions
FROM groups_payment_requests
INNER JOIN groups_users ON groups_users.group_id = groups_payment_requests.group_id
LEFT OUTER JOIN payment_transactions ON payment_transactions.payment_request_id = groups_payment_requests.payment_request_id
AND payment_transactions.user_id = groups_users.user_id
GROUP BY groups_payment_requests.payment_request_id,
         groups_users.user_id
          )
self.connection.execute "DROP VIEW IF EXISTS payments_users;"
    end

    def down
      self.connection.execute "DROP VIEW IF EXISTS payment_request_instance;"
    end
end
