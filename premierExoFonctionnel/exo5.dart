import 'dart:io';

const List<String> motsInterdits = ['erreur', 'interdit', 'confidentiel'];
final bool modeStrict = true;

void analyserTexte(String texte, bool modeStrict, List<bool> alerteMode) {
  // Comptage
  int nbMots = texte.split(RegExp(r'\s+')).where((m) => m.isNotEmpty).length;
  int nbPhrases = texte.split(RegExp(r'[.!?]')).where((p) => p.trim().isNotEmpty).length;
  int nbCaracteres = texte.length;

  // Vérification mots interdits
  bool interdit = motsInterdits.any((mot) => texte.toLowerCase().contains(mot.toLowerCase()));

  // Mode strict : enregistre seulement l'alerte mais continue
  if (modeStrict && interdit) {
    print(" Mode strict détecté sur ce texte !");
    alerteMode.add(true);
  }

  // Rapport
  print("\n---  Rapport ---");
  print("Texte : $texte");
  print("Nombre de mots : $nbMots");
  print("Nombre de phrases : $nbPhrases");
  print("Nombre de caractères : $nbCaracteres");
  print("Présence de mots interdits : ${interdit ? 'Oui' : 'Non'}");
  print("-----------------");
}

void main() {
  print(" Analyseur de texte interactif (tapez 'fin' pour quitter)\n");

  List<bool> alertes = []; // Pour suivre si mode strict a été déclenché

  while (true) {
    stdout.write("Entrez un texte : ");
    String? texte = stdin.readLineSync();
    if (texte == null || texte.toLowerCase() == '1') {
      break;
    }
    if (texte.trim().isEmpty) {
      print(" Aucun texte saisi !");
      continue;
    }

    analyserTexte(texte, modeStrict, alertes); // Analyse immédiate
  }

  // Résumé final du mode strict
  if (modeStrict) {
    bool actif = alertes.isNotEmpty;
    print("\n Mode strict actif pendant l'analyse : ${actif ? 'Oui' : 'Non'}");
  }

  print(" Programme terminé.");
}
