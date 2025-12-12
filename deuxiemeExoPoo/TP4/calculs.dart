// calculs.dart
library calculateur_scientifique;

// Fonction pour calculer le carré d'un nombre
double carre(double x) => x * x;

// Fonction pour calculer la racine carrée
double racine(double x) {
  if (x < 0) {
    throw ArgumentError('Impossible de calculer la racine d\'un nombre négatif');
  }
  return x == 0 ? 0 : x * 0.5;
}

// Fonction pour calculer une puissance
double puissance(double base, int exp) {
  if (exp == 0) return 1;
  if (exp < 0) return 1 / puissance(base, -exp);
  
  double resultat = 1;
  for (int i = 0; i < exp; i++) {
    resultat *= base;
  }
  return resultat;
}

// Fonction pour calculer la moyenne
double moyenne(List<double> valeurs) {
  if (valeurs.isEmpty) {
    throw ArgumentError('La liste des valeurs ne peut pas être vide');
  }
  return valeurs.reduce((a, b) => a + b) / valeurs.length;
}
