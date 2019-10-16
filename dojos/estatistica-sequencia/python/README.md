# DOJO 2019-01-03 19:06:54

[![Python Version](https://img.shields.io/badge/python-3.7.2-green.svg)](https://img.shields.io/badge/python-3.7.2-green.svg)


## How to run :rocket:

  - `make docker-start`
  - `make setup`
  - `make test`


## Problema

#### Problema 1

Sua tarefa é processar uma seqüência de números inteiros para determinar as seguintes estatísticas:

- Valor mínimo
- Valor máximo
- Número de elementos na seqüência
- Valor médio


Por exemplo para uma seqüência de números "6, 9, 15, -2, 92, 11", temos como saída:

- Valor mínimo: -2
- Valor máximo: 92
- Número de elementos na seqüência: 6
- Valor médio: 18.1666666


#### Problema 2

Quando se lista o nome de autores de livros, artigos e outras publicações é comum que se apresente o nome do autor ou dos autores da seguinte forma: sobrenome do autor em letras maiúsculas, seguido de uma vírgula e da primeira parte do nome apenas com as iniciais maiúsculas.

Por exemplo:

- SILVA, Joao
- COELHO, Paulo
- ARAUJO, Celso de


Seu desafio é fazer um programa que leia um número inteiro correspondendo ao número de nomes que será fornecido, e, a seguir, leia estes nomes (que podem estar em qualquer tipo de letra) e imprima a versão formatada no estilo exemplificado acima.

As seguintes regras devem ser seguidas nesta formatação:

- o sobrenome será igual a última parte do nome e deve ser apresentado em letras maiúsculas;
- se houver apenas uma parte no nome, ela deve ser apresentada em letras maiúsculas (sem vírgula): se a entrada for “ Guimaraes” , a saída deve ser “ GUIMARAES”;
- se a última parte do nome for igual a "FILHO", "FILHA", "NETO", "NETA", "SOBRINHO", "SOBRINHA" ou "JUNIOR" e houver duas ou mais partes antes, a penúltima parte fará parte do sobrenome. Assim: se a entrada for "Joao Silva Neto", a saída deve ser "SILVA NETO, Joao" ; se a entrada for "Joao Neto" , a saída deve ser "NETO, Joao";
- as partes do nome que não fazem parte do sobrenome devem ser impressas com a inicial maiúscula e com as demais letras minúsculas;
- "da", "de", "do", "das", "dos" não fazem parte do sobrenome e não iniciam por letra maiúscula.


## Retro

#### O que aprendemos hoje?

- Formatação nova de strings em Python
- isinstance passando tupla de tipos
- // para divisão com resultado inteiro
- Coisas em geral em Python (Tinham pessoas que nunca tinha programado em Python)
- 7 pessoas no máximo por encontro

#### Bom

- Número de pessoas
- Formato
- Periodo (7 min)

#### Pode melhorar

- Seguir mais a regra de só piloto e copiloto se comunicarem
- "Plateia" aguardar mais para dar ideias
- 2 horas é muito tempo, fomos perdendo o foco
