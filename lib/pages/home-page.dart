import 'package:flutter/material.dart';
import 'package:flutterfinal/models/character-model.dart';
import 'package:flutterfinal/pages/character-page.dart';
import 'package:flutterfinal/services/service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Service _characterService;
  List<CharacterModel> _characterModel;
  int pagina;

  @override
  void initState() {
    super.initState();
    _characterService = Service();
    pagina = 1;
    fetchData();
  }

  void fetchData() async {
    List<CharacterModel> res = await _characterService.getAllCharacters(pagina);

    setState(() {
      _characterModel = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Página $pagina"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined, color: Colors.white),
          onPressed: () {
            if (pagina <= 1) return;
            setState(() {
              pagina--;
              fetchData();
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.chevron_right_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              pagina++;
              fetchData();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _characterModel.length,
              itemBuilder: (context, index) =>
                  CharacterCard(_characterModel[index]),
            )
          ],
        ),
      ),
      backgroundColor: Colors.green[100],
    );
  }
}

class CharacterCard extends StatelessWidget {
  CharacterModel _characterModel;
  CharacterCard(this._characterModel);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CharacterPage(_characterModel))),
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Card(
            child: Container(
              margin: EdgeInsets.all(4),
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4))),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Image.network(_characterModel.image),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_characterModel.name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(_characterModel.species),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
