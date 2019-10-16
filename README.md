# DOJO-POA

> Repositório para amarzenamento dos códigos criados em Dojos realizados na Globo.com de Porto Alegre


#### Manifesto

1. O dojo tem duração de 1h30.
2. Uma dupla fica responsável pelo código. Uma pessoa coda e a outra auxilia (Piloto e copiloto).
3. A dupla rotaciona a cada 7 minutos. O copiloto vira piloto e outra pessoa entra como copiloto.
4. No começo é acordado se apenas a dupla opina no código, ou se os demais também podem.
5. Ao final há uma retrospectiva para levantar os pontos positivos e negativos do dojo, e definir os próximos organizadores.

#### Agenda dos encontros

> As tecnologias utilizadas devem ser definidas antes do Dojo. Um participante deve se responsabilizar por montar o ambiente necessário para a execução do código para as tecnologias definidas. O repositório provê uma série de task para auxiliar o setup e gerar pastas consistentes de problemas (`make help`)

> O problema deve ser votado antes do dojo. A divulgação deve acontecer apenas na hora do dojo.

	- Resolução do problema [55 min]
	- Retrospectiva [5 min]

#### Formatos

	- `Randori`: Todos participam. É proposto um problema a ser resolvido e a programação é realizada em apenas uma máquina, por pares. Para esse formato é imprescindível a utilização de `TDD` e `baby steps`.

	- `Kake`: Semelhante ao Randori, porém há várias duplas trabalhando simultaneamente. A cada turno as duplas são trocadas, promovendo a integração entre todos os participantes do evento. Nesse formato um conhecimento mais avançado dos participantes é necessário.

	- `Kata`: Nesse formato existe a figura do apresentador. Ele deve demonstrar uma solução pronta, previamente desenvolvida.

#### Setup de novos problemas (se a linguagem tem setup)

`make language='linguagem' url='http://dojopuzzles.com/problemas/exibe/{problem}/' [problem='Nome do Problema']`

Ex: `make language='linguagem' url='http://dojopuzzles.com/problemas/exibe/jokenpo/'`

or

Ex: `make language='linguagem' problem='Nome do Problema'`

#### Setup de novos problemas (quando a linguagem não tem setup)
`make setup url='http://dojopuzzles.com/problemas/exibe/{problem}/' [problem='Nome do Problema']`

Ex: `make setup url='http://dojopuzzles.com/problemas/exibe/jokenpo/'`

or

Ex: `make setup problem='Nome do Problema'`

#### Precisa de ajusta com as tasks?
`make help`

#### Onde encontrar os problemas para resolver

	- http://dojopuzzles.com/
	- https://exercism.io/
	- http://br.spoj.com/
	- https://projecteuler.net/
	- http://codekata.com/
	- http://codegolf.stackexchange.com/
	- https://www.codechef.com/
	- http://rubyquiz.com/
	- https://www.urionlinejudge.com.br/
