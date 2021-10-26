import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:phi_dog/anmeldung/auth.dart';
import 'package:phi_dog/main.dart';
import 'package:phi_dog/widget/drop_down_menu_widget.dart';
import 'package:provider/provider.dart';
import 'selected_dog_class.dart';
import 'util/theme_notifier.dart';

final Color backgroundColor = Color(0xFFE0FFFF);
final Color backgroundColor2 = Color(0xFFE0FFF3);

final AuthService _auth = AuthService();

class MenuDashboardPage extends StatefulWidget {
  @override
  _MenuDashboardPageState createState() => _MenuDashboardPageState();
}

class _MenuDashboardPageState extends State<MenuDashboardPage>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  double? screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;

  TextEditingController? _controllerText;

  bool checkrs = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller!);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
    _controllerText = TextEditingController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<ThemeNotifier>(context);
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: <Widget>[
          menu(context, bloc),
          dashboard(context, _controllerText!),
        ],
      ),
    );
  }

  Widget menu(context, bloc) {
    return SlideTransition(
      position: _slideAnimation!,
      child: ScaleTransition(
        scale: _menuScaleAnimation!,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              // Menueleiste
              children: <Widget>[
                //CircleAvatar(
                //backgroundColor: Colors.transparent,
                //backgroundImage: NetworkImage(
                //    'assets/images/phitranslight.png'),
                //radius: 50,
                // ),
                //Container(child:
                //Image.asset("assets/images/phitranslight.png"),
                //  height: 140,
                //width: 180,
                //),
                //Expanded(child:
                // Container(),
                //                    ),
                Text('Intro',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20)),
                SizedBox(height: 15),
                Text('Tagesbedarfsrechner',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20)),
                SizedBox(height: 15),
                Text('Vergiftungsrechner',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20)),
                SizedBox(height: 15),
                Text('Unterstützen',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20)),
                SizedBox(height: 15),
                Text('Impressum',
                    style: TextStyle(
                        color: Theme.of(context).accentColor, fontSize: 20)),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width*.3,
