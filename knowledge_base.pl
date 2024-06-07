% Base de conhecimento de tecnologias recomendadas
technology(front_end, ["HTML", "CSS", "JavaScript", "React", "Vue.js", "Angular", "Svelte", "Bootstrap", "Tailwind CSS", "TypeScript"]).
technology(back_end, ["Node.js", "Python", "Java", "C#", "Ruby on Rails", "Django", "Flask", "Spring", "Express.js", "PHP"]).
technology(data, ["SQL", "Python", "R", "Pandas", "NumPy", "Matplotlib", "TensorFlow", "Keras", "PyTorch", "Hadoop"]).

question(1, 'Você gosta de design gráfico?').
question(2, 'Você prefere criar interfaces de usuário?').
question(3, 'Você gosta de criar websites?').
question(4, 'Você gosta de analisar dados?').
question(5, 'Você prefere trabalhar com bancos de dados?').
question(6, 'Você gosta de desenvolver algoritmos complexos?').
question(7, 'Você prefere desenvolver aplicativos móveis?').
question(8, 'Você gosta de trabalhar com inteligência artificial?').
question(9, 'Você prefere criar jogos?').
question(10, 'Você gosta de trabalhar com redes de computadores?').
question(11, 'Você prefere trabalhar com sistemas embarcados?').
question(12, 'Você gosta de trabalhar com automação?').

process_answers([A1, A2, A3, A4, A5, A6, A7, A8, A9, A10, A11, A12]) :-
    retractall(answer(_, _)), % Clear previous answers
    assert(answer(1, A1)),
    assert(answer(2, A2)),
    assert(answer(3, A3)),
    assert(answer(4, A4)),
    assert(answer(5, A5)),
    assert(answer(6, A6)),
    assert(answer(7, A7)),
    assert(answer(8, A8)),
    assert(answer(9, A9)),
    assert(answer(10, A10)),
    assert(answer(11, A11)),
    assert(answer(12, A12)).

recommend(TechCategory, TechList) :-
    technology(TechCategory, TechList),
    check_answers(TechCategory).

check_answers(front_end) :-
    (answer(1, yes); answer(2, yes); answer(3, yes)).

check_answers(back_end) :-
    (answer(4, yes); answer(5, yes); answer(6, yes)).

check_answers(data) :-
    (answer(7, yes); answer(8, yes); answer(9, yes)).
