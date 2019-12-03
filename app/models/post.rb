class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: { minimum: 250, maximum: 500 }
	validates :summary, length: { maximum: 250, minimum: 0 }
	validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
	validate :is_clickbait?

	# SPAM_FILTER = ["Won't Believe","Secret","Top","Guess"]
	SPAM_FILTER = [/Won't Believe/i,/Secret/i,/Top [1-9]/i,/Guess/i]


	def is_clickbait?
		if 
			SPAM_FILTER.none? do |content|
				# self.title.downcase.include?(content.downcase)
				content.match(self.title)
			end
			
			errors.add(:title, "must be clickbait")
		end
	end


end