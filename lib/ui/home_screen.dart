import 'package:flutter/material.dart';
import 'package:flutter_image_search/ui/home_view_model.dart';
import 'package:flutter_image_search/ui/widget/photo_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final viewModel = PhotoProvider.of(context).viewModel;
    // final viewModel = Provider.of<HomeViewModel>(context);
    // final viewModel = context.read<HomeViewModel>(); // Stream 사용 시 read 사용 가능
    // final viewModel = context.watch<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '이미지 검색 앱',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                suffixIcon: IconButton(
                  onPressed: () async {
                    // await viewModel.fetch(_textEditingController.text);
                    context
                        .read<HomeViewModel>()
                        .fetch(_textEditingController.text);
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          Consumer<HomeViewModel>(
            // 코드 가독성을 위해 컨슈머를 사용하지 않는 방향을 선택 가능
            builder: (_, viewModel, child) {
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: viewModel.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final photo = viewModel.photo(index);
                    return PhotoWidget(
                      photo: photo,
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
