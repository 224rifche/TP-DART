class Employe {
  static int _nombreEmployes = 0;
  String nom;
  double salaireBase;

  Employe(this.nom, this.salaireBase) {
    _nombreEmployes++;
  }

  double calculerSalaire() {
    return salaireBase;
  }

  static int getNombreEmployes() {
    return _nombreEmployes;
  }
}

class EmployeHoraire extends Employe {
  int heuresTravail;
  double tauxHoraire;

  EmployeHoraire(String nom, double salaireBase, this.heuresTravail, this.tauxHoraire)
      : super(nom, salaireBase);

  @override
  double calculerSalaire() {
    return heuresTravail * tauxHoraire + salaireBase;
  }
}

class EmployeCommission extends Employe {
  double ventes;
  double tauxCommission;

  EmployeCommission(String nom, double salaireBase, this.ventes, this.tauxCommission)
      : super(nom, salaireBase);

  @override
  double calculerSalaire() {
    return salaireBase + (ventes * tauxCommission);
  }
}

void afficherFicheSalaire(Employe e) {
  print('Fiche de paie');
  print('-------------');
  print('Nom: ${e.nom}');
  print('Type: ${e.runtimeType}');
  print('Salaire de base: ${e.salaireBase} €');
  print('Salaire total: ${e.calculerSalaire().toStringAsFixed(2)} €');
  print('-------------------\n');
}

void main() {
  // Création d'employés de différents types
  var employes = [
    EmployeHoraire('Jean Dupont', 1200, 160, 15.0),
    EmployeCommission('Marie Martin', 1500, 10000, 0.1),
    EmployeHoraire('Pierre Durand', 1300, 180, 12.5),
    EmployeCommission('Sophie Bernard', 1400, 15000, 0.08)
  ];

  // Affichage des fiches de salaire
  for (var employe in employes) {
    afficherFicheSalaire(employe);
  }

  // Affichage du nombre total d'employés
  print('Nombre total d\'employés: ${Employe.getNombreEmployes()}');
}