import 'dart:io';

void main() {
  while (true) {
    stdout.write("Entrez votre mot de passe : ");
    String password = stdin.readLineSync()!;

    // --- 1. Vérification des critères ---
    bool longOk = password.length >= 8;
    bool numOk = password.contains(RegExp(r'[0-9]'));
    bool majOk = password.contains(RegExp(r'[A-Z]'));
    bool specialOk = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    // --- 2. Calcul du score ---
    int score = 0;
    if (longOk) score += 3;
    if (numOk) score += 2;
    if (majOk) score += 2;
    if (specialOk) score += 3;

    // --- 3. Mention + couleur globale ---
    String mention;
    String couleur;

    if (score <= 4) {
      mention = "faible";
      couleur = "[ROUGE]";
    } else if (score <= 7) {
      mention = "moyen";
      couleur = "[JAUNE]";
    } else {
      mention = "fort";
      couleur = "[VERT]";
    }

    // --- 4. Affichage détaillé ---
    print("\n--- Vérification du mot de passe ---");

    String afficherCritere(bool ok, String description) {
      String c = ok ? "[VERT]" : "[ROUGE]";
      String status = ok ? "OK" : "Échec";
      return "- $c $status [FIN] : $description";
    }

    print(afficherCritere(longOk, "Minimum 8 caractères"));
    print(afficherCritere(numOk, "Contient un chiffre (0-9)"));
    print(afficherCritere(majOk, "Contient une majuscule (A-Z)"));
    print(afficherCritere(specialOk, "Contient un caractère spécial"));

    print("----------------------------------");
    print("$couleur Score : $score / 10 — Sécurité : $mention [FIN]\n");

    // --- 5. Si le mot de passe est faible → recommencer ---
    if (score < 8) {
      print("$couleur Mot de passe insuffisant ! Essayez encore. [FIN]\n");
      continue;
    }

    // --- 6. Mot de passe accepté ---
    print("[VERT] Mot de passe accepté ! [FIN]");
    break;
  }
}
