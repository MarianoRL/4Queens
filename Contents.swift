import UIKit

class Tablero {
    var limit: Int
    var queens = [Reina]()
    init(limit: Int) {
        self.limit = limit
    }
    func Posicion (atRow row: Int, col: Int) -> Bool { // Checa la posicion
        for queen in queens {
            if queen.row == row { return false }
            if queen.col == col { return false }
            if abs(queen.row-row) == abs(queen.col-col) { return false }
        }
        return true
    }
    func Busqueda(atRow row: Int) {
        if queens.count < limit {
            for col in 0...limit-1 {
                if Posicion(atRow: row, col: col) {
                    let queen = Reina(row: row, col: col)
                    queens.append(queen)
                    Busqueda(atRow: row+1)
                    if queens.count == limit {
                        print(output())
                    }
                    queens.removeLast()
                }
            }
        }
    }
    func Jugar() {
        Busqueda(atRow: 0) //inicio del juego
    }
    func output() -> String {
        var s = ""
        for q in queens {
            s += "(\(q.row),\(q.col))"
        }
        return s
    }
}
struct Reina {
    var row: Int
    var col: Int
}
let b = Tablero(limit: 4)
b.Jugar()

