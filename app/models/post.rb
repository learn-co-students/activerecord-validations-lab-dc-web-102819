class Post < ActiveRecord::Base
	validates :title, presence: :true
	validates :content, length: { minimum: 250, maximum: 500 }
	validates :summary, length: { maximum: 250, minimum: 0 }
	validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
	# syntax the same as:
	# validates :category, inclusion: { in: ["Fiction", "Non-Fiction"]}
	validate :is_clickbait?

	SPAM_FILTER = [/Won't Believe/,/Secret/,/Top [1-9]/,/Guess/]

	# def is_clickbait?
	# 	# if Post.include?(SPAM_FILTER)
	# 		# binding.pry
	# 	# if SPAM_FILTER.present?

	# 	SPAM_FILTER.each do |regex|			
	# 		if self.title.match(regex)
	# 			errors.add(:title, "Sorry, this looks like clickbait")
	# 			# binding.pry
	# 		end
	# 	end
	# end


end