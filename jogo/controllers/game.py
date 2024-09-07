from models.jogador import Jogador
from models.item import Item
from database import Database

class Game:
    def __init__(self, db_config):
        """Inicializa o jogo com uma conexão ao banco de dados."""
        self.db = Database(**db_config)
        self.jogador = None

    def criar_jogador(self, nome, vida, moedas_coletadas):
        """Cria um novo jogador e salva no banco de dados."""
        self.jogador = Jogador(nome, vida, moedas_coletadas)
        self.db.salvar_jogador(nome, vida, moedas_coletadas)

    def carregar_jogador(self, nome):
        """Carrega um jogador existente do banco de dados."""
        dados_jogador = self.db.carregar_jogador(nome)
        if dados_jogador:
            self.jogador = Jogador(**dados_jogador)
        else:
            print("Jogador não encontrado.")

    def adicionar_item_inventario(self, item_nome, quantidade):
        """Adiciona um item ao inventário do jogador."""
        if self.jogador:
            item = Item(item_nome, quantidade)
            self.db.salvar_item_inventario(self.jogador.nome, item.nome, item.quantidade)
        else:
            print("Nenhum jogador carregado.")

    def realizar_missao(self, missao_nome):
        """Realiza uma missão e atualiza o status no banco de dados."""
        if self.jogador:
            self.db.salvar_missao(self.jogador.nome, missao_nome, "Concluída")
        else:
            print("Nenhum jogador carregado.")

    def derrotar_fantasma(self, fantasma_nome):
        """Registra que um fantasma foi derrotado."""
        if self.jogador:
            self.db.salvar_fantasma_derrotado(self.jogador.nome, fantasma_nome)
        else:
            print("Nenhum jogador carregado.")

    def exibir_inventario(self):
        """Exibe o inventário do jogador."""
        if self.jogador:
            inventario = self.db.carregar_inventario(self.jogador.nome)
            for item in inventario:
                print(f"Item: {item['item']}, Quantidade: {item['quantidade']}")
        else:
            print("Nenhum jogador carregado.")

    def exibir_missoes(self):
        """Exibe as missões do jogador."""
        if self.jogador:
            missoes = self.db.carregar_missoes(self.jogador.nome)
            for missao in missoes:
                print(f"Missão: {missao['missao']}, Status: {missao['status']}")
        else:
            print("Nenhum jogador carregado.")

    def exibir_fantasmas_derrotados(self):
        """Exibe os fantasmas derrotados pelo jogador."""
        if self.jogador:
            fantasmas = self.db.carregar_fantasmas_derrotados(self.jogador.nome)
            for fantasma in fantasmas:
                print(f"Fantasma derrotado: {fantasma}")
        else:
            print("Nenhum jogador carregado.")

    def encerrar_jogo(self):
        """Fecha a conexão com o banco de dados ao encerrar o jogo."""
        self.db.fechar_conexao()
