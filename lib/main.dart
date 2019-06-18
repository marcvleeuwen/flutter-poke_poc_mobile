import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_poc_mobile/pokemon.dart';
import 'package:poke_poc_mobile/pokemonDetail.dart';

void main() => runApp(MaterialApp(
      title: 'Pokedex POC',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokeHub _pokeHub;
  final url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  @override
  void initState() {
    super.initState();

    fetchPokemonList();
  }

  fetchPokemonList() async {
    var response = await http.get(url);
    var decodedResponse = jsonDecode(response.body);

    _pokeHub = PokeHub.fromJson(decodedResponse);
    setState(() {});
  }

  reloadPokemonList() async {
    _pokeHub = null;
    setState(() {});
    fetchPokemonList();
  }

  showRandomPokemon() {
    var rng = new Random();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokemonDetail(
                  pokemon: _pokeHub
                      .pokemon[rng.nextInt(_pokeHub.pokemon.length - 1)],
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Pokedex'),
          backgroundColor: Colors.indigo,
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                showRandomPokemon();
              },
              child: Text(
                'Random',
                style: TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
          ]),
      body: _pokeHub == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              crossAxisCount: (MediaQuery.of(context).size.width / 175).round(),
              children: _pokeHub.pokemon
                  .map((item) => Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PokemonDetail(
                                          pokemon: item,
                                        )));
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Hero(
                                tag: item.img,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.width * .175,
                                  width:
                                      MediaQuery.of(context).size.width * .175,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(item.img))),
                                ),
                              ),
                              Center(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      )))
                  .toList(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          reloadPokemonList();
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
