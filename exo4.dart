// Classe de base Animal
class Animal {
  String nom;
  int age;
  String espece;
  static int _nombreTotalAnimaux = 0;

  // Constructeur
  Animal(this.nom, this.age, this.espece) {
    _nombreTotalAnimaux++;
  }

  // Méthode pour crier (à redéfinir dans les sous-classes)
  void crier() {
    print('$nom ($espece) fait un cri générique');
  }

  // Méthode statique pour obtenir le nombre total d'animaux
  static int get nombreTotalAnimaux => _nombreTotalAnimaux;
}

// Sous-classe Lion
class Lion extends Animal {
  Lion(String nom, int age) : super(nom, age, 'Lion');

  @override
  void crier() {
    print('$nom le lion rugit : Rooaaar!');
  }
}

// Sous-classe Oiseau
class Oiseau extends Animal {
  Oiseau(String nom, int age) : super(nom, age, 'Oiseau');

  @override
  void crier() {
    print('$nom l\'oiseau gazouille : Cui-cui!');
  }
}  

// Sous-classe Serpent
class Serpent extends Animal {
  Serpent(String nom, int age) : super(nom, age, 'Serpent');

  @override
  void crier() {
    print('$nom le serpent siffle : Ssssss!');
  }
}

void main() {
  // Création d'une liste d'animaux
  List<Animal> zoo = [
    Lion('Simba', 5),
    Oiseau('Titi', 2),
    Serpent('Kaa', 8)
  ];

  // Faire crier tous les animaux
  print('=== Le concert des animaux ===');
  for (var animal in zoo) {
    animal.crier();
  }

  // Afficher le nombre total d'animaux
  print('\nNombre total d\'animaux dans le zoo : ${Animal.nombreTotalAnimaux}');
}