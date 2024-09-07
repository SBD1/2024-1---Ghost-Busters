class Fantasma:
    def __init__(self, nome, descricao_ataque, habilidade, dica, barulho, dano_causado, item_drop):
        self.nome = nome
        self.descricao_ataque = descricao_ataque
        self.habilidade = habilidade
        self.dica = dica
        self.barulho = barulho
        self.dano = dano_causado
        self.item_drop = item_drop  # Item que o fantasma deixa ao ser derrotado
        self.vida = 50  # Vida padrão do fantasma

    def atacar(self, jogador):
        """Ataca o jogador, causando dano."""
        print(f"{self.nome} ataca: {self.descricao_ataque}")
        jogador.vida -= self.dano
        print(f"{jogador.nome} sofreu {self.dano} de dano. Vida restante: {jogador.vida}")

    def habilidade_especial(self):
        """Executa a habilidade especial do fantasma."""
        print(f"{self.nome} usa a habilidade especial: {self.habilidade}")
        # Aqui pode ser implementada a lógica específica da habilidade

    def dica_do_fantasma(self):
        """Mostra a dica relacionada ao fantasma."""
        print(f"Dica do Fantasma: {self.dica}")

    def morrer(self):
        """Fantasma morre e solta o item de drop."""
        print(f"{self.nome} foi derrotado! Ele deixou o item: {self.item_drop}")
        return self.item_drop
