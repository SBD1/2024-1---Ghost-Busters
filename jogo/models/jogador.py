class Jogador:
    def __init__(self, nome, vida, moedas_coletadas):
        """Inicializa um jogador com nome, vida e moedas coletadas."""
        self.nome = nome
        self.vida = vida
        self.moedas_coletadas = moedas_coletadas

    def __repr__(self):
        return f"Jogador(nome={self.nome}, vida={self.vida}, moedas_coletadas={self.moedas_coletadas})"

    def receber_dano(self, dano):
        """Reduz a vida do jogador com base no dano recebido."""
        self.vida -= dano
        if self.vida < 0:
            self.vida = 0

    def ganhar_moedas(self, quantidade):
        """Aumenta a quantidade de moedas coletadas do jogador."""
        self.moedas_coletadas += quantidade
