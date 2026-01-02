import 'package:carousel_slider/carousel_slider.dart';
import 'package:english_app/features/home/domain/entities/book_entity.dart';
import 'package:english_app/features/home/presentation/viewmodel/home_viewmodel.dart';
import 'package:english_app/injector.dart';
import 'package:flutter/material.dart';
import 'package:routefly/routefly.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();

    viewModel = getIt<HomeViewModel>();
    viewModel.addListener(_onViewModelChanged);

    viewModel.loadBooks();
  }

  void _onViewModelChanged() {
    setState(() {});
  }

  void _navigateToBookDetails(BookEntity book){
    Routefly.pushNavigate('/book_details', arguments: book);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Grammar Books", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: 8,),
            if (viewModel.books.isNotEmpty)
              ...viewModel.books.map((book) {
                return CarouselSlider.builder(
                  itemCount: viewModel.books.length,
                  options: CarouselOptions(
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return GestureDetector(
                      onTap: () => _navigateToBookDetails(viewModel.books[index]),
                      child: Container(
                        color: Colors.redAccent,
                        width: double.infinity,
                        child: Column(children: [Text(viewModel.books[index].title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.amberAccent),)])),
                    );
                  },
                );
              }),
          ],
        ),
      ),
    );
  }
}
