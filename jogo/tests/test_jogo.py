from controllers.game import Jogo
from models.jogador import Jogador
from models.sala import Sala

def test_iniciar_jogo():
    jogo = Jogo()
    resultado = jogo.iniciar()
    assert resultado == "Jogo iniciado com sucesso!"

def test_criar_jogador():
    jogo = Jogo()
    jogador = jogo.criar_jogador(nome="Egon", sala_inicial=Sala(1, "Entrada", "Uma sala de entrada"))
    
    assert isinstance(jogador, Jogador)
    assert jogador.nome == "Egon"
    assert jogador.sala_atual.nome == "Entrada"

def test_mover_jogador():
    jogo = Jogo()
    jogador = jogo.criar_jogador(nome="Arthur", sala_inicial=Sala(1, "Entrada", "Uma sala de entrada"))

    # Simula criação de uma sala ao norte
    sala_norte = Sala(2, "Sala Norte", "Uma sala ao norte", cardinalidade_sul=1)
    
    # Mover jogador para o norte
    resultado = jogo.mover_jogador(jogador, "norte")
    
    assert jogador.sala_atual.nome == "Sala Norte"
    assert resultado == "Você se moveu para a sala: Sala Norte"

def test_interagir_com_item():
    jogo = Jogo()
    jogador = jogo.criar_jogador(nome="Arthur", sala_inicial=Sala(1, "Entrada", "Uma sala de entrada"))
    
    # Simula criação de um item
    jogo.adicionar_item_sala(jogador.sala_atual, item="Moeda")

    # Jogador coleta o item
    resultado = jogo.coletar_item(jogador, "Moeda")
    
    assert "Moeda" in jogador.inventario
    assert resultado == "Você coletou: Moeda"

def test_fim_de_jogo():
    jogo = Jogo()
    jogador = jogo.criar_jogador(nome="Egon", sala_inicial=Sala(1, "Entrada", "Uma sala de entrada"))
    
    # Condições para o final do jogo (por exemplo, completou missão ou morreu)
    resultado = jogo.fim_de_jogo(jogador)
    
    assert resultado in ["Jogador venceu!", "Jogador foi derrotado!", "Jogo encerrado!"]
