class User

 attr_accessor :email, :password

	def initialize email, password
		@email = email
		@password = password
	end

	def files
		puts "those are files"
	end

end