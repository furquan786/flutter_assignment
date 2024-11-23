import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_review/Item_Time.dart';
import 'package:post_review/ViewModel/postVM.dart';
import 'package:post_review/detailScreen.dart';
import 'package:post_review/time_list_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return GetBuilder<PostVM>(
      init: PostVM(),
      builder: (postController) {
        return postController.postList == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: const Text('Post List'),
                  centerTitle: true,
                ),
                body: ListView.builder(
                  itemCount: postController.postList!.length,
                  itemBuilder: (context, index) {
                    var postLs = postController.postList ?? [];
                    final List<ItemTimer> _items = List.generate(
                      postLs.length,
                      (index) =>
                          ItemTimer(id: index, elapsedTime: Duration.zero),
                    );
                    return InkWell(
                      onTap: () async {
                        postController.detailCntrl
                            .getPostDetail(postLs[index].id!);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return DetailScreen(Id: postLs[index].id!);
                        }));
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.yellow.shade300,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2,
                              )
                            ]),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 8),
                        child: ListTile(
                            title: Text(
                              postLs[index].title!,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis),
                            ),
                            trailing: TimerListItem(
                              item: _items[index],
                            )),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
