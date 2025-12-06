class Produit {
  final int id;
  final String nom;
  final double prixUnitaire;

  Produit({
    required this.id,
    required this.nom,
    required this.prixUnitaire,
  });

  @override
  String toString() => '$nom (${prixUnitaire.toStringAsFixed(2)} €)';
}

class Commande {
  final String idCommande;
  final List<Produit> produits;
  final DateTime date;
  String statut;

  // Constructeur par défaut
  Commande({
    required this.idCommande,
    List<Produit>? produits,
    DateTime? date,
    this.statut = 'En cours',
  })  : produits = produits ?? [],
        date = date ?? DateTime.now();

  // Constructeur nommé
  Commande.enCours({required String id, List<Produit>? produits})
      : this(
          idCommande: id,
          produits: produits,
          statut: 'En cours',
        );

  // Ajouter un produit
  void ajouterProduit(Produit produit) {
    produits.add(produit);
    print('Produit ajouté : ${produit.nom}');
  }

  // Supprimer un produit par ID
  bool supprimerProduit(int id) {
    final initialLength = produits.length;
    produits.removeWhere((produit) => produit.id == id);
    final removed = initialLength != produits.length;
    if (removed) {
      print('Produit avec ID $id supprimé');
    } else {
      print('Aucun produit trouvé avec l\'ID $id');
    }
    return removed;
  }

  // Calculer le total de la commande
  double calculerTotal() {
    return produits.fold(0, (total, produit) => total + produit.prixUnitaire);
  }

  // Afficher les détails de la commande
  void afficherDetails() {
    print('\n=== Détails de la commande ===');
    print('ID Commande: $idCommande');
    print('Date: ${date.toString().split('.')[0]}');
    print('Statut: $statut');
    print('\nProduits commandés:');
    for (var produit in produits) {
      print('- ${produit.nom}: ${produit.prixUnitaire.toStringAsFixed(2)} €');
    }
    print('----------------------------');
    print('Total: ${calculerTotal().toStringAsFixed(2)} €');
    print('============================\n');
  }

  // Valider la commande
  void valider() {
    if (statut == 'Livrée') {
      print('La commande est déjà livrée !');
      return;
    }
    
    statut = 'Livrée';
    final now = DateTime.now();
    print('''
=== Commande validée ===
ID Commande: $idCommande
Date de validation: ${now.toString().split('.')[0]}
Statut: $statut
''');
  }
}

void main() {
  // Création de quelques produits
  final produit1 = Produit(id: 1, nom: 'Smartphone', prixUnitaire: 699.99);
  final produit2 = Produit(id: 2, nom: 'Écouteurs', prixUnitaire: 129.99);
  final produit3 = Produit(id: 3, nom: 'Étui', prixUnitaire: 29.99);

  // Création d'une commande avec le constructeur nommé
  final commande = Commande.enCours(id: 'CMD-2023-001');
  
  // Ajout de produits
  commande.ajouterProduit(produit1);
  commande.ajouterProduit(produit2);
  commande.ajouterProduit(produit3);
  
  // Affichage des détails
  commande.afficherDetails();
  
  // Suppression d'un produit
  commande.supprimerProduit(2);  // Supprime les écouteurs
  
  // Affichage après suppression
  commande.afficherDetails();
  
  // Validation de la commande
  commande.valider();
  
  // Tentative de validation d'une commande déjà validée
  commande.valider();
}