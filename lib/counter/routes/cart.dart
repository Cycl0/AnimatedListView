import 'package:flutter/material.dart';
import 'package:list_view_animada/counter/state/cartState.dart';
import 'package:list_view_animada/counter/state/count.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  Cart({ super.key });
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartState>().cart;
    return Scaffold(
      appBar: AppBar(title: Text('Cart (${context.watch<Count>().count})')),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: cart.length,
        itemBuilder: (context, index, animation) {
          final item = cart[index];
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text(item), // Adjust as per your item model
              trailing: IconButton(
                icon: Icon(Icons.remove_circle),
                onPressed: () {
                  // Remove item with animation
                  context.read<Count>().decrement();
                  final removedItem = cart[index];
                  context.read<CartState>().removeItem(index);
                  _listKey.currentState?.removeItem(
                    index,
                    (context, animation) => SizeTransition(
                      sizeFactor: animation,
                      child: ListTile(title: Text(removedItem)),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('addItem_floatingActionButton'),
        onPressed: () { 
          context.read<CartState>().addItem('New item');
          _listKey.currentState?.insertItem(cart.length - 1);
          context.read<Count>().increment();
        },
        tooltip: 'Add new item',
        child: const Icon(Icons.add),
      )
    );
  }
}
