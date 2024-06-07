from flask import Flask, request, jsonify, render_template
from pyswip import Prolog

app = Flask(__name__)
prolog = Prolog()
prolog.consult('knowledge_base.pl')

def get_questions():
    questions = []
    for i in range(1, 13):
        query = f"question({i}, Question)."
        question = list(prolog.query(query))[0]['Question']
        questions.append(question)
    return questions

@app.route('/')
def index():
    questions = get_questions()
    return render_template('index.html', questions=questions)

@app.route('/submit', methods=['POST'])
def submit():
    data = request.get_json()
    answers = data['answers']
    prolog_query = f"process_answers({answers}), recommend(TechCategory, TechList)"
    result = list(prolog.query(prolog_query))
    if result:
        tech_category = result[0]['TechCategory']
        tech_list = result[0]['TechList']
    else:
        tech_category = 'none'
        tech_list = []
    return jsonify({'tech_category': tech_category, 'tech_list': tech_list})

@app.route('/result')
def result():
    tech_category = request.args.get('tech_category')
    tech_list = request.args.get('tech_list').split(',')
    return render_template('result.html', tech_category=tech_category, tech_list=tech_list)

if __name__ == '__main__':
    app.run(debug=True)
