import 'package:flutter/material.dart';
import 'package:pokemon/datasource/pokemon_datasource.dart';
import 'package:pokemon/widgets/pokemon_card.dart';

import '../widgets/my_title.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  List<Map?>? pokemonData = PokemonDatasource.pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              Icons.bento_rounded,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyTitle(
              text: "Pokedex",
              color: Colors.black,
            ),
            Expanded(
              flex: 12,
              child: Container(
                child: GridView.builder(
                  itemCount: pokemonData!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 12.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemBuilder: (context, index) => PokemonCard(
                    name: "${pokemonData![index]!["name"]}",
                    types: [
                      pokemonData![index]!.containsKey("type")
                          ? "${pokemonData![index]!["type"]![0]}"
                          : "No Power",
                      // pokemonData![index]!.containsKey("type")
                      //     ? "${pokemonData![index]!["type"][1]}"
                      //     : "No Power",
                    ],
                    imageUrl: "${pokemonData![index]!["img"]}",
                    pokemonMap: pokemonData![index]!,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
