import 'package:clothesstore/app/presentation/ui/global_widgets/result_widget.dart';
import 'package:clothesstore/app/presentation/ui/screen/search/ui/widgets/search_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate {
  @override
  String get searchFieldLabel => 'Buscar';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, query),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  void showResults(BuildContext context) {
    FocusScope.of(context).hasFocus;
    if (query.isNotEmpty) {
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) =>const SearchDetailPage(),
          settings: RouteSettings(arguments: query)
        ),
      );
    }

    super.showResults(context);
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: query.isEmpty
          ? const Center(
              child: Text('Escribe algo'),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ResultSearch(query: query);
  }
}
