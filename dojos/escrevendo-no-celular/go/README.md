# DOJO 2019-01-29 13:36:49

## Howto

### How to run the tests:
  - `make test`

## Problema: [Escrevendo nocelular](http://dojopuzzles.com/problemas/exibe/escrevendo-no-celular/)

Um dos serviços mais utilizados pelos usuários de aparelhos celulares são os SMS (Short Message Service), que permite o envio de mensagens curtas (até 255 caracteres em redes GSM e 160 caracteres em redes CDMA).

Para digitar uma mensagem em um aparelho que não possui um teclado QWERTY embutido é necessário fazer algumas combinações das 10 teclas numéricas do aparelho para conseguir digitar. Cada número é associado a um conjunto de letras como a seguir:

Letras  ->  Número
ABC    ->  2
DEF    ->  3
GHI    ->  4
JKL    ->  5
MNO    ->  6
PQRS    ->  7
TUV    ->  8
WXYZ   ->  9
Espaço -> 0

Desenvolva um programa que, dada uma mensagem de texto limitada a 255 caracteres, retorne a seqüência de números que precisa ser digitada. Uma pausa, para ser possível obter duas letras referenciadas pelo mesmo número, deve ser indicada como `_.`

Por exemplo, para digitar `SEMPRE ACESSO O DOJOPUZZLES`, você precisa digitar:

`77773367_7773302_222337777_777766606660366656667889999_9999555337777`

## Retro

#### O que foi bom

- O problema escolhido foi interessante
- Conseguimos que todos os participantes fossem pilotos pelo menos uma vez
- Conseguimos resolver o problema em 1h10~1h20
- Conseguimos pensar em uma maneira de estender o problema
- Começamos rápido, não perdemos tempo
- Rotacionar as cadeiras ao invés de pausar para que as pessoas trocassem de cadeira foi interessante e poupou tempo

#### O que podemos melhorar

- Muitas vezes as situações eram discutidas fora da dupla piloto/copiloto
- Não seguimos 100% as regras do dojo
- Como rodamos a mesa, as duplas se repetiram em um segundo momento - poderíamos ter misturado para mudar os pares
- Canal do slack está meio floodado, o ideal seria usar threads e usar para votações de linguagens e problemas
- Pode ser interessante incluir os estagiários com vagas garantidas (2 por dojo, por exemplo)
