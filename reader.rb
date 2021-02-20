txt_file = ("CNAB.txt")


def get_tipo(str)
	return str[0]
end

def get_data(str)
	return str[1..8]
end

def get_valor(str)
	return str[9..18].to_f/100
end

def get_cpf(str)
	return str[19..29] 
end

def get_cartao(str)
	return str[30..41]
end

def get_hora(str)
	#return str[42..47]
	Time.new(str[1..4],str[5..6],str[7..8],str[42..43],str[44..45],str[46..47], "+03:00")
	#Time.new(1993, 02, 24, 12, 0, 0, "+09:00")
end

def get_dono(str)
	return str[48..61]
end

def get_loja(str)
	return str[62..80]
end


File.foreach(txt_file) {
 |line| 
	 puts get_dono line
	 puts get_cpf line
	 puts get_cartao line
	 puts get_loja line
 }


rails g  model type_transaction_id:integer store_id:integer value:float card:string 