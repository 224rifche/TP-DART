import 'dart:math';
import 'dart:io';

// Constante pour la longueur du code
const int CODE_LENGTH = 6;

// Caractères possibles pour le code
const String lettresMaj = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
const String lettresMin = "abcdefghijklmnopqrstuvwxyz";
const String chiffres = "0123456789";
final String caracteresPossibles = lettresMaj + lettresMin + chiffres;

// Création de l'objet Random
final Random rand = Random();

// Fonction pour générer un code aléatoire
String genererCode() {
  String code = "";
  for (int i = 0; i < CODE_LENGTH; i++) {
    int index = rand.nextInt(caracteresPossibles.length);
    code += caracteresPossibles[index];
  }
  return code;
}

void main() {
  print(" Générateur de code aléatoire sécurisé");

  while (true) {
    // Génération du code
    final String code = genererCode();
    print("\n Code généré : $code");

    // Vérification du premier caractère
    if (RegExp(r'[A-Za-z]').hasMatch(code[0])) {
      print("Le code commence par une lettre.");
    } else {
      print("Le code commence par un chiffre.");
    }

    // Demander à l'utilisateur s'il veut un nouveau code
    stdout.write("\nVoulez-vous générer un nouveau code ? (o/n) : ");
    String? reponse = stdin.readLineSync();
    if (reponse == null || reponse.toLowerCase() != 'o') {
      print(" Fin du programme. Merci !");
      break;
    }
  }
}
