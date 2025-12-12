/*void afficherInfo({required String nom, required int age}) {
print('Nom : $nom, Âge : $age');
}


void main() {
afficherInfo(nom: 'Jean', age: 25); // Nom : Jean, Âge : 25
}*/

/*void afficherMessage({String message = 'Aucun message'}) {
print(message);
}
void main() {
afficherMessage(); // Aucun message
afficherMessage(message: 'Salut'); // Salut
afficherMessage(message: 'CHERIF');
}*/

/*String diviser(String a) {
  return a;
}

void main() {
  print(diviser('cherif')); // Affiche 5.0
}*/

/*Stream<int> compter() async* {
for (int i = 1; i <= 3; i++) {
await Future.delayed(Duration(seconds: 1));
yield i; // Envoie chaque valeur dans le flux
}
}
void main() async {
await for (var nombre in compter()) {
print('Valeur reçue : $nombre');
}
}*/


class Personne {
String nom;
int age;
Personne(this.nom, this.age);
Personne.jeune(this.nom) : age = 18; // Constructeur nommé
}
void main() {
Personne p1 = Personne('Alice', 25);
Personne p2 = Personne.jeune('Charlie');
print('${p1.nom} a ${p1.age} ans.');
print('${p2.nom} a ${p2.age} ans.');
}