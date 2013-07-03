class VisitsPerUser < ActiveRecord::Base

  def self.add_visits_per_user(short_url_id, user_id)
    new_visit = VisitsPerUser.new
    new_visit.short_url_id = short_url_id
    new_visit.user_id = user_id
    new_visit.save

  end
end