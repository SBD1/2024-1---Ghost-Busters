class Missao:
    def __init__(self, nome, descricao, status="incompleta", obrigatoriedade=False):
        """Inicializa uma missão com nome, descrição, status e obrigatoriedade."""
        self.nome = nome
        self.descricao = descricao
        self.status = status
        self.obrigatoriedade = obrigatoriedade

    def __repr__(self):
        return f"Missao(nome={self.nome}, descricao={self.descricao}, status={self.status}, obrigatoriedade={self.obrigatoriedade})"

    def concluir(self):
        """Marca a missão como concluída."""
        self.status = "concluída"

    def atualizar_status(self, status):
        """Atualiza o status da missão."""
        self.status = status
