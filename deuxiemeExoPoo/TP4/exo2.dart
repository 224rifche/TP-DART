// Fonction de calcul d'impôt avec paramètres optionnels
double calculerImpots(double revenu, {double taux = 15, bool reduction = false}) {
  double impot = revenu * (taux / 100);
  
  // Application de la réduction si activée
  if (reduction) {
    impot *= 0.95; // Réduction de 5%
  }
  
  return double.parse(impot.toStringAsFixed(2)); // Arrondi à 2 décimales
}

// Fonction pour formater les nombres avec 2 décimales
String formatMontant(double montant) {
  return '${montant.toStringAsFixed(2)} €';
}

// Fonction pour formater la date
String formatDate(DateTime date) {
  return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
}

// Fonction pour afficher le reçu
void afficherRecu({
  required double revenu,
  required double impot,
  required double net,
  required DateTime date,
  String? commentaire,
}) {
  print('''
╔════════════════════════════╗
║        REÇU FISCAL        ║
╟────────────────────────────╢
║ Date: ${formatDate(date)} ║
╟────────────────────────────╢
║ Revenu brut : ${formatMontant(revenu).padLeft(10)} ║
║ Impôt       : ${formatMontant(impot).padLeft(10)} ║
║ Revenu net  : ${formatMontant(net).padLeft(10)} ║
${commentaire != null ? '║ $commentaire'.padRight(29) + '║\n' : ''}╚════════════════════════════╝
''');
}

// Fonction bonus pour tester différentes stratégies de calcul
void afficherAvecStrategie({
  required double revenu,
  required double Function(double) strategieCalcul,
  String? commentaire,
}) {
  final impot = strategieCalcul(revenu);
  final net = revenu - impot;
  
  afficherRecu(
    revenu: revenu,
    impot: impot,
    net: net,
    date: DateTime.now(),
    commentaire: commentaire,
  );
}

void main() {
  // Exemple d'utilisation
  final revenu = 50000.0;
  
  // Calcul standard
  final impotStandard = calculerImpots(revenu);
  afficherRecu(
    revenu: revenu,
    impot: impotStandard,
    net: revenu - impotStandard,
    date: DateTime.now(),
  );
  
  // Avec réduction
  final impotAvecReduction = calculerImpots(revenu, reduction: true);
  afficherRecu(
    revenu: revenu,
    impot: impotAvecReduction,
    net: revenu - impotAvecReduction,
    date: DateTime.now(),
    commentaire: 'Avec réduction de 5%',
  );
  
  // Avec taux personnalisé
  final impotTauxPerso = calculerImpots(revenu, taux: 20);
  afficherRecu(
    revenu: revenu,
    impot: impotTauxPerso,
    net: revenu - impotTauxPerso,
    date: DateTime.now(),
    commentaire: 'Taux à 20%',
  );
  
  // Test avec différentes stratégies (bonus)
  print('=== STRATÉGIES DE CALCUL ===\n');
  
  // Stratégie 1: Taux progressif
  afficherAvecStrategie(
    revenu: revenu,
    strategieCalcul: (r) {
      if (r <= 10000) return r * 0.1;
      if (r <= 30000) return 1000 + (r - 10000) * 0.15;
      return 4000 + (r - 30000) * 0.25;
    },
    commentaire: 'Taux progressif',
  );
  
  // Stratégie 2: Taux forfaitaire élevé
  afficherAvecStrategie(
    revenu: revenu,
    strategieCalcul: (r) => r * 0.3,
    commentaire: 'Taux forfaitaire 30%',
  );
}