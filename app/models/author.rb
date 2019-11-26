class Author < ActiveRecord::Base
    validates :name, presence: true
    validates :name, uniqueness: true
    validates :phone_number, length: {is: 10}
end

Author.create(name: "John Doe").valid?
Author.create(name: nil).valid?
