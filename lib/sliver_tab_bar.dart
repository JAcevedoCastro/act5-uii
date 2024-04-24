import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  State<SliverTabBar> createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://cdn.pixabay.com/photo/2014/11/03/17/40/leopard-515509_640.jpg";

  List<String> miImages = [
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818",
    "https://img.global.news.samsung.com/mx/wp-content/uploads/2022/03/Galaxy-A-Unpacked_press-release_main4.jpg",
    "https://m.media-amazon.com/images/I/51g+l3guchL._AC_UF894,1000_QL80_.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbap6rWZ5PuNnhhydILpfcZjnQ-HLVUmrHh4BQ67szug&s",
  ];

  void tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void dispose() {
    tabController!.removeListener(tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController!.addListener(tabListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 360.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Celulares",
                style: TextStyle(color: Colors.black, fontSize: 36),
              ),
              background: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 8.0,
            backgroundColor: const Color(0xffffffff),
            title: Align(
              alignment: AlignmentDirectional.center,
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.deepPurple,
                isScrollable: true,
                tabs: const [
                  Tab(text: "Iphone"),
                  Tab(text: "Samsung"),
                  Tab(text: "Xiaomi"),
                  Tab(text: "Hawuei"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800.0,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text(
                        "Marca	Apple Nombre del modelo	MGLN3LL/A Operador inalámbrico	Todas las empresas de transportes Sistema operativo	iOS 14 Tecnología celular	5G Capacidad de almacenamiento de la memoria	128 GB"),
                    Text(
                        "Marca	SAMSUNG Nombre del modelo	Samsung Galaxy M34 5G Operador inalámbrico	Desbloqueado Sistema operativo	ANDROID Tecnología celular	5G Capacidad de almacenamiento de la memoria	128 GB"),
                    Text(
                        "Marca	Xiaomi Nombre del modelo	M5s Operador inalámbrico	Desbloqueado Sistema operativo	Android 12.0 Tecnología celular	2G, 3G, 4G Capacidad de almacenamiento de la memoria	256 GB"),
                    Text(
                        "Marca	HUAWEI Nombre del modelo	nova 12i Operador inalámbrico	Todas las empresas de transportes Sistema operativo	EMUI 14 Tecnología celular	4G Capacidad de almacenamiento de la memoria	128 GB"),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
