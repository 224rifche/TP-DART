import 'dart:io';

void main() {
  // --- 1. Definition des taux de change fixes (exemple) ---
  // 1 USD = 8700 GNF
  // 1 EUR = 9500 GNF
  double usdToGnf = 8700.0;
  double eurToGnf = 9500.0;

  print("=== Convertisseur de devises ===");
  print("Devises disponibles : USD, EUR, GNF\n");

  // --- 2. Lecture du montant ---
  stdout.write("Entrez le montant à convertir : ");
  double montant = double.parse(stdin.readLineSync()!);

  // --- 3. Choix de la devise source ---
  stdout.write("Entrez la devise source (USD/EUR/GNF) : ");
  String source = stdin.readLineSync()!.toUpperCase();

  // --- 4. Choix de la devise cible ---
  stdout.write("Entrez la devise cible (USD/EUR/GNF) : ");
  String cible = stdin.readLineSync()!.toUpperCase();

  // --- 5. Vérification des choix ---
  bool sourceValide = (source == "USD" || source == "EUR" || source == "GNF");
  bool cibleValide = (cible == "USD" || cible == "EUR" || cible == "GNF");

  if (!sourceValide || !cibleValide) {
    print("Erreur : devise entrée invalide.");
    return; // stoppe le programme
  }

  // --- 6. Conversion ---
  double montantEnGnf;

  // Convertir la source → GNF
  if (source == "USD") {
    montantEnGnf = montant * usdToGnf;
  } else if (source == "EUR") {
    montantEnGnf = montant * eurToGnf;
  } else {
    montantEnGnf = montant; // GNF -> GNF
  }

  // Convertir GNF → cible
  double montantFinal;
  double taux = 1;

  if (cible == "USD") {
    montantFinal = montantEnGnf / usdToGnf;
    taux = usdToGnf;
  } else if (cible == "EUR") {
    montantFinal = montantEnGnf / eurToGnf;
    taux = eurToGnf;
  } else {
    montantFinal = montantEnGnf;
  }

  // --- 7. Affichage du résultat formaté ---
  print("\n=== Résultat ===");
  print("${montant.toStringAsFixed(2)} $source = "
      "${montantFinal.toStringAsFixed(2)} $cible (taux : $taux)");
}
