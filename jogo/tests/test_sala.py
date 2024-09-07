from models.sala import Sala

def test_carregar_salas(conexao_db_teste):
    # Simulação do carregamento das salas a partir do banco de dados de teste
    cursor = conexao_db_teste.cursor()

    # Cria uma sala fictícia no banco de dados de teste
    cursor.execute("""
        INSERT INTO sala (id, nome, descricao, cardinalidade_norte, cardinalidade_leste, cardinalidade_sul, cardinalidade_oeste)
        VALUES (1, 'Entrada', 'Uma sala de entrada', NULL, NULL, NULL, NULL);
    """)
    conexao_db_teste.commit()

    # Carrega as salas usando o método
    salas = Sala.carregar_salas()

    # Verifica se a sala foi carregada corretamente
    assert len(salas) == 1
    assert salas[1].nome == 'Entrada'
    assert salas[1].descricao == 'Uma sala de entrada'
