// main.dart
import 'dart:io';
import 'calculs.dart' as calc;

void main() {
  bool continuer = true;
  
  while (continuer) {
    print('\n=== CALCULATEUR SCIENTIFIQUE ===');
    print('1. Carré d\'un nombre');
    print('2. Racine carrée');
    print('3. Puissance');
    print('4. Moyenne de nombres');
    print('5. Quitter');
    print('==============================');
    
    stdout.write('Votre choix (1-5) : ');
    final choix = stdin.readLineSync();
    
    switch (choix) {
      case '1':
        print('\n=== CARRÉ D\'UN NOMBRE ===');
        stdout.write('Entrez un nombre : ');
        final x = double.parse(stdin.readLineSync()!);
        print('Le carré de $x est ${calc.carre(x)}');
        break;
        
      case '2':
        print('\n=== RACINE CARRÉE ===');
        stdout.write('Entrez un nombre : ');
        final x = double.parse(stdin.readLineSync()!);
        print('La racine carrée de $x est ${calc.racine(x)}');
        break;
        
      case '3':
        print('\n=== PUISSANCE ===');
        stdout.write('Entrez la base : ');
        final base = double.parse(stdin.readLineSync()!);
        stdout.write('Entrez l\'exposant (entier) : ');
        final exp = int.parse(stdin.readLineSync()!);
        print('$base^$exp = ${calc.puissance(base, exp)}');
        break;
        
      case '4':
        print('\n=== MOYENNE ===');
        print('Entrez les nombres séparés par des espaces :');
        final nombres = stdin.readLineSync()!
            .split(' ')
            .where((s) => s.isNotEmpty)
            .map(double.parse)
            .toList();
        print('La moyenne est ${calc.moyenne(nombres)}');
        break;
        
      case '5':
        continuer = false;
        break;
        
      default:
        print('Choix invalide. Veuillez réessayer.');
    }
  }
  
  print('Au revoir !');
}