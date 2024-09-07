class Personagem:
    def __init__(self, nome, vida, descricao_fisica):
        """Inicializa um personagem com nome, vida e descrição física."""
        self.nome = nome
        self.vida = vida
        self.descricao_fisica = descricao_fisica

    def __repr__(self):
        return f"Personagem(nome={self.nome}, vida={self.vida}, descricao_fisica={self.descricao_fisica})"

    def receber_dano(self, dano):
        """Reduz a vida do personagem com base no dano recebido."""
        self.vida -= dano
        if self.vida < 0:
            self.vida = 0
