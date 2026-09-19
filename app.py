# Importando as dependências
from flask import Flask, render_template

# Inicializar variáveis e componentes

# Nome do aplicativo (Site da Web) → global
sitename = "My Flask"

# Inicializa o plaicativo Flask (HTTP)
app = Flask(__name__)


# Rota da página inicial (rota raiz ou root)
@app.route("/")
def index():
    return render_template(
        "home.html",
        sitename=sitename
    )

# Uma rota bem simples


@app.route("/about")
def about():
    return render_template(
        'about.html',
        sitename=sitename
    )


# Ativa o modo DEBUG e o main loop no localhost
if __name__ == "__main__":
    app.run(debug=True)
