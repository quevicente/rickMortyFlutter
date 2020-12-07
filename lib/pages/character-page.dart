import 'package:flutter/material.dart';
import 'package:flutterfinal/models/character-model.dart';
import 'package:flutterfinal/pages/home-page.dart';

class CharacterPage extends StatelessWidget {
  CharacterModel _characterModel;
  CharacterPage(this._characterModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Text(_characterModel.name),
        ),
        body: CardIndividual(_characterModel));
  }
}

class CardIndividual extends StatelessWidget {
  CharacterModel _characterModel;
  CardIndividual(this._characterModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.green[100],
        shadowColor: Colors.green[800],
        margin: EdgeInsets.all(16),
        child: Container(
          height: MediaQuery.of(context).size.shortestSide,
          width: double.infinity,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_characterModel.name}",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    Text(
                      "Espécie: ${_characterModel.species}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Status: ${_characterModel.status}",
                      style: TextStyle(fontSize: 16),
                    ),
                    Card(
                      shadowColor: Colors.black,
                      child: Image.network(_characterModel.image,
                          cacheHeight:
                              MediaQuery.of(context).size.shortestSide.toInt(),
                          cacheWidth:
                              MediaQuery.of(context).size.shortestSide.toInt()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
