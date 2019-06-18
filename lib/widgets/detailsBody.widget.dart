import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:poke_poc_mobile/pokemon.dart';

bodyWidgetPortrait(BuildContext context, Pokemon pokemon) => Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * .75,
          width: MediaQuery.of(context).size.width * .8,
          left: MediaQuery.of(context).size.width * .1,
          top: MediaQuery.of(context).size.height * .1,
          child: Container(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * .05),
                  Text('Heigh: ${pokemon.height}'),
                  Text('Weight: ${pokemon.weight}'),
                  Text('Types', style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: pokemon.type
                        .map((type) => Chip(
                              label: Text(type),
                              backgroundColor: Colors.amberAccent,
                            ))
                        .toList(),
                  ),
                  Text('Weaknesses',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Wrap(
                        direction: Axis.vertical,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: pokemon.weaknesses
                            .map((weakness) => Chip(
                          label: Text(weakness),
                          backgroundColor: Colors.redAccent,
                        ))
                            .toList(),
                      )
                    ],
                  ),
                  pokemon.nextEvolution != null &&
                          pokemon.nextEvolution.length > 0
                      ? Text('Next evolution',
                          style: TextStyle(fontWeight: FontWeight.bold))
                      : Container(),
                  pokemon.nextEvolution != null &&
                          pokemon.nextEvolution.length > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Center(
                              child: Chip(
                                label: Text(pokemon.nextEvolution[0]?.name),
                                backgroundColor: Colors.greenAccent,
                              ),
                            )
                          ],
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              height: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * .4
                  : MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).orientation == Orientation.portrait
                  ? MediaQuery.of(context).size.width * .4
                  : MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
            ),
          ),
        )
      ],
    );

bodyWidgetLandscape(BuildContext context, Pokemon pokemon) => Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * .6,
          width: MediaQuery.of(context).size.width * .8,
          left: MediaQuery.of(context).size.width * .1,
          bottom: MediaQuery.of(context).size.height * .02,
          child: Container(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * .02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Heigh: ${pokemon.height}'),
                      Text('Weight: ${pokemon.weight}'),
                    ],
                  ),
                  Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text('Types',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Column(
                            children: pokemon.type
                                .map((type) => Chip(
                                      label: Text(type),
                                      backgroundColor: Colors.amberAccent,
                                    ))
                                .toList(),
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text('Weaknesses',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Column(children: <Widget>[
                            Wrap(
                              direction: Axis.horizontal,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: pokemon.weaknesses
                                  .map((weakness) => Chip(
                                        label: Text(weakness),
                                        backgroundColor: Colors.redAccent,
                                      ))
                                  .toList(),
                            )
                          ])
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          pokemon.nextEvolution != null &&
                                  pokemon.nextEvolution.length > 0
                              ? Text('Next evolution',
                                  style: TextStyle(fontWeight: FontWeight.bold))
                              : Container(),
                          pokemon.nextEvolution != null &&
                                  pokemon.nextEvolution.length > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Center(
                                      child: Chip(
                                        label: Text(
                                            pokemon.nextEvolution[0]?.name),
                                        backgroundColor: Colors.greenAccent,
                                      ),
                                    )
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              height: MediaQuery.of(context).size.height * .4,
              width: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img))),
            ),
          ),
        )
      ],
    );
