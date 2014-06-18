class AddDescriptionToUploads < ActiveRecord::Migration
  def change

    change_table :uploads do |t|

      t.text :description

    #   t.attachment :med_thumb

    #   t.attachment :lg_thumb

    end
  end

#   def self.down
# # cancel this migration
#     # drop_attached_file :uploads, :sm_thumb

#     # drop_attached_file :uploads, :med_thumb

#     # drop_attached_file :uploads, :lg_thumb

#   end
end
