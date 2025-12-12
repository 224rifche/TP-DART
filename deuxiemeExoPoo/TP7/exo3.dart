// Classe de base Personne
class Personne {
  String nom;
  String prenom;
  int age;

  // Constructeur
  Personne(this.nom, this.prenom, this.age);

  // Méthode à redéfinir dans les sous-classes
  void afficherInfos() {
    print('$prenom $nom, $age ans');
  }
}

// Sous-classe Etudiant
class Etudiant extends Personne {
  String matricule;
  double moyenne;

  // Constructeur
  Etudiant(String nom, String prenom, int age, this.matricule, this.moyenne)
      : super(nom, prenom, age);

  // Redéfinition de la méthode afficherInfos
  @override
  void afficherInfos() {
    print('Étudiant: $prenom $nom');
    print('Âge: $age ans');
    print('Matricule: $matricule');
    print('Moyenne: $moyenne/20 - ${estReussi() ? 'Admis' : 'Échoué'}');
    print('---');
  }

  // Méthode bonus pour vérifier la réussite
  bool estReussi() {
    return moyenne >= 10.0;
  }
}

// Sous-classe Professeur
class Professeur extends Personne {
  String matiere;
  double salaire;

  // Constructeur
  Professeur(String nom, String prenom, int age, this.matiere, this.salaire)
      : super(nom, prenom, age);

  // Redéfinition de la méthode afficherInfos
  @override
  void afficherInfos() {
    print('Professeur: $prenom $nom');
    print('Âge: $age ans');
    print('Matière: $matiere');
    print('Salaire: $salaire €');
    print('---');
  }
}

void main() {
  // Création d'une liste hétérogène de Personnes
  var personnes = [
    Etudiant('Dupont', 'Jean', 20, 'ETD123', 14.5),
    Professeur('Martin', 'Sophie', 42, 'Mathématiques', 2500.0),
    Etudiant('Bernard', 'Emma', 19, 'ETD124', 8.5),
    Professeur('Dubois', 'Pierre', 35, 'Informatique', 2800.0),
    Etudiant('Petit', 'Lucas', 21, 'ETD125', 16.0)
  ];

  // Affichage des informations de toutes les personnes
  print('=== LISTE DU PERSONNEL ET DES ÉTUDIANTS ===\n');
  for (var personne in personnes) {
    personne.afficherInfos(); // Polymorphisme en action
  }

  // Exemple d'utilisation de la méthode estReussi()
  print('=== RÉSULTATS DES ÉTUDIANTS ===\n');
  for (var personne in personnes) {
    if (personne is Etudiant) {
      print('${personne.prenom} ${personne.nom}: ${personne.estReussi() ? 'Admis' : 'Échoué'}');
    }
  }
}