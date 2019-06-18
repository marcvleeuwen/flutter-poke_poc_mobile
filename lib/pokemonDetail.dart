import 'package:flutter/material.dart';
import 'package:poke_poc_mobile/pokemon.dart';

import 'widgets/detailsBody.widget.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
            elevation: 0.0,
            title: Text(pokemon.name),
            backgroundColor: Colors.indigo,
            actions: <Widget>[
              Center(
                  child: Text(
                '#${pokemon.id}  ',
                style: TextStyle(color: Colors.white),
              )),
            ]),
        body: OrientationBuilder(builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? bodyWidgetPortrait(context, pokemon)
              : bodyWidgetLandscape(context, pokemon);
        }));
  }
}
