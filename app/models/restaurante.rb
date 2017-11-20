class Restaurante < ActiveRecord::Base
    validates_presence_of :nome, message: "Nome do Restataurante deverá ser preenchido"
    validates_presence_of :endereco, message: "Endereço do Restaurante deverá ser preenchido"
    validates_presence_of :especialidade, message: "Especialidade do Restaurante deve ser preenchida"
    
    validates_uniqueness_of :nome, message: "Existe restaurante com este nome"
    validates_uniqueness_of :endereco, message: "Existe restaurante com este endereco"

    validate :primeira_letra_deve_ser_maiuscula
    
    has_many :qualificacoes
    has_and_belongs_to_many :pratos
    
    has_many :comentarios, :as => :comentavel

    scope :massas, where(especialidade: 'massas')
    
private
    def primeira_letra_deve_ser_maiuscula
        errors.add(:nome, "Nome deve ser escrito em maiúscula") unless nome =~ /[A-Z].*/
    end
    


end
