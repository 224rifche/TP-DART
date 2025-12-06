//LA CLASSE VOITURE

class Voiture {
  String marque;
  String modele;
  int annee;
  double kilometrage;
  bool enMarche;

  // LE CONSTRUCTEURS NOMME
  Voiture({
    required this.marque,
    required this.modele,
    required this.annee,
    required this.kilometrage,
    required this.enMarche,
  });

  // methode pour demarrer la voiture

  void demarrer() {
    enMarche = true;
    print("$marque $modele est maintenant démarrer ");
  }

  // methode pour arreter la voiture

  void arreter() {
    enMarche = false;
    print("$marque $modele est maintenant arreter");
  }

  // methode pour afficher les info de la voiture

  void afficherInfo() {
    print("----------- Infos Voiture ------------");
    print("Marque      : $marque");
    print("Modèle      : $modele");
    print("Année       : $annee");
    print("Kilometrage : $kilometrage");

    print("En marche   :${enMarche ? "OUI" : "NON"}");

    print("-------------------------------");
  }
// Methode qui calcul l'age de la voiture
  int age() {
    int anneeActuelle = DateTime.now().year;
    return anneeActuelle - annee;
  }
}



void main(){
  //creation de plusieurs Voitures

  var voiture1 = Voiture(
    marque: "Toyota",
    modele: "Cordolla",
    annee: 2015,
    kilometrage: 12000, 
    enMarche: false,
  );

   voiture1.afficherInfo();
  voiture1.demarrer();
  voiture1.afficherInfo();
  voiture1.arreter();
  voiture1.afficherInfo();
  print("Âge de la voiture: est ${voiture1.age()}  ans");
}


