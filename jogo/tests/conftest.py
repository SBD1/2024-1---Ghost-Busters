import pytest
import psycopg2

@pytest.fixture(scope='module')
def conexao_db_teste():
    # Configura uma conexão para um banco de teste
    conn = psycopg2.connect(
        dbname='teste_banco',
        user='usuario',
        password='senha',
        host='localhost',
        port='5432'
    )
    yield conn
    conn.close()
