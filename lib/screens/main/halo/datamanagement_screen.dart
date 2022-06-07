import 'dart:io';

import 'package:balance/screens/main/halo/shop_items_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:package_info/package_info.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:url_launcher/url_launcher.dart';

import 'circle/circle_screen.dart';
import 'circle/item_reviews_page.dart';
import 'node/node_screen.dart';

class DataManagementScreen extends StatefulWidget {
  const DataManagementScreen({
    Key key,
  }) : super(key: key);

  @override
  _DataManagementScreenState createState() => _DataManagementScreenState();
}

class _DataManagementScreenState extends State<DataManagementScreen> {

  static final List<String> chartDropdownItems = ['IPFS', 'Blockchain'];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          children: <Widget>[
            _buildTile(
              Padding(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      height: 90,
                      child: Center(
                        child: Image.asset("assets/images/halonode.png"),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Building the InterPlanetary Health Layer\none block at a time'.tr(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700
                          )
                        ),
                      ],
                    ),
                  ],
                )
              ),
              onTap: () async {
                const url = 'https://balancemobile.it';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Halo Network', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                          Text('Your network', style: TextStyle(color: Colors.black45)),
                        ],
                      ),
                      Material
                        (
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.people, color: Colors.white, size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => CircleScreen())),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Colors.green,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(Icons.send_to_mobile, color: Colors.white, size: 30.0),
                          )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Send', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22.0)),
                      Text('Send You Data', style: TextStyle(color: Colors.black45, fontSize: 12.0)),
                    ]
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => NodeScreen())),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Material
                        (
                          color: Colors.teal,
                          shape: CircleBorder(),
                          child: Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Icon(Icons.save_alt, color: Colors.white, size: 30.0),
                          )
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('Recover', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 22.0)),
                      Text('Recover your data', style: TextStyle(color: Colors.black45, fontSize: 12.0)),
                    ]
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => NodeScreen())),
            ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row
                  (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Column
                        (
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>
                        [
                          Text('Access Requests', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 24.0)),
                          SizedBox(height: 4),
                          Text('32', style: TextStyle(color: Colors.black,  fontSize: 18.0))
                        ],
                      ),
                      Material
                        (
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center
                            (
                              child: Padding
                                (
                                padding: EdgeInsets.all(16.0),
                                child: Icon(Icons.queue, color: Colors.white, size: 30.0),
                              )
                          )
                      )
                    ]
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 150.0),
            StaggeredTile.extent(2, 110.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(1, 180.0),
            StaggeredTile.extent(2, 110.0),
          ],
        )
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 2.5,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.black,
        child: InkWell
          (
          // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
            child: child
        )
    );
  }
}