class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}




    ################## Everything passes until this custom validation -- Need help ######

    validate :title_must_include_certain_phrases, inclusion: {in: %w("Won't Believe" "Secret" "Top [number]" "Guess")}
    
    def title_must_include_certain_phrases
        if title.include?
            errors.add(:title, "must include certain phrases")
        end
    end
end

# Finally, add a custom validator to Post that ensures the title is sufficiently clickbait-y. If the title does not contain "Won't Believe", "Secret", "Top [number]", or "Guess", the validator should add a validation.