//                       child: DropDownMenu(
//                         value: bloc.selected ?? keytheme,
//                         listMenue: _list,
//                         onPressed:(value) => bloc.setSelectedItem(value),
//                       ),
//                     ),
                Switch(
                  value: bloc.selected ?? keytheme,
                  onChanged: (bool value) {
                    bloc.setSelectedItem(value);
                  },
                ),
                //Expanded(child:
                //Container(),
                //),
                FlatButton.icon(
                  icon: Icon(Icons.person, color: Colors.red),
                  label: Text('Abmelden',
                      style: TextStyle(fontSize: 16, color: Colors.red)),
                  onPressed: () async {
                    await _auth.signOut();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context, TextEditingController _textEdit) {
    final bloc = Provider.of<ThemeNotifier>(context);
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth!,
      right: isCollapsed ? 0 : -0.2 * screenWidth!,
      child: GestureDetector(
        onTap: () {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },
        child: ScaleTransition(
          scale: _scaleAnimation!,
          child: Material(
            borderRadius:
                BorderRadius.all(Radius.circular(isCollapsed ? 0 : 40)),
            elevation: 8,
            color: Theme.of(context).backgroundColor,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              // dashboard Feld
              child: Container(
//                        padding:const EdgeInsets.only(left: 16, right: 16, top: 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).appBarTheme.color,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(isCollapsed ? 0 : 40)),
                      ),
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, top: 24, bottom: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            child: Icon(Icons.menu,
                                color: Theme.of(context).accentColor),
                            onTap: () {
                              setState(() {
                                if (isCollapsed) {
                                  _controller!.forward();
                                } else {
                                  _controller!.reverse();
                                }
                                isCollapsed = !isCollapsed;
                              });
                            },
                          ),
                          Text('Phi-Dog',
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Theme.of(context).accentColor,
                                  fontFamily: 'Komika')),
                          Icon(Icons.settings,
                              color: Theme.of(context).accentColor),
                          //FlatButton.icon(
                          //icon: Icon(Icons.person),
                          //label: Text('Abmelden'),
                          //onPressed: () async {
                          //await _auth.signOut();
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Auswahlfelder',
                        style: TextStyle(
                            color: Theme.of(context).accentColor, fontSize: 20),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: EdgeInsets.only(left: 16.0),
//                              child: ListView.separated(
//                                shrinkWrap: true,
//                                  itemBuilder: (context, index) {
//                                    return ListTile(
//                                      title: Text('Auswahl'),
//                                      subtitle: Text('Wähle deine Art'),
//                                        //trailing: Text('-2900')
//                                    );
//                                 }, separatorBuilder: (context, index) {
//                                return Divider(height: 16);
//                                    }, itemCount: 10),
                      child:
//                                checkrs ? Column(
//                                  children: <Widget>[
//                                    Text("Result", style: TextStyle(color: Theme.of(context).accentColor),),
//
//                                  ],
//                                ) :
                          Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 20, top: 50),
                            child: DropDownMenu(
                              value: bloc.selectedDog ?? bloc.listdog[0],
                              listMenue: bloc.listdog,
                              onPressed: (value) => bloc.setSelectedDog(value!),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .1,
                          ),
                          bloc.selectedDog == null
                              ? Container()
                              : Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 10),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .appBarTheme
                                          .backgroundColor,
                                      borderRadius: BorderRadius.circular(6)),
                                  child: TextField(
                                    controller: _textEdit,
                                    onSubmitted: (s) {
                                      _textEdit.text = s + " KG";
                                    },
                                    onTap: () {
                                      _textEdit.text = "";
                                    },
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        hintText: "Enter your dog weight in KG",
                                        hintStyle: TextStyle(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                        )),
                                  ),
                                ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .3,
                          ),
                          //           Container(
                          //             margin: EdgeInsets.only(right: 20,top: 10),
                          //             decoration: BoxDecoration(
                          //               color: Theme.of(context).appBarTheme.color,
                          //               borderRadius: BorderRadius.circular(6)
                          //             ),
                          //             child: TextField(
                          //               controller: _textEdit,
                          //               onSubmitted: (s){
                          //                 _textEdit.text = s+" KG";
                          //               },
                          //               onTap: (){
                          //                 _textEdit.text = "";
                          //               },
                          //               keyboardType: TextInputType.number,
                          //               decoration: InputDecoration(
                          //                   hintText: "Enter your dog weight in KG",
                          //                   hintStyle: TextStyle(color: Theme.of(context).accentColor),
                          //                   border: OutlineInputBorder(
                          //                     borderRadius: BorderRadius.circular(6.0),
                          //                   )
                          //               ),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(right: 20,top: 10),
                          //             child: DropDownMenu(
                          //               value: bloc.selectedDogh ?? "Choose dog height",
                          //               listMenue: _list1,
                          //               onPressed:(value) => bloc.setSelectedDogh(value),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: EdgeInsets.only(right: 20,top: 10),
                          //             child: DropDownMenu(
                          //               value: bloc.selectedDoghLevel ?? "Dog exercise level",
                          //               listMenue: _list2,
                          //               onPressed:(value) => bloc.setSelectedDoghLevel(value),
                          //             ),
                          //           ),
                          Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: RaisedButton(
                                color: Theme.of(context).appBarTheme.color,
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Theme.of(context).accentColor),
                                ),
                                onPressed: bloc.selectedDog == null ||
                                        _textEdit.text.isEmpty
                                    ? null
                                    : () {
                                        bloc.clearEveryState(_textEdit.text);
                                        Navigator.push(
                                            context,
                                            PageTransition(
                                                child: SelectedDig(),
                                                type: PageTransitionType
                                                    .rightToLeft));
                                      },
                              ),
                            ),
                          ),
                        ],
                      ),
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
