//
//  main.swift
//  Challenge
//
//  Created by AGATHA BARBOSA MARINHO DOS SANTOS on 14/11/25.
//

import Foundation

enum ClasseJogador {
    case guerreiro
    case mago
    case arqueiro
}

var nomeJogador: String = ""
var classeJogador: ClasseJogador = .guerreiro

var vidaJogador = 0
var vidaMaximaJogador = 0
var ataqueJogador = 0
var ouroJogador = 0
var pocoesJogador = 3

var inimigosDerrotados = Set<String>()

var inventario: [String: Int] = [
    "Pocao de Vida": 3
]

let nomesInimigos = ["Goblin", "Slime", "Esqueleto", "Lobo"]
let vidasInimigos = [10, 8, 12, 14]
let ataquesInimigos = [3, 2, 4, 5]

func lerInteiro() -> Int {
    if let linha = readLine(), let valor = Int(linha){
        return valor
    } else {
        print("Entrada inválida. Usando 0")
        return 0
    }
}

func descreverClasse(_ c: ClasseJogador) -> String {
    switch c {
    case .guerreiro: return "Guerreiro"
    case .mago: return "Mago"
    case .arqueiro: return "Arqueiro"
    }
}

func criarInimigoAleatorio() -> (nome: String, vida: Int, ataque: Int){
    let indice = Int.random(in: 0..<nomesInimigos.count)
    let nome = nomesInimigos[indice]
    let vida = vidasInimigos[indice]
    let ataque = ataquesInimigos[indice]
    return (nome: nome, vida: vida, ataque: ataque)
}

func configurarJogador(){
    print("Bem-vindo à Arena Fantástica!")
    print("Digite o nome do seu herói:")
    
    let entradaNome = readLine() ?? "Heroi Anonimo"
    if entradaNome.isEmpty {
        nomeJogador = "Heroi Anonimo"
    } else {
        nomeJogador = entradaNome
    }
    
    print()
    print("Escolha sua classe:")
    print("1 - Guerreiro (muita vida, ataque médio)")
    print("2 - Mago (vida baixa, ataque alto)")
    print("3 - Arqueiro (equilibrio)")
    
    var escolha = lerInteiro()
    if escolha < 1 || escolha > 3{
        print("Opcao inválida, você será um Arqueiro por padrão")
        escolha = 3
    }
    
    switch escolha {
    case 1:
        classeJogador = .guerreiro
        vidaMaximaJogador = 40
        ataqueJogador = 6
    case 2:
        classeJogador = .mago
        vidaMaximaJogador = 25
        ataqueJogador = 10
    default:
        classeJogador = .arqueiro
        vidaMaximaJogador = 30
        ataqueJogador = 8
    }
    
    vidaJogador = vidaMaximaJogador
    ouroJogador = 0
    
    pocoesJogador = inventario["Pocao de Vida", default: 3]
    
    print()
    print("Você é \(nomeJogador), o \(descreverClasse(classeJogador))!")
    print("Vida: \(vidaJogador)")
    print("Ataque base: \(ataqueJogador)")
}

func batalhar() {
    print()
    var inimigo = criarInimigoAleatorio()
    print("Um \(inimigo.nome) aparece com \(inimigo.vida) de vida!")

    while vidaJogador > 0 && inimigo.vida > 0 {
        print()
        print("Sua vida: \(vidaJogador)/\(vidaMaximaJogador)")
        print("Vida do \(inimigo.nome): \(inimigo.vida)")
        print("Poções: \(pocoesJogador)")
        print()
        print("Escolha sua ação:")
        print("1 - Atacar")
        print("2 - Usar poção de vida")
        print("3 - Tentar fugir")

        let escolha = lerInteiro()

        switch escolha {
        case 1:
            let dano = ataqueJogador
            print("Você ataca e causa \(dano) de dano!")
            inimigo.vida -= dano

            if inimigo.vida <= 0 {
                break
            }

        case 2:
            if pocoesJogador > 0 {
                pocoesJogador -= 1
                inventario["Pocao de Vida"] = pocoesJogador

                let cura = 10
                vidaJogador += cura
                if vidaJogador > vidaMaximaJogador {
                    vidaJogador = vidaMaximaJogador
                }
                print("Você bebe uma poção e recupera \(cura) de vida.")
            } else {
                print("Você não tem mais poções!")
            }

        case 3:
            let fugiu = Bool.random()
            if fugiu {
                print("Você conseguiu fugir da batalha!")
                return
            } else {
                print("Você tentou fugir, mas o \(inimigo.nome) te alcançou!")
            }

        default:
            print("Você hesita e perde a ação...")
        }

        // Turno do inimigo
        if inimigo.vida > 0 {
            print()
            print("O \(inimigo.nome) ataca!")
            vidaJogador -= inimigo.ataque
            if vidaJogador < 0 { vidaJogador = 0 }
            print("Você recebe \(inimigo.ataque) de dano.")
        }
    }

    // Resultado da batalha
    if vidaJogador <= 0 {
        print()
        print("Você foi derrotado pelo \(inimigo.nome)...")
    } else {
        print()
        print("Você derrotou o \(inimigo.nome)!")
        inimigosDerrotados.insert(inimigo.nome)

        let ouroGanho = Int.random(in: 5...15)
        ouroJogador += ouroGanho
        print("Você recebe \(ouroGanho) moedas de ouro. Total: \(ouroJogador).")
    }
}


func abrirLoja() {
    print()
    print("Bem-vindo à Loja de Poções!")
    print("Uma poção de vida custa 10 de ouro.")
    print("Você tem \(ouroJogador) de ouro.")
    print("Quantas poções deseja comprar? (0 para voltar)")

    let quantidade = lerInteiro()

    if quantidade <= 0 {
        print("Você decide não comprar nada.")
        return
    }

    let custo = quantidade * 10

    if custo > ouroJogador {
        print("Você não tem ouro suficiente!")
        return
    }

    ouroJogador -= custo
    pocoesJogador += quantidade
    inventario["Pocao de Vida"] = pocoesJogador

    print("Você comprou \(quantidade) poções.")
    print("Agora possui \(pocoesJogador) poções de vida.")
}

func mostrarStatus() {
    print()
    print("===== STATUS DO HERÓI =====")
    print("Nome: \(nomeJogador)")
    print("Classe: \(descreverClasse(classeJogador))")
    print("Vida: \(vidaJogador)/\(vidaMaximaJogador)")
    print("Ataque base: \(ataqueJogador)")
    print("Ouro: \(ouroJogador)")
    print("Poções: \(pocoesJogador)")

    if inimigosDerrotados.isEmpty {
        print("Inimigos derrotados: nenhum ainda.")
    } else {
        print("Inimigos derrotados:")
        for nome in inimigosDerrotados {
            print("- \(nome)")
        }
    }
    print("===========================")
}

// Menu principal
func menuPrincipal() {
    var executando = true

    while executando && vidaJogador > 0 {
        print()
        print("===== MENU PRINCIPAL =====")
        print("1 - Entrar em batalha")
        print("2 - Ver status do herói")
        print("3 - Visitar a loja")
        print("4 - Sair do jogo")
        print("==========================")
        print("Escolha uma opção:")

        let escolha = lerInteiro()

        switch escolha {
        case 1:
            batalhar()
        case 2:
            mostrarStatus()
        case 3:
            abrirLoja()
        case 4:
            executando = false
        default:
            print("Opção inválida, tente novamente.")
        }

        if vidaJogador <= 0 {
            print("Game Over!")
        }
    }
}

// Execução
configurarJogador()
menuPrincipal()
print()
print("Obrigado por jogar!")









