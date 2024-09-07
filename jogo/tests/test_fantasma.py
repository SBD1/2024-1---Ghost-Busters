import pytest
from models.fantasma import Fantasma

def test_criar_fantasma():
    fantasma = Fantasma(nome='Slime', descricao_ataque='Cospe ectoplasma', habilidade='Atravessa paredes', dica='VAI LER UM LIVRO', barulho='ALSJDNAOEFNAWLDNAOVEN', dano_causado=15, item_nome='Moeda')
    
    assert fantasma.nome == 'Slime'
    assert fantasma.descricao_ataque == 'Cospe ectoplasma'
    assert fantasma.habilidade == 'Atravessa paredes'
    assert fantasma.dica == 'VAI LER UM LIVRO'
    assert fantasma.barulho == 'ALSJDNAOEFNAWLDNAOVEN'
    assert fantasma.dano_causado == 15
    assert fantasma.item_nome == 'Moeda'

def test_atacar():
    fantasma = Fantasma(nome='Slime', descricao_ataque='Cospe ectoplasma', habilidade='Atravessa paredes', dica='VAI LER UM LIVRO', barulho='ALSJDNAOEFNAWLDNAOVEN', dano_causado=15, item_nome='Moeda')
    dano = fantasma.atacar()
    
    assert dano == 15
