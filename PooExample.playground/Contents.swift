import Foundation

///Diseña un sistema de animales que implemente los cuatro pilares de la Programación Orientada a Objetos:
///
///Abstracción:
///
///Crea un protocolo `AnimalProtocol` con los métodos `makeSound()` y `move()`.
///Encapsulación:
///
///En la clase `Animal`, crea la propiedad `name` como privada para que no pueda ser modificada directamente.
///Agrega el método `getName()` para acceder al nombre.
///Herencia:
///
///Crea una clase base `Animal` que implemente `AnimalProtocol`.
///Luego, crea las clases `Dog` y `Bird` que hereden de `Animal`.
///Polimorfismo:
///
///En `Dog` y `Bird`, sobrescribe `makeSound()` y `move()`.
///Agrega una función `describeAnimal(_:)` que reciba cualquier animal y ejecute sus métodos.
///Overloading (Sobrecarga):
///
///En Dog, sobrecarga `makeSound()` para permitir llamarlo sin parámetros y con un número entero que represente cuántas veces debe hacer el sonido.
///
///Resultado esperado:
///`let dog = Dog(name: "Buddy")
///`print(dog.getName()) // "Buddy"
///`dog.makeSound() // "Woof"
///`dog.makeSound(times: 3) // "Woof Woof Woof"
///`
///`let bird = Bird(name: "Tweety")
///`print(bird.getName()) // "Tweety"
///`bird.makeSound() // "Chirp chirp"
///`bird.move() // "Tweety is flying"
///`
///`describeAnimal(dog) // Runs makeSound() and move()
///`describeAnimal(bird) // Runs makeSound() and move()
///

// Abstraction: Define a protocol with required methods
protocol AnimalProtocol {
    func makeSound()
    func move()
}


class Animal: AnimalProtocol {
    private var name: String

    init(name: String) {
        self.name = name
    }

    func getName() -> String {
        return name
    }

    func makeSound() {
        print("Some generic animal sound")
    }

    func move() {
        print("\(name) is moving")
    }
}


class Dog: Animal {
    override func makeSound() {
        print("Woof")
    }

    override func move() {
        print("\(getName()) is running")
    }


    func makeSound(times: Int) {
        print(Array(repeating: "Woof", count: times).joined(separator: " "))
    }
}

class Bird: Animal {
    override func makeSound() {
        print("Chirp chirp")
    }

    override func move() {
        print("\(getName()) is flying")
    }
}

// Polymorphism: A function that works with any AnimalProtocol type
func describeAnimal(_ animal: AnimalProtocol) {
    animal.makeSound()
    animal.move()
}

// Test
let dog = Dog(name: "Buddy")
print(dog.getName()) // "Buddy"
dog.makeSound() // "Woof"
dog.makeSound(times: 3) // "Woof Woof Woof"

let bird = Bird(name: "Tweety")
print(bird.getName()) // "Tweety"
bird.makeSound() // "Chirp chirp"
bird.move() // "Tweety is flying"

describeAnimal(dog)
describeAnimal(bird)

///
///Diseña un sistema de vehículos que implemente los **cuatro pilares de la Programación Orientada a Objetos**:

///1. **Abstracción**:
///    - Crea un protocolo `VehicleProtocol` con los métodos `startEngine()` y `drive()`.
///2. **Encapsulación**:
///    - En la clase `Car`, crea la propiedad `brand` como **privada**.
///    - Agrega el método `getBrand()` para acceder a la marca del auto.
///3. **Herencia**:
///    - Crea una clase base `Car` que implemente `VehicleProtocol`.
///    - Luego, crea las clases `ElectricCar` y `GasolineCar` que hereden de `Car`.
///4. **Polimorfismo**:
///    - En `ElectricCar` y `GasolineCar`, sobrescribe `startEngine()` y `drive()`.
///    - Agrega una función `testDrive(vehicle: VehicleProtocol)` que reciba cualquier auto y ejecute sus métodos.
///5. **Overloading (Sobrecarga)**:
///    - En `Car`, sobrecarga `drive(distance)` que pida la distancia y con un número entero que represente la distancia a recorrer.
///
///Resultado esperado:
///
///`let tesla = ElectricCar(brand: "Tesla")
///`print(tesla.getBrand()) // "Tesla"
///`tesla.startEngine() // "Tesla: Encendiendo en silencio..."
///`tesla.drive() // "Tesla está moviéndose silenciosamente."
///`tesla.drive(distance: 50) // "Tesla está conduciendo 50 km con energía de batería."
///`
///`let ford = GasolineCar(brand: "Ford")
///`print(ford.getBrand()) // "Ford"
///`ford.startEngine() // "Ford: ¡Vroom! El motor está rugiendo."
///`ford.drive() // "Ford está moviéndose con un motor de gasolina."
///`ford.drive(distance: 100) // "Ford está conduciendo 100 km usando gasolina."
///`
///`testDrive(tesla) // Executes startEngine() and drive()
///`testDrive(ford) // Executes startEngine() and drive()
///
///

// Abstraction: Define a protocol with required methods
protocol VehicleProtocol {
    func startEngine()
    func drive()
}


class Car: VehicleProtocol {
    private var brand: String

    init(brand: String) {
        self.brand = brand
    }

    func getBrand() -> String {
        return brand
    }

    func startEngine() {
        print("\(brand): Engine started.")
    }

    func drive() {
        print("\(brand) is moving.")
    }


    func drive(distance: Int) {
        print("\(brand) is driving \(distance) km.")
    }
}

class ElectricCar: Car {
    override func startEngine() {
        print("\(getBrand()): Powering on silently...")
    }

    override func drive() {
        print("\(getBrand()) is moving quietly.")
    }

    override func drive(distance: Int) {
        print("\(getBrand()) is driving \(distance) km with battery power.")
    }
}

class GasolineCar: Car {
    override func startEngine() {
        print("\(getBrand()): Vroom! The engine is roaring.")
    }

    override func drive() {
        print("\(getBrand()) is moving with a gas engine.")
    }

    override func drive(distance: Int) {
        print("\(getBrand()) is driving \(distance) km using gasoline.")
    }
}


func testDrive(_ vehicle: VehicleProtocol) {
    vehicle.startEngine()
    vehicle.drive()
}


let tesla = ElectricCar(brand: "Tesla")
print(tesla.getBrand()) // "Tesla"
tesla.startEngine() // "Tesla: Powering on silently..."
tesla.drive() // "Tesla is moving quietly."
tesla.drive(distance: 50) // "Tesla is driving 50 km with battery power."

let ford = GasolineCar(brand: "Ford")
print(ford.getBrand()) // "Ford"
ford.startEngine() // "Ford: Vroom! The engine is roaring."
ford.drive() // "Ford is moving with a gas engine."
ford.drive(distance: 100) // "Ford is driving 100 km using gasoline."

testDrive(tesla)
testDrive(ford)

