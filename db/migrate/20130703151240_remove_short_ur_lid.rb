class RemoveShortUrLid < ActiveRecord::Migration
  def change
    remove_column :long_urls, :short_url_id
  end
end
