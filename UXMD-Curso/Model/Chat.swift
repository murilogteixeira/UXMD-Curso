//
//  Chat.swift
//  UXMD-Curso
//
//  Created by Murilo Teixeira on 31/08/24.
//

import Foundation

typealias ChatDto = [ChatElementDto]
typealias Chat = [ChatElement]

extension ChatDto {
    
    static var mock: Self {
        guard let url = Bundle.main.url(forResource: "chat", withExtension: "json") else { return [] }
        guard let string = try? String(contentsOf: url) else { return [] }
        guard let data = string.data(using: .utf8) else { return [] }
        guard let chatDto = try? JSONDecoder().decode([ChatElementDto].self, from: data) else { return [] }
        return chatDto
    }
}

extension Chat {
    static var mock = ChatDto.mock
        .map { ChatElement(from: $0) }
        .sorted { $0.date > $1.date }
}

// MARK: - ChatElement
struct ChatElementDto: Codable {
    let nome, mensagem: String
    let dataHora: String
    let msgsNaoLidas: Int
    let avatarURL: String

    enum CodingKeys: String, CodingKey {
        case nome, mensagem
        case dataHora = "data_hora"
        case msgsNaoLidas = "msgs_nao_lidas"
        case avatarURL = "avatar_url"
    }
    
    static var mock: Self {
        ChatDto.mock.randomElement() ?? ChatDto.mock.first ?? .init(nome: "", mensagem: "", dataHora: "", msgsNaoLidas: 0, avatarURL: "")
    }
}

struct ChatElement: Identifiable, Hashable {
        
    let id = UUID()
    var imageUrl: URL?
    var name: String
    var message: String
    var date: Date
    var unreadedMessagesCount: Int
    
    init(imageUrl: URL? = nil, name: String, message: String, date: Date, unreadedMessagesCount: Int) {
        self.imageUrl = imageUrl
        self.name = name
        self.message = message
        self.date = date
        self.unreadedMessagesCount = unreadedMessagesCount
    }
    
    init(from dto: ChatElementDto) {
        self.imageUrl = URL(string: dto.avatarURL)
        self.name = dto.nome
        self.message = dto.mensagem
        self.date = ISO8601DateFormatter().date(from: dto.dataHora) ?? Date()
        self.unreadedMessagesCount = dto.msgsNaoLidas
    }
}
