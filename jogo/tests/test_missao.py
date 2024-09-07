from models.missao import Missao
from models.jogador import Jogador
from models.sala import Sala

def test_criar_missao():
    # Cria uma missão com uma descrição
    missao = Missao(descricao="Encontre o amuleto na sala secreta")
    
    assert isinstance(missao, Missao)
    assert missao.descricao == "Encontre o amuleto na sala secreta"
    assert missao.completada == False

def test_progresso_missao():
    # Simula a criação do jogador e da sala
    sala_secreta = Sala(2, "Sala Secreta", "Uma sala escondida")
    jogador = Jogador(nome="Arthur", vida=100, sala_atual=sala_secreta)

    # Cria uma missão que depende do jogador encontrar a sala secreta
    missao = Missao(descricao="Encontre o amuleto na sala secreta")
    
    # Simula o progresso da missão
    missao.atualizar_progresso(jogador)

    assert missao.completada == True

def test_missao_nao_completada():
    # Simula a criação de jogador e uma sala inicial
    sala_inicial = Sala(1, "Entrada", "Uma sala de entrada")
    jogador = Jogador(nome="Arthur", vida=100, sala_atual=sala_inicial)

    # Cria uma missão que depende do jogador encontrar uma sala específica
    missao = Missao(descricao="Encontre o amuleto na sala secreta")
    
    # O jogador ainda não está na sala secreta
    missao.atualizar_progresso(jogador)

    assert missao.completada == False

def test_concluir_missao():
    # Cria uma missão
    missao = Missao(descricao="Encontre o amuleto na sala secreta")
    
    # Marca como completa
    missao.concluir()

    assert missao.completada == True
    assert missao.status() == "Missão concluída!"
