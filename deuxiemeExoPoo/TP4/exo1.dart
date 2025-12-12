import 'dart:io'; 

// Liste globale pour stocker les contacts

List<Map<String, String>> contacts = [];

// 1. Fonction pour ajouter un contact
void ajouterContact({
  required String nom,
  required String email,
  required String telephone,
}) {
  // Vérifier si le contact existe déjà
  if (contacts.any((contact) => contact['nom']?.toLowerCase() == nom.toLowerCase())) {
    print('Erreur: Un contact avec le nom "$nom" existe déjà.');
    return;
  }

  // Ajouter le nouveau contact
  contacts.add({
    'nom': nom,
    'email': email,
    'telephone': telephone,
  });
  print('Contact "$nom" ajouté avec succès!');
}

// 2. Fonction pour afficher tous les contacts
void afficherContacts() {
  if (contacts.isEmpty) {
    print('Aucun contact enregistré.');
    return;
  }

  print('\n=== LISTE DES CONTACTS ===');
  for (var contact in contacts) {
    print('''
Nom: ${contact['nom']}
Email: ${contact['email']}
Téléphone: ${contact['telephone']}
---''');
  }
}

// 3. Fonction pour rechercher un contact
void rechercherContact(String nom) {
  final contactTrouve = contacts.firstWhere(
    (contact) => contact['nom']?.toLowerCase() == nom.toLowerCase(),
    orElse: () => {},
  );

  if (contactTrouve.isNotEmpty) {
    print('\nContact trouvé:');
    print('Nom: ${contactTrouve['nom']}');
    print('Email: ${contactTrouve['email']}');
    print('Téléphone: ${contactTrouve['telephone']}');
  } else {
    print('Aucun contact trouvé avec le nom "$nom".');
  }
}

// 4. Fonction pour supprimer un contact
void supprimerContact(String nom) {
  final initialCount = contacts.length;
  contacts.removeWhere((contact) => contact['nom']?.toLowerCase() == nom.toLowerCase());
  
  if (contacts.length < initialCount) {
    print('Contact "$nom" supprimé avec succès!');
  } else {
    print('Aucun contact trouvé avec le nom "$nom".');
  }
}

// Fonction pour afficher le menu
void afficherMenu() {
  print('''
=== GESTIONNAIRE DE CONTACTS ===
1. Afficher tous les contacts
2. Ajouter un contact
3. Rechercher un contact
4. Supprimer un contact
5. Quitter
  ''');
}

void main() {
  print('Bienvenue dans le Gestionnaire de Contacts!');
  
  while (true) {
    afficherMenu();
    print('Choisissez une option (1-5): ');
    final choix = int.tryParse(stdin.readLineSync() ?? '0') ?? 0;

    switch (choix) {
      case 1:
        afficherContacts();
        break;
      case 2:
        print('Ajout d\'un nouveau contact:');
        print('Nom: ');
        final nom = stdin.readLineSync() ?? '';
        print('Email: ');
        final email = stdin.readLineSync() ?? '';
        print('Téléphone: ');
        final telephone = stdin.readLineSync() ?? '';
        ajouterContact(nom: nom, email: email, telephone: telephone);
        break;
      case 3:
        print('Entrez le nom à rechercher: ');
        final nomRecherche = stdin.readLineSync() ?? '';
        rechercherContact(nomRecherche);
        break;
      case 4:
        print('Entrez le nom du contact à supprimer: ');
        final nomSupprimer = stdin.readLineSync() ?? '';
        supprimerContact(nomSupprimer);
        break;
      case 5:
        print('Au revoir!');
        return;
      default:
        print('Option invalide. Veuillez réessayer.');
    }
    print('\nAppuyez sur Entrée pour continuer...');
    stdin.readLineSync();
  }
}