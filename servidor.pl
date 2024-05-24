:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_parameters)).
:- [base_de_conhecimento].  % Inclui o arquivo de base de conhecimento

% Iniciar o servidor HTTP
:- http_handler(root(recomendacao), handle_recomendacao, []).

