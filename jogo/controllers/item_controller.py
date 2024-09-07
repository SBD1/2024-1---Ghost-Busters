from models.item import Item
from database import Database

class ItemController:
    def __init__(self):
        self.db = Database()

    def criar_item(self, nome, peso, descricao, utilidade, restauracao_vida, dano, pontos_de_defesa):
        novo_item = Item(nome, peso, descricao, utilidade, restauracao_vida, dano, pontos_de_defesa)
        self.db.adicionar_item(novo_item)

    def atualizar_item(self, nome, peso=None, descricao=None, utilidade=None, restauracao_vida=None, dano=None, pontos_de_defesa=None):
        item = self.db.buscar_item(nome)
        if item:
            item.peso = peso if peso is not None else item.peso
            item.descricao = descricao if descricao is not None else item.descricao
            item.utilidade = utilidade if utilidade is not None else item.utilidade
            item.restauracao_vida = restauracao_vida if restauracao_vida is not None else item.restauracao_vida
            item.dano = dano if dano is not None else item.dano
            item.pontos_de_defesa = pontos_de_defesa if pontos_de_defesa is not None else item.pontos_de_defesa
            self.db.atualizar_item(item)
        else:
            raise ValueError("Item não encontrado")

    def buscar_item(self, nome):
        return self.db.buscar_item(nome)

    def listar_itens(self):
        return self.db.listar_itens()
