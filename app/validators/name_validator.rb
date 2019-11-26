class NameValidator < ActiveModel::Validations

    def validate(record)
        unless record.title.include? ("Won't Believe" "Secret" "Top [number]"  "Guess")
            record.error[:title] << "This title is not a clickbait-y enough"
        end
    end

end