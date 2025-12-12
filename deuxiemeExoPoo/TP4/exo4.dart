import 'dart:async';

// Fonction pour simuler un téléchargement avec une barre de progression
Future<void> telechargerFichier(String nom, int secondes) async {
  print('Téléchargement de $nom...');
  
  final totalTicks = 5;  // Réduit pour accélérer l'affichage
  final tickDuration = Duration(seconds: secondes ~/ totalTicks);
  
  for (var i = 0; i <= totalTicks; i++) {
    final pourcentage = (i * 100) ~/ totalTicks;
    final barre = '#' * i + ' ' * (totalTicks - i);
    print('[$barre] $pourcentage%');
    
    if (i < totalTicks) {
      await Future.delayed(tickDuration);
    }
  }
  
  print('$nom téléchargé avec succès en $secondes secondes.\n');
}

// Fonction principale
Future<void> main() async {
  print('=== DÉMARRAGE DES TÉLÉCHARGEMENTS ===\n');
  
  final telechargements = {
    'image.jpg': 2,
    'document.pdf': 3,
    'musique.mp3': 4,
  };
  
  final debut = DateTime.now();
  
  try {
    // Démarrer tous les téléchargements en parallèle
    await Future.wait(
      telechargements.entries.map((entry) => telechargerFichier(entry.key, entry.value))
    );
    
    final duree = DateTime.now().difference(debut).inSeconds;
    print('=== TÉLÉCHARGEMENTS TERMINÉS ===');
    print('Tous les fichiers ont été téléchargés en $duree secondes !');
  } catch (e) {
    print('\nErreur lors du téléchargement: $e');
  }
}