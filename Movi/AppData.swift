//
//  AppData.swift
//  Movi
//
//  Created by Filipe Marques on 08/04/18.
//  Copyright © 2018 Filipe Marques. All rights reserved.
//

import Foundation

enum StatusSolicitacao {
    case solved
    case inProgress
    case denied
}

enum TipoSolicitacao {
    // Solicita todas as informações
    case complete
    
    // Solicita apenas data, local e infos extras
    case short
    
    // Caixa de texto solicitando apenas infos extra
    case textBox
}

enum TipoNotificacao {
    case onibus
    case status
}

class AppData {
    
    let dateFormatter = DateFormatter()
    
    static var history:[Solicitacao] =
        [Solicitacao(protocolo: "7522890", categoria: "Superlotação", status: StatusSolicitacao.inProgress, statusDesc: "Solicitação em análise", tipo: TipoSolicitacao.complete, data: "2018-04-08 10:05", local: "Rua Roxo Moreira, 280", linha: "121", prefixo: "1997", informacoes: "Tinha cerca de 500 pessoas no ônibus, sem condições."),
         Solicitacao(protocolo: "1651747", categoria: "Sinalização de Pontos", status: StatusSolicitacao.inProgress, statusDesc: "Solicitação Recebida", tipo: TipoSolicitacao.short, data: "2018-04-08" + " " + "00:00", local: "Rua Luverci Pereira de Souza, 280", linha: nil, prefixo: nil, informacoes: "A placa está encoberta por uma árvore."),
         Solicitacao(protocolo: "2045585", categoria: "Má Conservação da Via", status: StatusSolicitacao.denied, statusDesc: "Solicitação negada por falta de informações", tipo: TipoSolicitacao.short, data: "2018-03-05" + " " + "00:00", local: "Rua Albertina de Jesus Martins, 100", linha: nil, prefixo: nil, informacoes: "Vários buracos."),
         Solicitacao(protocolo: "8078395", categoria: "Credencial de Idoso", status: StatusSolicitacao.solved, statusDesc: "Solicitação finalizada", tipo: TipoSolicitacao.textBox, data: nil, local: nil, linha: nil, prefixo: nil, informacoes: "Acabei de fazer 60 anos e gostaria de saber de forma fácil como conseguiria tirar minha credencial de idoso. Não consegui encontrar através do site!")]
    
    static var notifications:[Notificacao] = [
        Notificacao(title: "Linha 331", text: "Devido ao show do U2 no dia 23/05, o itinerário desta linha foi alterado.", type: TipoNotificacao.onibus),
        Notificacao(title: "Superlotação", text: "Sua solicitação está atualmente em análise.", type: TipoNotificacao.status),
        Notificacao(title: "Sinalização de Pontos", text: "Sua solicitação foi recebida", type: TipoNotificacao.status),
        Notificacao(title: "Linha 121", text: "Devido ao trânsito, seu ônibus atrasará em torno de 20 minutos", type: TipoNotificacao.onibus)
    ]
    
    
    
}

class Solicitacao {
    var protocolo:String
    var categoria:String
    var status:StatusSolicitacao
    var statusDesc: String
    var tipo:TipoSolicitacao
    var data:Date?
    var local:String?
    var linha:String?
    var prefixo:String?
    var informacoes:String?
    
    init(protocolo: String, categoria: String, status: StatusSolicitacao, statusDesc:String, tipo: TipoSolicitacao, data: String?, local:String?, linha:String?, prefixo:String?, informacoes:String?){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        self.protocolo = protocolo
        self.categoria = categoria
        self.status = status
        self.statusDesc = statusDesc
        self.tipo = tipo
        
        if let data = data {
            self.data = dateFormatter.date(from: data)
        } else {
            self.data = nil
        }
        
        self.local = local
        self.linha = linha
        self.prefixo = prefixo
        self.informacoes = informacoes
        
    }
}

class Notificacao {
    var title:String
    var text:String
    var type:TipoNotificacao
    
    init (title:String, text:String, type:TipoNotificacao) {
        self.title = title
        self.text = text
        self.type = type
    }
}

struct User {
    static var userName = "Filipe Marques"
    static var address = "Rua Luverci Pereira de Souza, 545"
    static var email = "fi.marques33@gmail.com"
    static var phoneNumber = "(19) 98747-6574"
    static var lines = [
        Line(number: "332", terminals: "Rodoviária - Hospital das Clínicas"),
        Line(number: "329", terminals: "Terminal Barão Geraldo - Cidade Judiciária"),
        Line(number: "122", terminals: "Terminal Vida Nova - Campinas Shopping"),
        Line(number: "351", terminals: "Corredor Central - Jardim Primavera/PUCC"),
        Line(number: "430", terminals: "Terminal Central - Swiss Park"),
    ]
    
}

struct Line {
    var number:String
    var terminals:String
}
