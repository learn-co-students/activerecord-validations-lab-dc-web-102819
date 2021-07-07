class PostValidator < ActiveModel::Validator
    def validate(record)

        unless record.title == "You Won't Believe These True Facts" || record.title == "Secret" || record.title == "Top [0..10]" || record.title == "Guess"
            # "Secret") && record.title.match?("Top [number]", "Guess")
            record.errors[:title] << "no can do"
        end
    end
end