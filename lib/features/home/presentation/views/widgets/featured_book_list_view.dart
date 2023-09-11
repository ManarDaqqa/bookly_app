import 'package:bookly/features/home/presentation/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/book_entity.dart';
import 'featured_list_view_item.dart';

class FeaturedBookListView extends StatefulWidget {
  const FeaturedBookListView({Key? key, required this.books}) : super(key: key);

  final List<BookEntity> books;

  @override
  State<FeaturedBookListView> createState() => _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBookListView> {
  final ScrollController _scrollController =ScrollController();
  var nextPage =1 ;
  var isLoading= false;
  @override
  void initState(){
    super.initState();
    _scrollController.addListener(() => _scrollListener());
  }

  void _scrollListener() async {
    if (_scrollController.position.pixels >= 0.7 * _scrollController.position.maxScrollExtent){
      if (!isLoading){
        isLoading = true;
       await BlocProvider.of<FeaturedBooksCubit>(context).fetchFeaturedBooks(
            pageNumber: nextPage++
        );
       isLoading = false;
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.26,
      child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          itemCount:  widget.books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: FeaturedListViewItem(
                image: widget.books[index].image ?? 'https://i.pinimg.com/564x/cd/61/c4/cd61c4d471cd21830ef6819b13655cd9.jpg',
              ),
            );
          }),
    );
  }
}
