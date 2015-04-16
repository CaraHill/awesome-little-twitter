class UpdateGravatarLinkColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :gravatar_link, :profile_image
  end
end
