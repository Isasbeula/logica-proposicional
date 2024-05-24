:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- [base_de_conhecimento].  % Inclui o arquivo de base de conhecimento

% Iniciar o servidor HTTP
:- http_handler(root(recomendacao), handle_recomendacao, []).

% Definir o ponto de entrada do servidor
server(Port) :-
    http_server(http_dispatch, [port(Port)]).

% Manipulador para a requisição de recomendação
handle_recomendacao(Request) :-
    http_parameters(Request, [
        tipo(Tipo, [string]),
        experiencia(Experiencia, [optional(true), default(nenhum)])
    ]),
    findall(Linguagem, (recomendacao(Tipo, Linguagem), recomendacao_por_experiencia(Experiencia, Linguagem)), Linguagens),
    reply_json(json{tipo: Tipo, experiencia: Experiencia, linguagens: Linguagens}).

% Iniciar o servidor na porta 8080 ao carregar o arquivo
:- initialization(server(8080)).
