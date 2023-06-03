import 'package:flutter/material.dart';
import 'package:pokemon/widgets/feature_title_page.dart';
import 'package:pokemon/widgets/feature_value_page.dart';
import 'package:pokemon/widgets/my_title.dart';
import 'package:pokemon/widgets/power_badge.dart';

class DetailsPage extends StatelessWidget {
  final Map data;
  const DetailsPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4ad0b0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: 500.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyTitle(
                                text: "${data["name"]}", color: Colors.white),
                            Row(
                                children:
                                    // PowerBadge(
                                    //   text: data.containsKey("type")
                                    //       ? "${data["type"]![0]}"
                                    //       : "No Power",
                                    // ),
                                    // PowerBadge(
                                    //   text: data.containsKey("type")
                                    //       ? "${data["type"][1]}"
                                    //       : "No Power",
                                    // ),
                                    // for (String item in data!["type"])
                                    //   PowerBadge(text: "$item")
                                    data["type"]
                                        .map<Widget>(
                                            (item) => PowerBadge(text: "$item"))
                                        .toList()),
                            Container(
                              height: 180.0,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(34.0),
                      ),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding: const EdgeInsets.only(top: 75.0),
                              height: double.infinity,
                              child: Column(
                                children: [
                                  FeatureTitleText(text: "Height"),
                                  FeatureTitleText(text: "Weight"),
                                  // FeatureTitleText(text: "Candy"),
                                  FeatureTitleText(text: "Candy Count"),
                                  FeatureTitleText(text: "Egg"),
                                  FeatureTitleText(text: "Spawn Chance"),
                                  FeatureTitleText(text: "Avg Spawns"),
                                  FeatureTitleText(text: "Spawm Time"),
                                  // // FeatureTitleText(text: "Multipliers"),
                                  // // FeatureTitleText(text: "Next Evolution"),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.only(top: 75.0),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FeatureValueText(text: "${data["height"]}"),
                                  FeatureValueText(text: "${data["weight"]}"),
                                  // FeatureValueText(text: "${data["candy"]}"),
                                  FeatureValueText(
                                      text: "${data["candy_count"]}"),
                                  FeatureValueText(text: "${data["egg"]}"),
                                  FeatureValueText(
                                      text: "${data["spawn_chance"]}"),
                                  FeatureValueText(
                                      text: "${data["avg_spawns"]}"),
                                  FeatureValueText(
                                      text: "${data["spawn_time"]}"),

                                  // // FeatureValueText(
                                  // //     text: "${data["weaknesses"]}"),
                                  FeatureValueText(
                                      text: "${data["next_evolution"]}"),
                                  //FeatureValueText(
                                  //
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 160.0,
            child: Hero(
              tag: 'PokeCard-${data["name"]}',
              child: Image.network(
                "${data["img"]}",
                height: 200.0,
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
}
