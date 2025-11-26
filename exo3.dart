import 'dart:io';

void main() {
  List<int> nombres = [];

  print("📊 Programme interactif de statistiques");
  print("Entrez vos nombres un par un. Tapez 'fin' pour terminer.\n");

  // --- 1. Lecture interactive des nombres ---
  while (true) {
    stdout.write("Entrez un nombre : ");
    String? saisie = stdin.readLineSync();

    if (saisie == null) continue;  // Si entrée vide, on recommence
    if (saisie.toLowerCase() == 'fin') break;  // Fin de saisie

    int? nombre = int.tryParse(saisie); // Essaye de convertir en entier
    if (nombre == null) {
      print("⚠️ Entrée invalide ! Veuillez entrer un nombre.");
      continue;
    }

    nombres.add(nombre);
  }

  // Vérification si la liste est vide
  if (nombres.isEmpty) {
    print("⚠️ Aucun nombre n'a été saisi. Programme terminé.");
    return;
  }

  // --- 2. Calcul des statistiques ---
  int somme = 0;
  int minimum = nombres[0];
  int maximum = nombres[0];
  bool contientNegatifs = false;

  for (int n in nombres) {
    somme += n;
    if (n < minimum) minimum = n;
    if (n > maximum) maximum = n;
    if (n < 0) contientNegatifs = true;
  }

  double moyenne = somme / nombres.length;

  // --- 3. Affichage des résultats ---
  print("\n--- 📊 Rapport de Statistiques ---");
  print("Liste saisie : $nombres");
  print("Nombre d'éléments : ${nombres.length}");
  print("Somme totale : $somme");
  print("Moyenne : ${moyenne.toStringAsFixed(2)}");
  print("Valeur minimale : $minimum");
  print("Valeur maximale : $maximum");
  print(contientNegatifs
      ? "🚨 La liste contient des nombres négatifs."
      : "✅ Tous les nombres sont positifs ou zéro.");
  print("---------------------------------");
}
