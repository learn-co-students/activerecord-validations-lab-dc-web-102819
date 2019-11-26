class PostValidator < ActiveModel::Validator

    def validate(record) 
        if record.title    
            unless record.title.match?(/Won't Believe/ ||/Secret/ || /Guess/ || /Top [0-9]*/)
                record.errors[:title] << "Your title is not sufficiently clickbaity."
            end
        end
    end
end