# DOJO-TEMPLATE

> This repo is a dojo-template that generates setup for dojos with basic test setup running with docker.
> The languages already supported are on setup folder. Each folder defines the base of the dojo folder setup.
> The `build` folder holds the Dockerfile and the `template` the initial files needed by each language.

Fork this repository to your organization and dojo away :)

Jump to the [usage](#usage) section for the details of creating a dojo folder.

## Guidelines

1. The Dojo will have duration of 1h30.
2. A pair will be responsible for the code. One codes and the other person helps (Pilot and co-pilot).
3. The pair rotates every 7 minutes. The copilot turn into pilot and another person is chosen as the new copilot.
4. In the beginning, an accord regarding if everybody gives suggestions or just the pair does it.
5. In the end, a short retrospective is done to evaluate the pros and cons of the session and to define the next
organizers.

## Session Schedule

> The problem should be decided prior to the session.

	- Problem solving and coding [55 min]
	- Retrospective [5 min]

## Formats

### `Randori`

Everybody participate. A problem is proposed and all coding happens in a single machine in pairs that change every couple of minutes. It is essential to use `TDD` and `baby steps`.

### `Kake`

Similar to the Randori but there are many pair working simultaneously. At each turn, the pairs change to promote integration between all participants. In this format, it is helpful to have more knowledge on the technology and/or the problem.

### `Kata`

In this format there is the presence of a presenter. This person demonstrates a solution to the problem previously done and improvements are then worked on. The goal is to practice a specific technique, change or refactor.

## Usage
### Setup of new dojos

The default `make` task `create` the problem folder, `setup`s its files and 'build's the image to be used.
If you want just some of those task done individually, use the following:
- `create`: just creates the problem folder and a template README
- `setup`: run `create` and setup language template files inside the created folder
- `build` just build the container image to be used for language

For the languages that already have a setup, use the following make command format to generate a problem folder with
language files and a README to complete the problem description. Things inside '[ ]' are optional. Accepted parameters
are `language`, `url`, `problem` and `version`. The problem title is mandatory and is either generated from the last
part of the `url` or from the specified `problem` title. This is used to create the problem folder inside the dojos
folder, with the path format `dojos/{problem-title}/{language}`. This way different dojos can be generated for
different languages.

`make language='language' url='http://dojopuzzles.com/problems/{problem}' [problem='Problem title']`

or

`make language='language' problem='Problem title'`

Ex: `make language='python' url='http://dojopuzzles.com/problems/jokenpo'`

or

Ex: `make language='python' problem='Poker Game'`

`url` or `problem` is required to specify the problem folder. The `language` is optional, it uses a default if not
specified. `version` is the language version to be used and it also uses a default if not specified.

A couple of default tasks are generated for each dojo. Inside the generated folder run `make` or `make help` to list
the options. By default all available language setup provide the following `make` tasks:
- `build`: builds the Docker image for the problem if unavailable
- `test`: run the tests
- `console`: opens a language console session
- `login`: run a shell session into the container
- `help`(default): show the help
- `description`: show helper header with problem title and language used

### Need help with available tasks?
`make help`

### Extra things
There are some extra tasks to list all previous dojos, dojo dates and to print a histogram of dojos per month as well.
These task are based on the information automatically generated on each problem's README file.
Both date related tasks (`dates` and `histogram`) need `dateutils` and will print helper message if not available. Check the tasks:
`make dojos`
`make dates`
`make histogram`

#### Where to find problems:

	- http://dojopuzzles.com/
	- https://exercism.io/
	- http://br.spoj.com/
	- https://projecteuler.net/
	- http://codekata.com/
	- http://codegolf.stackexchange.com/
	- https://www.codechef.com/
	- http://rubyquiz.com/
	- https://www.urionlinejudge.com.br/
