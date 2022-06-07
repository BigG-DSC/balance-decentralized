import 'package:balance/screens/res/colors.dart';
import 'package:flutter/material.dart';
import 'item_reviews_page.dart';

class CircleScreen extends StatefulWidget
{
  @override
  _CircleScreenState createState() => _CircleScreenState();
}

class _CircleScreenState extends State<CircleScreen>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Your Security Network'),
      ),
      body: ListView
      (
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>
        [
          Container
          (
            margin: EdgeInsets.fromLTRB(54, 16, 54.0, 0.0),
            child: Material
            (
              elevation: 8.0,
              color: BColors.colorPrimary,
              borderRadius: BorderRadius.circular(32.0),
              child: InkWell
              (
                onTap: () {},
                child: Padding
                (
                  padding: EdgeInsets.all(12.0),
                  child: Row
                  (
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>
                    [
                      Icon(Icons.add, color: Colors.white),
                      Padding(padding: EdgeInsets.only(right: 16.0)),
                      Text('Add a New Member', style: TextStyle(color: Colors.white))
                    ],
                  ),
                ),
              ),
            )
          ),
          ShopItem(),
          ShopItem(),
          ShopItem(),
          ShopItem(),
          ShopItem(),
          SizedBox(height: 32),
        ],
      )
    );
  }
}

class ShopItem extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return Padding
    (
      padding: EdgeInsets.only(bottom: 0),
      child: Stack
      (
        children: <Widget>
        [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.only(top: 24.0),
              child: Material(
                elevation: 14.0,
                borderRadius: BorderRadius.circular(12.0),
                shadowColor: Color(0x802196F3),
                color: Colors.white,
                child: InkWell(
                  onTap: () => {},
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>
                      [
                        /// Peer Name
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text('Peer 1', style: TextStyle(color: Colors.blueAccent))
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        /// Status
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>
                          [
                            Padding
                              (
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Text("STATUS:", style: TextStyle(fontWeight: FontWeight.w700)),
                            ),
                            Padding
                              (
                              padding: EdgeInsets.symmetric(horizontal: 4.0),
                              child: Material
                                (
                                borderRadius: BorderRadius.circular(8.0),
                                color: Colors.green,
                                child: Padding
                                  (
                                  padding: EdgeInsets.all(4.0),
                                  child: Text('Online', style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
