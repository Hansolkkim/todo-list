import Foundation

class CardManager: CardManagable {
    
    enum Constants {
        enum NotificationNames {
            static let didAddNewCard = Notification.Name("CardManagerDidAddNewCard")
        }
        
        enum userInfoKeys {
            static let addedCard = "addedCard"
        }
    }
    
    private var listName: String
    private var cards = [Cardable]()
    private var selectedCard: Cardable?
    private var cardFactory: ModelFactoryBase
    
    var count: Int {
        return cards.count
    }
    
    subscript(_ index: Int) -> Cardable {
        return cards[index]
    }
    
    init(listName: String, cardFactory: ModelFactoryBase) {
        self.listName = listName
        self.cardFactory = cardFactory
    }
    
    func add(title: String, body: String) {
        let data = [listName]
        var newCard = cardFactory.make(factoriable: Card.self, title: title, body: body, data: data)
        newCard.setIndexOrder(in: count)
        cards.insert(newCard, at: 0)
        
        let userInfo = [Constants.userInfoKeys.addedCard: newCard]
        NotificationCenter.default.post(name: Constants.NotificationNames.didAddNewCard, object: self, userInfo: userInfo)
    }
    
    func add(newCard: Cardable) {
        cards.append(newCard)
        NotificationCenter.default.post(name: Constants.NotificationNames.didAddNewCard, object: self)
        
        let userInfo = [Constants.userInfoKeys.addedCard: newCard]
        NotificationCenter.default.post(name: Constants.NotificationNames.didAddNewCard, object: self, userInfo: userInfo)
    }
    }
    
    func selectCard(index: Int) {
        self.selectedCard = cards[index]
    }
}
