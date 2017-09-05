class Picture < ApplicationRecord

  def self.newest_first
   Picture.order("created_at DESC")
 end

 def self.most_recent_five
   Picture.newest_first.limit(5)
 end

 def self.created_before(time)
   Picture.where("created_at < ?", time)
 end

 def self.created_in_year(year)
   year_start = Date.parse("#{year}-01-01")
   year_end = Date.parse("#{year}-12-31")
   Picture.where("created_at >= ? AND created_at <= ?", year_start, year_end)
 end

end
