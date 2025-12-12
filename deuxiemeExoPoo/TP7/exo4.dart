// Classe abstraite Forme
abstract class Forme {
  // Méthodes abstraites
  double aire();
  double perimetre();
  
  // Méthode par défaut pour la description
  String decrire() {
    return 'Je suis une forme géométrique.';
  }
}

// Sous-classe Cercle
class Cercle extends Forme {
  double rayon;

  Cercle(this.rayon);

  @override
  double aire() {
    return 3.14159 * rayon * rayon;
  }

  @override
  double perimetre() {
    return 2 * 3.14159 * rayon;
  }

  @override
  String decrire() {
    return 'Je suis un cercle de rayon $rayon cm.';
  }
}

// Sous-classe Rectangle
class Rectangle extends Forme {
  double longueur;
  double largeur;

  Rectangle(this.longueur, this.largeur);

  @override
  double aire() {
    return longueur * largeur;
  }

  @override
  double perimetre() {
    return 2 * (longueur + largeur);
  }

  @override
  String decrire() {
    return 'Je suis un rectangle de ${longueur}x$largeur cm.';
  }
}

// Sous-classe Triangle
class Triangle extends Forme {
  double base;
  double hauteur;
  List<double> cotes;

  Triangle(this.base, this.hauteur, this.cotes) {
    // Vérification qu'on a bien 3 côtés
    if (cotes.length != 3) {
      throw ArgumentError('Un triangle doit avoir exactement 3 côtés');
    }
  }

  @override
  double aire() {
    return (base * hauteur) / 2;
  }

  @override
  double perimetre() {
    return cotes.reduce((a, b) => a + b);
  }

  @override
  String decrire() {
    return 'Je suis un triangle avec une base de $base cm et une hauteur de $hauteur cm.';
  }
}

// Fonction pour afficher les formes
void afficherFormes(List<Forme> formes) {
  for (var forme in formes) {
    print('${forme.decrire()}');
    print('Aire: ${forme.aire().toStringAsFixed(2)} cm²');
    print('Périmètre: ${forme.perimetre().toStringAsFixed(2)} cm');
    print('---');
  }
}

void main() {
  // Création de différentes formes
  var formes = [
    Cercle(5.0),
    Rectangle(4.0, 6.0),
    Triangle(3.0, 4.0, [3.0, 4.0, 5.0]),  // Triangle rectangle 3-4-5
    Cercle(2.5),
    Rectangle(10.0, 5.0),
    Triangle(6.0, 8.0, [6.0, 8.0, 10.0])  // Autre triangle rectangle
  ];

  // Affichage des informations pour chaque forme
  print('=== INFORMATIONS SUR LES FORMES GÉOMÉTRIQUES ===\n');
  afficherFormes(formes);
}