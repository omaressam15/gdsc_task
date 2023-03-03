import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final key = GlobalKey<AnimatedListState>();
  ScrollController scrollController = ScrollController();
  List<String> items = [];
  int? index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: Container(
          height: 150,
          color: const Color(0xff40403e),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 20),
          child: const Text('Flutter Map',style: TextStyle(color: Colors.white,fontSize: 22)),
        )

      ),
      backgroundColor: const Color(0xff0e1f2d),

      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            IconButton(
                onPressed: () {
                  setState(() {
                    var index = items.length;
                    items.add('item${index+1}');
                   key.currentState!.insertItem(index);
                   Future.delayed(const Duration(milliseconds: 300),(){
                     scrollController.animateTo(
                         scrollController.position.maxScrollExtent,
                         duration: const Duration(milliseconds: 300),
                         curve: Curves.easeIn);
                    });
                  });
                },
            icon: const Icon(Icons.add,size: 25,color: Colors.white)),

            Expanded(
              child: AnimatedList(
                key: key,
                controller: scrollController,
                initialItemCount: items.length,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10,),
                  itemBuilder: (context,index,animation){
                    return  AnimatedListItem(
                      onClick: (){
                        deleteItem(index);
                      },
                      animation: animation,
                      item: items[index],
                    );
                  }),
            )

          ],
        ),
      ),
    );

  }


  void deleteItem(int index) {
   var removedItem =  items.removeAt(index);
    key.currentState!.removeItem(index, (context, animation) => AnimatedListItem(
        item: removedItem,
        onClick: (){},
        animation: animation));
  }
}
class AnimatedListItem extends StatelessWidget {
  String item;
  final VoidCallback onClick;
  Animation<double> animation;

   AnimatedListItem({Key? key,required this.item,required this.onClick,required this.animation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animation,
      axisAlignment: 2,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        color: const Color(0xffffad39),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item),

              IconButton(onPressed: ()=>onClick(),
                  icon: const Icon(Icons.delete,color: Colors.white,))
            ],
          ),
        ),
      ),
    );
  }
}







