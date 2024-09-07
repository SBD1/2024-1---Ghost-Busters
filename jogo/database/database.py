import psycopg2
from psycopg2 import sql

class Database:
    def __init__(self, host, database, user, password):
        """Inicializa a conexão com o banco de dados PostgreSQL."""
        try:
            self.connection = psycopg2.connect(
                host=host,
                database=database,
                user=user,
                password=password
            )
            self.cursor = self.connection.cursor()
            print("Conexão com o banco de dados estabelecida.")
        except Exception as e:
            print(f"Erro ao conectar ao banco de dados: {e}")

    def executar_comando(self, comando, valores=None):
        """Executa um comando SQL (inserção, atualização, etc.)"""
        try:
            self.cursor.execute(comando, valores)
            self.connection.commit()
        except Exception as e:
            print(f"Erro ao executar comando: {e}")
            self.connection.rollback()

    def buscar_dados(self, query, valores=None):
        """Executa uma consulta SQL e retorna os dados."""
        try:
            self.cursor.execute(query, valores)
            return self.cursor.fetchall()
        except Exception as e:
            print(f"Erro ao buscar dados: {e}")
            return []

    def fechar_conexao(self):
        """Fecha a conexão com o banco de dados."""
        try:
            self.cursor.close()
            self.connection.close()
            print("Conexão com o banco de dados encerrada.")
        except Exception as e:
            print(f"Erro ao fechar conexão: {e}")

    ### Funções para manipular dados do jogador

    def salvar_jogador(self, nome, vida, moedas_coletadas):
        """Insere ou atualiza os dados do jogador no banco de dados."""
        comando = """
        INSERT INTO jogador (nome, vida, moedas_coletadas)
        VALUES (%s, %s, %s)
        ON CONFLICT (nome) DO UPDATE 
        SET vida = EXCLUDED.vida, moedas_coletadas = EXCLUDED.moedas_coletadas
        """
        valores = (nome, vida, moedas_coletadas)
        self.executar_comando(comando, valores)

    def carregar_jogador(self, nome):
        """Carrega os dados do jogador com base no nome."""
        query = "SELECT nome, vida, moedas_coletadas FROM jogador WHERE nome = %s"
        valores = (nome,)
        resultado = self.buscar_dados(query, valores)
        if resultado:
            nome, vida, moedas_coletadas = resultado[0]
            return {"nome": nome, "vida": vida, "moedas_coletadas": moedas_coletadas}
        return None

    ### Funções para manipular inventário

    def salvar_item_inventario(self, nome_jogador, item_nome, quantidade):
        """Salva ou atualiza um item no inventário do jogador."""
        comando = """
        INSERT INTO inventario (nome_jogador, item_nome, quantidade)
        VALUES (%s, %s, %s)
        ON CONFLICT (nome_jogador, item_nome) DO UPDATE 
        SET quantidade = EXCLUDED.quantidade
        """
        valores = (nome_jogador, item_nome, quantidade)
        self.executar_comando(comando, valores)

    def carregar_inventario(self, nome_jogador):
        """Carrega o inventário do jogador."""
        query = "SELECT item_nome, quantidade FROM inventario WHERE nome_jogador = %s"
        valores = (nome_jogador,)
        resultado = self.buscar_dados(query, valores)
        inventario = []
        for item_nome, quantidade in resultado:
            inventario.append({"item": item_nome, "quantidade": quantidade})
        return inventario

    ### Funções para manipular missões

    def salvar_missao(self, nome_jogador, missao_nome, status):
        """Salva ou atualiza o progresso de uma missão do jogador."""
        comando = """
        INSERT INTO missoes (nome_jogador, missao_nome, status)
        VALUES (%s, %s, %s)
        ON CONFLICT (nome_jogador, missao_nome) DO UPDATE 
        SET status = EXCLUDED.status
        """
        valores = (nome_jogador, missao_nome, status)
        self.executar_comando(comando, valores)

    def carregar_missoes(self, nome_jogador):
        """Carrega as missões do jogador."""
        query = "SELECT missao_nome, status FROM missoes WHERE nome_jogador = %s"
        valores = (nome_jogador,)
        resultado = self.buscar_dados(query, valores)
        missoes = []
        for missao_nome, status in resultado:
            missoes.append({"missao": missao_nome, "status": status})
        return missoes

    ### Funções para manipular fantasmas derrotados

    def salvar_fantasma_derrotado(self, nome_jogador, fantasma_nome):
        """Salva o registro de um fantasma derrotado."""
        comando = """
        INSERT INTO fantasmas_derrotados (nome_jogador, fantasma_nome)
        VALUES (%s, %s)
        """
        valores = (nome_jogador, fantasma_nome)
        self.executar_comando(comando, valores)

    def carregar_fantasmas_derrotados(self, nome_jogador):
        """Carrega a lista de fantasmas derrotados pelo jogador."""
        query = "SELECT fantasma_nome FROM fantasmas_derrotados WHERE nome_jogador = %s"
        valores = (nome_jogador,)
        resultado = self.buscar_dados(query, valores)
        return [fantasma_nome[0] for fantasma_nome in resultado]

    ### Funções auxiliares

    def deletar_jogador(self, nome):
        """Remove um jogador do banco de dados."""
        comando = "DELETE FROM jogador WHERE nome = %s"
        valores = (nome,)
        self.executar_comando(comando, valores)
        print(f"Jogador {nome} removido com sucesso.")

    def deletar_inventario(self, nome_jogador):
        """Remove todos os itens do inventário de um jogador."""
        comando = "DELETE FROM inventario WHERE nome_jogador = %s"
        valores = (nome_jogador,)
        self.executar_comando(comando, valores)
        print(f"Inventário do jogador {nome_jogador} removido com sucesso.")

    def deletar_missoes(self, nome_jogador):
        """Remove todas as missões de um jogador."""
        comando = "DELETE FROM missoes WHERE nome_jogador = %s"
        valores = (nome_jogador,)
        self.executar_comando(comando, valores)
        print(f"Missões do jogador {nome_jogador} removidas com sucesso.")

    def deletar_fantasmas_derrotados(self, nome_jogador):
        """Remove todos os registros de fantasmas derrotados de um jogador."""
        comando = "DELETE FROM fantasmas_derrotados WHERE nome_jogador = %s"
        valores = (nome_jogador,)
        self.executar_comando(comando, valores)
        print(f"Fantasmas derrotados pelo jogador {nome_jogador} removidos com sucesso.")
