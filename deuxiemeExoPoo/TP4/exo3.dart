import 'dart:io';

void main() {
  // Fonctions anonymes stockées dans une Map
  final Map<String, dynamic> statistiques = {
    'somme': (List<int> nombres) => nombres.reduce((a, b) => a + b),
    'moyenne': (List<int> nombres) => nombres.reduce((a, b) => a + b) / nombres.length,
    'maximum': (List<int> nombres) => nombres.reduce((a, b) => a > b ? a : b),
    'minimum': (List<int> nombres) => nombres.reduce((a, b) => a < b ? a : b),
  };

  // Saisie des nombres
  final nombres = <int>[];
  print('Entrez des nombres entiers (tapez "fin" pour terminer) :');
  
  while (true) {
    final entree = stdin.readLineSync()?.trim() ?? '';
    if (entree.toLowerCase() == 'fin') break;
    
    final nombre = int.tryParse(entree);
    if (nombre != null) {
      nombres.add(nombre);
    } else {
      print('Veuillez entrer un nombre valide ou "fin" pour terminer.');
    }
  }

  if (nombres.isEmpty) {
    print('Aucun nombre saisi. Fin du programme.');
    return;
  }

  // Menu interactif
  while (true) {
    print('\n=== MENU STATISTIQUES ===');
    print('Nombres actuels: $nombres\n');
    
    // Afficher les options disponibles
    statistiques.forEach((cle, _) {
      print('$cle');
    });
    print('tous - Afficher toutes les statistiques');
    print('quitter - Quitter le programme');
    
    print('\nChoisissez une option : ');
    final choix = stdin.readLineSync()?.toLowerCase().trim() ?? '';
    
    if (choix == 'quitter') {
      print('Au revoir !');
      break;
    }
    
    if (choix == 'tous') {
      // Afficher toutes les statistiques
      print('\n=== RÉSULTATS ===');
      print('Nombres: $nombres');
      print('------------------');
      
      statistiques.forEach((cle, fonction) {
        final resultat = fonction(List<int>.from(nombres));
        print('${cle[0].toUpperCase() + cle.substring(1)}: $resultat');
      });
      
      print('------------------');
    } 
    else if (statistiques.containsKey(choix)) {
      // Afficher une seule statistique
      final resultat = statistiques[choix](List<int>.from(nombres));
      print('\n=== RÉSULTAT ===');
      print('${choix[0].toUpperCase() + choix.substring(1)}: $resultat');
    } 
    else {
      print('Option invalide. Veuillez réessayer.');
    }
    
    print('\nAppuyez sur Entrée pour continuer...');
    stdin.readLineSync();
  }
}