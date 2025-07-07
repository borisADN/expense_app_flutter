import 'package:application/app/constants/colors.dart';
import 'package:application/app/modules/home/views/widgets/info_balance.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<SalesData> chartData = [
    SalesData(DateTime(2010), 400),
    SalesData(DateTime(2011), 50),
    SalesData(DateTime(2012), 340),
    SalesData(DateTime(2013), 322),
    SalesData(DateTime(2014), 408),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [appYellowSoft, appPrimary.withOpacity(0.2)],
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/icons/avatar.jpeg'),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: appPrimary,
                          ),
                          Text("Juin"),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active,
                          color: appPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text('Solde Du Compte'),
                SizedBox(height: 10),
                Text(
                  '10,000',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    // color: appPrimary,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoBalance(isIncome: true, balance: '155000 F'),
                    InfoBalance(isIncome: false, balance: '48500 F'),
                  ],
                ),
                SizedBox(height: 15),
                Expanded(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          "Statistiques",
                          style: TextStyle(
                            // fontSize: 20,
                            fontWeight: FontWeight.bold,
                            // color: appPrimary,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: 200,
                          width: chartData.length * 100,
                          // color: appPrimary,
                          child: SfCartesianChart(
                            primaryXAxis: DateTimeAxis(),
                            series: <CartesianSeries>[
                              // Renders line chart
                              SplineSeries<SalesData, DateTime>(
                                color: appPrimary,
                                width: 4,
                                dataSource: chartData,
                                xValueMapper:
                                    (SalesData sales, _) => sales.year,
                                yValueMapper:
                                    (SalesData sales, _) => sales.sales,
                              ),
                              SplineSeries<SalesData, DateTime>(
                                color: appRed,
                                width: 1,
                                dataSource: chartData,
                                xValueMapper:
                                    (SalesData sales, _) => sales.year,
                                yValueMapper: (SalesData sales, _) => 300,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                              color: appYellowSoft,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Aujourd'hui",
                              style: TextStyle(
                                color: appYellow,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text("Semaine", style: TextStyle(color: appTextSoft)),
                          Text("Mois", style: TextStyle(color: appTextSoft)),
                          Text("Annuel", style: TextStyle(color: appTextSoft)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Transactions Récentes",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                // color: appPrimary,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: appVioletSoft,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "Voir tout",
                                style: TextStyle(
                                  color: appPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      ListView.separated(
                        separatorBuilder:
                            (context, index) => SizedBox(height: 15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 40,
                            ),
                            title: Row(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  margin: EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    color: appYellowSoft,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Image.asset('assets/icons/shop.png'),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Shopping',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '- 11000 F',
                                            style: TextStyle(
                                              color: appRed,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Achat de Fringues',
                                            style: TextStyle(
                                              color: appTextSoft,
                                            ),
                                          ),
                                          Text(
                                            '11h 30',
                                            style: TextStyle(
                                              color: appTextSoft,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: appWhite,
        color: appPrimary,
        activeColor: appPrimary,
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.swap_horiz, title: 'Transaction'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.account_balance_wallet, title: 'Budget'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        onTap: (int i) => () {},
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final DateTime year;
  final double sales;
}
