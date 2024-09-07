import random

class Combate:
    def __init__(self, jogador, inimigo):
        self.jogador = jogador
        self.inimigo = inimigo

    def atacar(self, atacante, defensor):
        """Simula um ataque entre o atacante e o defensor."""
        dano = max(0, atacante.dano - defensor.defesa)  # Calcula o dano com base na defesa do defensor
        defensor.vida -= dano
        print(f"{atacante.nome} atacou {defensor.nome} e causou {dano} de dano!")
        print(f"{defensor.nome} tem {defensor.vida} de vida restante.")
        return defensor.vida <= 0  # Retorna True se o defensor foi derrotado

    def iniciar_combate(self):
        """Inicia o combate até que um dos dois seja derrotado."""
        while self.jogador.vida > 0 and self.inimigo.vida > 0:
            print(f"\n--- Turno do Jogador: {self.jogador.nome} ---")
            if self.atacar(self.jogador, self.inimigo):
                print(f"{self.inimigo.nome} foi derrotado!")
                return "Vitória do Jogador"

            print(f"\n--- Turno do Inimigo: {self.inimigo.nome} ---")
            if self.atacar(self.inimigo, self.jogador):
                print(f"{self.jogador.nome} foi derrotado!")
                return "Derrota do Jogador"

        return "Combate Encerrado"
