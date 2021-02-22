class ArchiveReader
		
	attr_accessor :type, :when_date, :when_time, :value, :cpf, :card, :owner, :store

	def initialize(str)
		@type = str[0]
		@when_time = Time.new(str[1..4],str[5..6],str[7..8],str[42..43].to_i,str[44..45].to_i,str[46..47].to_i)
		@when_date = Date.new(str[1..4].to_i,str[5..6].to_i,str[7..8].to_i)
		@value = str[9..18].to_f/100
		@cpf = str[19..29]
		@card = str[30..41]
		@owner = str[48..61]
		@store = str[62..80]
	end

end
