//
//  Unidade.swift
//  App Ja Bebeu Agua
//
//  Created by Mabel Kruger de Souza on 08/10/21.
//

import Foundation


//enum para mexer
//Aqui estamos declarando a unidade me medida
enum Unidade {
    case copo
    case ml
    case litro
    
    // var computadas.
    
    //aqui utilizamos para mostrar ao usuario na tela qual a sigla da unidade de medida
    var sigla: String{
        switch self {
        case .copo:
            return " C"
        case .ml:
            return " Ml"
        case .litro:
            return " L"
        }
    }
    
    // usando um enum e switch na funcao.
    
    //Aqui ja está fazendo o calcula de cada uma das unidades de medidas, o formato delas e a mensagem
    func formarMensagem(copos:Int) -> String
    {
        switch self{
        case .litro:
            let litros = Float(copos) * 0.2
            return "Litros hoje: " + String( format: "%.1f", litros) + self.sigla
        case .ml:
            return "Ml:  " + String(copos * 200) + self.sigla
         case .copo:
            return "copos: " + String(copos) + self.sigla
        }
    }
    
    // Como a utilizacao do private, somente essa classe podera usar ele, ex: a funcao de cima conseguiria utilizar ele.
    private func coposParaMl(copos: Int) -> String{
        return String(copos * 200)
    }
}
