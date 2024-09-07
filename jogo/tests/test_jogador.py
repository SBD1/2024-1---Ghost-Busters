from models.jogador import Jogador
from models.sala import Sala

def test_salvar_e_carregar_estado_jogador(conexao_db_teste):
    # Cria uma sala fictícia
    sala = Sala(1, 'Entrada', 'Uma sala de entrada')

    # Cria um jogador
    jogador = Jogador('Peter', 100, sala)

    # Simula o salvamento do estado do jogador
    jogador.salvar_estado()

    # Modifica o jogador para ver se o estado anterior será restaurado
    jogador.vida = 50

    # Carrega o estado do jogador
    jogador.carregar_estado()

    # Verifica se o estado foi restaurado corretamente
    assert jogador.vida == 100
    assert jogador.sala_atual.nome == 'Entrada'
