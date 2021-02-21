class Archive 
    txt_file = ("CNAB.txt")


def get_tipo(str)
	 str[0]
end

def get_data(str)
	 str[1..8]
end

def get_valor(str)
	 str[9..18].to_f/100
end

def get_cpf(str)
	 str[19..29] 
end

def get_cartao(str)
	 str[30..41]
end

def get_hora(str)
	#return str[42..47]
	Time.new(str[1..4],str[5..6],str[7..8],str[42..43],str[44..45],str[46..47], "+03:00")
	#Time.new(1993, 02, 24, 12, 0, 0, "+09:00")
end

def get_dono(str)
	 str[48..61]
end

def get_loja(str)
	reurn str[62..80]
end


File.foreach(txt_file) {
 |line| 
	 puts get_dono line
	 puts get_cpf line
	 puts get_cartao line
	 puts get_loja line
 }

end
