class Task < ApplicationRecord
    validates :content, presence: true, length: {maximum: 255}
    validates :status, presence: true, inclusion: { in: %w(未着手 進行中 完了 完了と見せかけて放棄) }
    validates :user_id, presence: true
    
    belongs_to :user

end
