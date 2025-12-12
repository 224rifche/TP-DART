// Classe de base Paiement
abstract class Paiement {
  double montant;
  DateTime date;

  Paiement(this.montant) : date = DateTime.now();

  // Méthode abstraite à implémenter par les sous-classes
  void effectuerPaiement();

  // Méthode bonus pour le reçu
  String genererRecu() {
    return 'Reçu de paiement';
  }
}

// Sous-classe PaiementCarte
class PaiementCarte extends Paiement {
  String numeroCarte;
  String banque;

  PaiementCarte(double montant, this.numeroCarte, this.banque) : super(montant);

  @override
  void effectuerPaiement() {
    print('Paiement de $montant € effectué par carte (${numeroCarte.substring(12)}) via $banque');
  }

  @override
  String genererRecu() {
    return '''
    REÇU DE PAIEMENT CARTE
    ----------------------
    Montant: $montant €
    Date: $date
    Carte: **** **** **** ${numeroCarte.substring(12)}
    Banque: $banque
    ''';
  }
}

// Sous-classe PaiementMobile
class PaiementMobile extends Paiement {
  String numeroTelephone;
  String operateur;

  PaiementMobile(double montant, this.numeroTelephone, this.operateur) 
      : super(montant);

  @override
  void effectuerPaiement() {
    print('Paiement mobile de $montant € effectué via $operateur (${numeroTelephone})');
  }

  @override
  String genererRecu() {
    return '''
    REÇU DE PAIEMENT MOBILE
    -----------------------
    Montant: $montant €
    Date: $date
    Téléphone: $numeroTelephone
    Opérateur: $operateur
    ''';
  }
}

// Sous-classe PaiementEspece
class PaiementEspece extends Paiement {
  String pointCollecte;

  PaiementEspece(double montant, this.pointCollecte) : super(montant);

  @override
  void effectuerPaiement() {
    print('Paiement en espèces de $montant € effectué au point de collecte: $pointCollecte');
  }

  @override
  String genererRecu() {
    return '''
    REÇU DE PAIEMENT EN ESPÈCES
    ---------------------------
    Montant: $montant €
    Date: $date
    Point de collecte: $pointCollecte
    ''';
  }
}

void main() {
  // Création d'une liste de paiements mixtes
  var paiements = [
    PaiementCarte(150.50, '1234567890123456', 'BNP Paribas'),
    PaiementMobile(29.99, '0612345678', 'Orange'),
    PaiementEspece(75.0, 'Caisse principale'),
    PaiementCarte(89.90, '9876543210987654', 'Société Générale'),
    PaiementMobile(45.0, '0787654321', 'SFR')
  ];

  // Exécution des paiements
  print('=== EXÉCUTION DES PAIEMENTS ===\n');
  for (var paiement in paiements) {
    paiement.effectuerPaiement();
  }

  // Génération des reçus
  print('\n=== REÇUS DE PAIEMENT ===\n');
  for (var paiement in paiements) {
    print(paiement.genererRecu());
  }
}