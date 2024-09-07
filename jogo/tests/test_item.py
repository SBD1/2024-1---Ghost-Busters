import pytest
from models.item import Item

def test_criar_item():
    item = Item(nome='Twinkie', peso=1, descricao='Bolinhos de esponja amarela', utilidade='Comida', restauracao_vida=10, dano=None, pontos_de_defesa=None)
    
    assert item.nome == 'Twinkie'
    assert item.peso == 1
    assert item.descricao == 'Bolinhos de esponja amarela'
    assert item.utilidade == 'Comida'
    assert item.restauracao_vida == 10
    assert item.dano is None
    assert item.pontos_de_defesa is None

def test_usar_item():
    item = Item(nome='Twinkie', peso=1, descricao='Bolinhos de esponja amarela', utilidade='Comida', restauracao_vida=10, dano=None, pontos_de_defesa=None)
    resultado = item.usar()
    
    assert resultado == 'Você usou um Twinkie e restaurou 10 pontos de vida'
