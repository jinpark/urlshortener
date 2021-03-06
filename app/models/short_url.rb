class ShortURL < ActiveRecord::Base
  belongs_to :long_urls
  belongs_to :users

  validates :short_url, :presence => true

  #validate :url_time


  def self.add_url(short_url, long_url_id, user_id)
    s = ShortURL.new
    s.short_url = short_url
    s.long_url_id = long_url_id
    s.user_id = user_id
    s.save!
    s
  end

  def update_url(long_url_id)
    # self.short_url = short_url unless options['short_url'].nil?
 #    self.long_url_id = long_url_id unless options['long_url_id'].nil?
 #    self.user_id = user_id unless options['user_id'].nil?

    self.long_url_id = long_url_id
    self.save!
  end

  def self.find_url(shortened)
    LongURL.find_by_id(ShortURL.find_by_short_url(shortened).long_url_id).long_url
  end

  # def url_time
  #   user_id = @id
  #   submitted_url_count = VisitsPerUser.find(:all,
  #     :conditions => ['visits_per_users.created_at > ? AND user_id = ?',
  #     1.minutes.ago, user_id]).length
  #
  #   if submitted_url_count > 5
  #     user.errors[:user] << 'STOP SPAMMING'
  #   end
  #
  # end


end