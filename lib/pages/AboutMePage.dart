import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AboutMePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<SharedPreferences>(
          future: SharedPreferences.getInstance(),
          builder: (BuildContext context,
              AsyncSnapshot<SharedPreferences> snapshot) {
            if (snapshot.hasData) {
              final prefs = snapshot.data!;
              final username = prefs.getString("username") ?? ""; // Obtenez la valeur de "username" ou une chaîne vide si elle n'est pas définie

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('images/ismahen.jpeg'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Mobile App Developer',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "En tant que perfectionniste et créatif, j'ai plaisir à apporter une valeur ajoutée et à contribuer à l'amélioration de ce qui existe déjà. Je suis également dynamique et je préfère travailler en équipe pour relever des défis techniques. Avec une solide maîtrise des outils de développement, je suis constamment en quête de nouvelles connaissances et compétences.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
