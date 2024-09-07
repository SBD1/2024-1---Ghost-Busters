from models.jogador import Jogador
from models.fantasma import Fantasma
from controllers.combate import Combate

def test_combate_basico():
    # Cria um jogador e um fantasma fictício
    jogador = Jogador('Peter', 100, None)
    fantasma = Fantasma('Slimer', 70)

    # Inicia o combate
    resultado = Combate(jogador, fantasma).iniciar()

    # Verifica se o resultado é esperado
    assert resultado in ['jogador venceu', 'fantasma venceu']
