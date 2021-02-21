class ArchiveReader
		
	attr_accessor :type,:when, :value, :cpf, :card, :owner, :store

	def initialize(str)
		@type = str[0]
		@when = Time.new(str[1..4],str[5..6],str[7..8],str[42..43],str[44..45],str[46..47], "+03:00")
		@value = str[9..18].to_f/100
		@cpf = str[19..29]
		@card = str[30..41]
		@owner = str[48..61]
		@store = str[62..80]
	end

end
