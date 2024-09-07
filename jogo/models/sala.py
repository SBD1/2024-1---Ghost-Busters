class Sala:
    def __init__(self, id, nome, descricao, cardinalidade_norte, cardinalidade_leste, cardinalidade_sul, cardinalidade_oeste):
        """Inicializa uma sala com id, nome, descrição e coordenadas das entradas."""
        self.id = id
        self.nome = nome
        self.descricao = descricao
        self.cardinalidade_norte = cardinalidade_norte
        self.cardinalidade_leste = cardinalidade_leste
        self.cardinalidade_sul = cardinalidade_sul
        self.cardinalidade_oeste = cardinalidade_oeste

    def __repr__(self):
        return (f"Sala(id={self.id}, nome={self.nome}, descricao={self.descricao}, "
                f"cardinalidade_norte={self.cardinalidade_norte}, cardinalidade_leste={self.cardinalidade_leste}, "
                f"cardinalidade_sul={self.cardinalidade_sul}, cardinalidade_oeste={self.cardinalidade_oeste})")
    
    def obter_entradas(self):
        """Retorna as entradas da sala em formato de dicionário."""
        return {
            "norte": self.cardinalidade_norte,
            "leste": self.cardinalidade_leste,
            "sul": self.cardinalidade_sul,
            "oeste": self.cardinalidade_oeste
        }
