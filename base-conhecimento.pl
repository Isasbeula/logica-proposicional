% Base de Conhecimento
linguagem(python, desenvolvimento_web).
linguagem(java, desenvolvimento_web).
linguagem(javascript, desenvolvimento_web).
linguagem(c, desenvolvimento_sistemas).
linguagem(cpp, desenvolvimento_sistemas).
linguagem(prolog, inteligencia_artificial).
linguagem(lisp, inteligencia_artificial).

% Regras de recomendação
recomendacao(Tipo, Linguagem) :-
    linguagem(Linguagem, Tipo).

recomendacao_por_experiencia(sim, Linguagem) :-
    Linguagem = python;
    Linguagem = javascript.

recomendacao_por_experiencia(não, Linguagem) :-
    Linguagem = java;
    Linguagem = cpp;
    Linguagem = prolog.
