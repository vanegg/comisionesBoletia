class User < ApplicationRecord

	before_save   :downcase_email

	has_many	:events
	has_one		:commission

	validates	:name, 		presence: true, length: { maximum: 50 }

	validates	:address, presence: true

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, 	presence: true, length: { maximum: 255 },
                    	format: { with: VALID_EMAIL_REGEX },
                    	uniqueness: { case_sensitive: false }

  validates :phone,		presence: true,
  										length: {maximum: 20}, if: :its_number?

  VALID_ACCOUNT_REGEX = /\d{4}-\d{4}-\d{4}-\d{4}/

  validates :account, presence: true,
  										format: {with: VALID_ACCOUNT_REGEX}
    private

	    # Converts email to all lower-case.
	    def downcase_email
	      self.email = email.downcase
	    end

	    def its_number?
	    	if self.phone != nil
	    		self.phone.to_i == self.phone.gsub(/\D/,'').to_i
	    	end
	    end

end
