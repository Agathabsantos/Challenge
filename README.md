# Arena Fantástica

Arena Fantástica é um mini-RPG em Swift desenvolvido para rodar no console. O jogo foi criado utilizando exclusivamente os conteúdos das quatro primeiras aulas: Introduction, Decision, Collections e Functions. O foco do projeto é demonstrar domínio dos conceitos iniciais da linguagem Swift por meio de um jogo simples, funcional e interativo.

---

## Visão geral do jogo

O jogador inicia informando seu nome e escolhendo uma classe entre:
- **Guerreiro** – mais vida  
- **Mago** – ataque mais alto  
- **Arqueiro** – atributos equilibrados  

Após essa etapa, o jogador acessa um menu principal com as opções:
- Entrar em batalha  
- Ver o status do herói  
- Visitar a loja  
- Sair do jogo  

As batalhas acontecem em turnos. O jogador pode:
- Atacar  
- Usar uma poção de vida  
- Tentar fugir  

Inimigos são gerados de forma aleatória usando arrays. Poções, ouro e inimigos derrotados são controlados por dicionários e sets.

---

## Tecnologias utilizadas (Lessons 01 a 04)

### Lesson 01 – Introduction
- `print()`, `readLine()`  
- Tipos básicos: `Int`, `String`, `Bool`  
- Uso de `var`, `let`  
- Optionals, `??`  
- Conversões de tipos  

### Lesson 02 – Decision
- Condicionais: `if`, `else`, `switch`  
- `enum` para representar classes do jogador  
- Operadores lógicos e comparações  

### Lesson 03 – Collections
- Arrays para lista de inimigos  
- Dicionário para inventário  
- Set para armazenar inimigos derrotados  
- Loops `while` e `for`  
- Uso de índices, ranges e valores padrão  

### Lesson 04 – Functions
- Funções com parâmetros e retorno  
- Retorno de tuplas (ex.: criar inimigo aleatório)  
- Funções auxiliares para organização e limpeza do código  

---

## Como executar o projeto

### No Xcode (macOS)
1. Abra o Xcode.  
2. Crie um novo projeto: **Command Line Tool**.  
3. Selecione **Swift** como linguagem.  
4. Abra o arquivo `main.swift`.  
5. Apague o conteúdo padrão e cole o código do jogo.  
6. Clique em **Run**.  
7. Caso não veja o console:  
   - Vá em *View > Debug Area > Activate Console*  
   - Ou pressione `⌘ + ⇧ + Y`  

### Pelo Terminal
1. Salve o arquivo como `main.swift`.  
2. Execute: swift main.swift


---

## Estrutura do projeto
   ArenaFantastica/
    └── main.swift
    
O projeto é mantido simples para refletir os conteúdos introdutórios de Swift e facilitar a leitura e compreensão.

---

## Exemplos de gameplay

Bem-vinda à Arena Fantástica!
Digite o nome do seu herói:
> Agatha

Escolha sua classe:
1 - Guerreiro
2 - Mago
3 - Arqueiro
> 2

Você é Agatha, a Maga!
Vida: 25
Ataque base: 10

Um Slime aparece com 8 de vida!
Sua vida: 25/25
Vida do Slime: 8
Poções: 3
1 - Atacar
2 - Usar poção
3 - Fugir
> 1

Você ataca e causa 10 de dano!
O Slime foi derrotado!
Você recebeu 12 moedas de ouro.


---

## Objetivo do projeto

- Aplicar os conceitos das quatro primeiras aulas de Swift  
- Demonstrar lógica, decisões, coleções e funções  
- Criar um jogo simples, funcional e compreensível  
- Desenvolver organização e clareza no código  


## Objetivo do projeto

- Aplicar os conceitos das quatro primeiras aulas de Swift  
- Demonstrar lógica básica, controle de fluxo e manipulação de coleções  
- Criar um jogo simples, funcional e compreensível  
- Desenvolver organização e clareza no código desde o início da aprendizagem  

