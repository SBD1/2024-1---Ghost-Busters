from models.missao import Missao
from database import Database

class MissaoController:
    def __init__(self):
        self.db = Database()

    def criar_missao(self, nome, ordem, descricao, status, obrigatoriedade, sala_id, objeto_interativo_id):
        nova_missao = Missao(nome, ordem, descricao, status, obrigatoriedade, sala_id, objeto_interativo_id)
        self.db.adicionar_missao(nova_missao)

    def atualizar_missao(self, id, nome=None, ordem=None, descricao=None, status=None, obrigatoriedade=None, sala_id=None, objeto_interativo_id=None):
        missao = self.db.buscar_missao(id)
        if missao:
            missao.nome = nome if nome is not None else missao.nome
            missao.ordem = ordem if ordem is not None else missao.ordem
            missao.descricao = descricao if descricao is not None else missao.descricao
            missao.status = status if status is not None else missao.status
            missao.obrigatoriedade = obrigatoriedade if obrigatoriedade is not None else missao.obrigatoriedade
            missao.sala_id = sala_id if sala_id is not None else missao.sala_id
            missao.objeto_interativo_id = objeto_interativo_id if objeto_interativo_id is not None else missao.objeto_interativo_id
            self.db.atualizar_missao(missao)
        else:
            raise ValueError("Missão não encontrada")

    def buscar_missao(self, id):
        return self.db.buscar_missao(id)

    def listar_missoes(self):
        return self.db.listar_missoes()
