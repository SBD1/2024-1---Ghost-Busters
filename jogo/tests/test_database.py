from database.database import conectar

def test_conexao_com_banco_de_dados():
    conn = conectar()
    assert conn is not None

def test_existe_tabela_sala(conexao_db_teste):
    cursor = conexao_db_teste.cursor()
    cursor.execute("""
        SELECT EXISTS (
            SELECT FROM information_schema.tables 
            WHERE table_name = 'sala'
        );
    """)
    resultado = cursor.fetchone()
    assert resultado[0] == True