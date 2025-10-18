class ChangeLinkLinkToText < ActiveRecord::Migration[8.0]
  def change
    change_column :links, :link, :text
  end
end
