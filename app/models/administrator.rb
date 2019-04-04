class Administrator < ApplicationRecord
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable

  validates :email,
            uniqueness: true,
            format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }
end
