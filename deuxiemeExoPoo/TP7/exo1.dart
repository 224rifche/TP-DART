// Classe mère Vehicule
class Vehicule {
  String marque;
  String modele;
  double vitesse;

  Vehicule(this.marque, this.modele, this.vitesse);

  void afficherInfos() {
    print('Véhicule: $marque $modele');
    print('Vitesse: $vitesse km/h');
  }

  void demarrer() {
    print('Démarrage du véhicule...');
  }
}

// Sous-classe Voiture
class Voiture extends Vehicule {
  int nombrePortes;

  Voiture(String marque, String modele, double vitesse, this.nombrePortes)
      : super(marque, modele, vitesse);

  @override
  void afficherInfos() {
    super.afficherInfos();
    print('Type: Voiture');
    print('Nombre de portes: $nombrePortes');
  }

  @override
  void demarrer() {
    print('Mise du contact...');
    print('Tourner la clé...');
    print('Moteur démarré !');
  }
}

// Sous-classe Moto
class Moto extends Vehicule {
  String typeGuidon;

  Moto(String marque, String modele, double vitesse, this.typeGuidon)
      : super(marque, modele, vitesse);

  @override
  void afficherInfos() {
    super.afficherInfos();
    print('Type: Moto');
    print('Type de guidon: $typeGuidon');
  }

  @override
  void demarrer() {
    print('Mettre le contact...');
    print('Mettre en position de démarrage...');
    print('Donner un coup de kick...');
    print('Moteur démarré !');
  }
}

// Fonction pour tester les véhicules
void testerVehicules(List<Vehicule> liste) {
  for (var vehicule in liste) {
    print('-' * 40);
    vehicule.afficherInfos();
    print('Démarrage:');
    vehicule.demarrer();
    print('');
  }
}

void main() {
  // Création d'une liste de véhicules
  var vehicules = [
    Voiture('Renault', 'Clio', 180, 5),
    Moto('Yamaha', 'MT-07', 200, 'Guidon bas'),
    Voiture('Peugeot', '208', 190, 3),
    Moto('Honda', 'CBR600RR', 250, 'Guidon sport')
  ];

  // Test des véhicules
  testerVehicules(vehicules);
}
