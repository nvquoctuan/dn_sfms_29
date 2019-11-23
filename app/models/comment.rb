class Comment < ApplicationRecord
  PARAMS = %i(content subpitch_id user_id id_parent).freeze
  belongs_to :user
  belongs_to :subpitch

  validates :content, presence: true, length:
                      {in: Settings.size.s6..Settings.size.s1000}

  scope :last_comment, ->{order created_at: :desc}
  scope :parent_comment, ->(id){where id_parent: id}
  scope :get_parent, ->(comment_id){where("id=? and id_parent is not null", comment_id)}

  scope :not_parent, ->{where "id_parent is NULL"}
end
