import os
from flask import Flask, jsonify, request
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///' + os.path.join(app.instance_path, 'vendas.db')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

# Definição do modelo
class Venda(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    item = db.Column(db.String(80), nullable=False)
    preco = db.Column(db.Float, nullable=False)
    imagem = db.Column(db.String(200), nullable=False)

# Criação do banco de dados e tabelas
with app.app_context():
    db.create_all()

@app.route('/api/vendas', methods=['POST'])
def receber_venda():
    data = request.json
    app.logger.info(f'Received data: {data}')
    if not data or 'vendas' not in data:
        return jsonify({"error": "Dados incompletos"}), 400

    vendas = data['vendas']
    for venda_data in vendas:
        if 'item' not in venda_data or 'preco' not in venda_data or 'imagem' not in venda_data:
            return jsonify({"error": "Dados incompletos"}), 400

        nova_venda = Venda(
            item=venda_data['item'],
            preco=venda_data['preco'],
            imagem=venda_data['imagem']
        )
        db.session.add(nova_venda)
    
    db.session.commit()
    return jsonify({"message": "Compra efetuada com sucesso"}), 201

@app.route('/', methods=['GET'])
def index():
    return "Bem-vindo à minha API Flask!"

@app.route('/api/items', methods=['GET'])
def get_items():
    return jsonify({"items": ["item1", "item2", "item3"]})

if __name__ == '__main__':
    app.run(debug=True)
