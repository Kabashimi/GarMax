class Comment < ApplicationRecord
  belongs_to :user
  has_one :article
end
