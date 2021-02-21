class Archive < ApplicationRecord
    has_many :transactions   
    mount_uploader :attachment, AttachmentUploader  

    before_validation  :set_checksum_and_lines
    
    validates :checkhsum,  uniqueness: {message: "Esse arquivo já foi enviado e processado"}

    private

    def set_checksum_and_lines
        # montando o caminho do arquivo em cache
        path = File.join Rails.root ,"public","uploads" , "tmp", self.attachment_cache
        # Criando um hash para evitar duplicidade de arquivo
        checksum = Digest::MD5.file(path).base64digest
        self.checkhsum = checksum

        # Verificando numero de linhas do arquivo
        count = 0
        File.open(path) {|f| count = f.read.count("\n")}
        self.lines = count

    end

    
end
