class Question < ApplicationRecord
    belongs_to :question_type
    belongs_to :survey
end
