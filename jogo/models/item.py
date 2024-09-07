class Item:
    def __init__(self, nome, quantidade):
        """Inicializa um item com nome e quantidade."""
        self.nome = nome
        self.quantidade = quantidade

    def __repr__(self):
        return f"Item(nome={self.nome}, quantidade={self.quantidade})"
