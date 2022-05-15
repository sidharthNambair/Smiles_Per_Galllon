import 'package:smiles_per_gallon/extra/exports.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    LayoutState.tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        controller: LayoutState.scrollController,
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, bool isbool) {
          return [
            HomeAppBarWidget(
              tabController: LayoutState.tabController,
            )
          ];
        },
        body: TabBarView(
          controller: LayoutState.tabController,
          children: <Widget>[
            const NewsScreen(),
            SizedBox(
              width: size.width,
              height: size.height,
              child: const ArticlesPage(),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: const FormPage(),
            ),
            SizedBox(
              width: size.width,
              height: size.height,
              child: const ClassiFiedsPage(),
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          DraggableScrollableSheet(
            initialChildSize: 0.5,
            minChildSize: 0.5,
            maxChildSize: 1,
            snap: true,
            snapSizes: const [0.5,0.6,0.7,0.8,0.9,1.0],
            controller: LayoutState.dragableScrollableSheetController,
            builder: (context, scrollController) {
        return Container(
          height: 300,
          color: grey,
        );
      }),
    );
  }
}
