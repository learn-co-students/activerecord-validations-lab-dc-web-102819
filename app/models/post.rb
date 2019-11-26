class Post < ActiveRecord::Base
	validate :title_is_clickbait
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
	

	def title_is_clickbait
		if self.title == nil
			return false
		elsif self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Guess")
		else
			errors.add(:title, "Not clickbait-y enough")
		end
	end


	# def inc?(word)
	# 	self.title.include?(word)
	# end
end
