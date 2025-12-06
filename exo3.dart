// Classe de base CompteBancaire
class CompteBancaire {
  // Attributs privés
  final String _numero;
  String _proprietaire;
  double _solde;

  // Constructeur
  CompteBancaire(this._numero, this._proprietaire, [this._solde = 0.0]);

  // Getters
  String get numero => _numero;
  String get proprietaire => _proprietaire;
  double get solde => _solde;

  // Setters
  set proprietaire(String nouveauProprietaire) {
    if (nouveauProprietaire.trim().isNotEmpty) {
      _proprietaire = nouveauProprietaire;
    }
  }

  // Méthodes
  void deposer(double montant) {
    if (montant > 0) {
      _solde += montant;
      print('Dépôt de $montant € effectué. Nouveau solde: ${_solde.toStringAsFixed(2)} €');
    } else {
      print('Erreur: Le montant doit être supérieur à 0');
    }
  }

  bool retirer(double montant) {
    if (montant <= 0) {
      print('Erreur: Le montant doit être supérieur à 0');
      return false;
    }
    if (montant <= _solde) {
      _solde -= montant;
      print('Retrait de $montant € effectué. Nouveau solde: ${_solde.toStringAsFixed(2)} €');
      return true;
    }
    print('Erreur: Solde insuffisant');
    return false;
  }

  void afficherSolde() {
    print('\n=== Relevé de compte ===');
    print('Numéro: $_numero');
    print('Propriétaire: $_proprietaire');
    print('Solde: ${_solde.toStringAsFixed(2)} €');
    print('========================\n');
  }

  // Méthode de virement
  static bool virement(CompteBancaire source, CompteBancaire destination, double montant) {
    if (montant <= 0) {
      print('Erreur: Le montant doit être supérieur à 0');
      return false;
    }
    
    if (source.retirer(montant)) {
      destination.deposer(montant);
      print('Virement de $montant € effectué avec succès de ${source._proprietaire} vers ${destination._proprietaire}');
      return true;
    }
    
    print('Échec du virement: fonds insuffisants');
    return false;
  }
}

// Sous-classe CompteEpargne
class CompteEpargne extends CompteBancaire {
  double _tauxInteret; // en pourcentage

  CompteEpargne(String numero, String proprietaire, [double solde = 0.0, double tauxInteret = 1.5])
      : _tauxInteret = tauxInteret,
        super(numero, proprietaire, solde);

  // Getter et setter pour le taux d'intérêt
  double get tauxInteret => _tauxInteret;
  
  set tauxInteret(double nouveauTaux) {
    if (nouveauTaux >= 0) {
      _tauxInteret = nouveauTaux;
    }
  }

  // Appliquer les intérêts
  void appliquerInteret() {
    double interets = _solde * (_tauxInteret / 100);
    _solde += interets;
    print('Intérêts de ${interets.toStringAsFixed(2)} € appliqués (${_tauxInteret}%)');
  }

  @override
  void afficherSolde() {
    super.afficherSolde();
    print('Type: Compte Épargne');
    print('Taux d\'intérêt: ${_tauxInteret}%');
  }
}

// Sous-classe CompteCourant
class CompteCourant extends CompteBancaire {
  double _decouvertAutorise;

  CompteCourant(String numero, String proprietaire, [double solde = 0.0, double decouvert = 500.0])
      : _decouvertAutorise = decouvert,
        super(numero, proprietaire, solde);

  // Getter et setter pour le découvert
  double get decouvertAutorise => _decouvertAutorise;
  
  set decouvertAutorise(double nouveauDecouvert) {
    if (nouveauDecouvert >= 0) {
      _decouvertAutorise = nouveauDecouvert;
    }
  }

  @override
  bool retirer(double montant) {
    if (montant <= 0) {
      print('Erreur: Le montant doit être supérieur à 0');
      return false;
    }
    
    if (montant <= (_solde + _decouvertAutorise)) {
      _solde -= montant;
      print('Retrait de $montant € effectué. Nouveau solde: ${_solde.toStringAsFixed(2)} €');
      if (_solde < 0) {
        print('Attention: Découvert de ${_solde.abs().toStringAsFixed(2)} €');
      }
      return true;
    }
    
    print('Erreur: Découvert maximum atteint (${_decouvertAutorise} €)');
    return false;
  }

  @override
  void afficherSolde() {
    super.afficherSolde();
    print('Type: Compte Courant');
    print('Découvert autorisé: ${_decouvertAutorise.toStringAsFixed(2)} €');
    if (_solde < 0) {
      print('Attention: Découvert de ${_solde.abs().toStringAsFixed(2)} €');
    }
  }
}

void main() {
  // Création des comptes
  var compteEpargne = CompteEpargne('E001', 'Alice Dupont', 1000.0, 2.5);
  var compteCourant = CompteCourant('C001', 'Bob Martin', 500.0, 300.0);

  // Dépôts et retraits
  compteEpargne.deposer(200.0);
  compteEpargne.retirer(100.0);
  compteEpargne.appliquerInteret();
  compteEpargne.afficherSolde();

  // Test du découvert
  compteCourant.retirer(700.0);  // Devrait fonctionner (500 + 300 de découvert)
  compteCourant.retirer(200.0);  // Devrait échouer (dépassement du découvert)
  compteCourant.afficherSolde();

  // Test de virement
  print('\n=== Test de virement ===');
  CompteBancaire.virement(compteEpargne, compteCourant, 300.0);
  compteEpargne.afficherSolde();
  compteCourant.afficherSolde();
}