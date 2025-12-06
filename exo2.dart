class Etudiant {
  String nom;
  String matricule;
  List<double> notes;

  // Constructeur
  Etudiant({
    required this.nom,
    required this.matricule,
    List<double>? notes,
  }) : notes = notes ?? [];

  // Méthode pour ajouter une note
  void ajouterNote(double note) {
    if (note >= 0 && note <= 20) {
      notes.add(note);
      print('Note de $note/20 ajoutée pour $nom');
    } else {
      print('Erreur : La note doit être comprise entre 0 et 20');
    }
  }

  // Méthode pour calculer la moyenne
  double calculerMoyenne() {
    if (notes.isEmpty) return 0.0;
    double somme = notes.reduce((a, b) => a + b);
    return double.parse((somme / notes.length).toStringAsFixed(2));
  }

  // Méthode pour afficher le bulletin
  void afficherBulletin() {
    print('\n=== BULLETIN DE NOTES ===');
    print('Nom: $nom');
    print('Matricule: $matricule');
    print('Notes: ${notes.join(' | ')}');
    print('Moyenne: ${calculerMoyenne()}/20');
    print('=======================\n');
  }

  // Méthode statique pour trouver le meilleur étudiant
  static Etudiant? meilleurEtudiant(List<Etudiant> etudiants) {
    if (etudiants.isEmpty) return null;
    
    Etudiant meilleur = etudiants[0];
    for (var etudiant in etudiants) {
      if (etudiant.calculerMoyenne() > meilleur.calculerMoyenne()) {
        meilleur = etudiant;
      }
    }
    return meilleur;
  }
}

void main() {
  // Création des étudiants
  var etudiant1 = Etudiant(nom: 'Dupont', matricule: 'ET001');
  var etudiant2 = Etudiant(nom: 'Martin', matricule: 'ET002');
  var etudiant3 = Etudiant(nom: 'Durand', matricule: 'ET003');

  // Ajout des notes
  etudiant1.ajouterNote(15.5);
  etudiant1.ajouterNote(18.0);
  etudiant1.ajouterNote(12.5);

  etudiant2.ajouterNote(14.0);
  etudiant2.ajouterNote(16.5);
  etudiant2.ajouterNote(19.0);

  etudiant3.ajouterNote(17.5);
  etudiant3.ajouterNote(19.5);
  etudiant3.ajouterNote(20.0);

  // Affichage des bulletins
  etudiant1.afficherBulletin();
  etudiant2.afficherBulletin();
  etudiant3.afficherBulletin();

  // Recherche du meilleur étudiant
  var listeEtudiants = [etudiant1, etudiant2, etudiant3];
  var meilleur = Etudiant.meilleurEtudiant(listeEtudiants);
  
  if (meilleur != null) {
    print(' Le meilleur étudiant est ${meilleur.nom} avec une moyenne de ${meilleur.calculerMoyenne()}/20');
  }
}