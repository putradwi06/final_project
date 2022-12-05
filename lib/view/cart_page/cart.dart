import 'package:final_project/model/cartModel.dart';
import 'package:final_project/view_model/cartService.dart';
import 'package:flutter/material.dart';

class cartPage extends StatefulWidget {
  cartPage({super.key});

  @override
  State<cartPage> createState() => _cartPageState();
}

class _cartPageState extends State<cartPage> {
  Cartrepository cartrepository = Cartrepository();
  @override
  void initState() {
    super.initState();
    cartrepository.getDataCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<CartModel>>(
          future: cartrepository.getDataCart(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      leading: Container(
                        color: Colors.grey,
                        height: 100,
                        width: 100,
                        child: Image.network(data[index].cartProduct.image!),
                      ),
                      title: Text(
                        data[index].cartProduct.name!,
                        maxLines: 2,
                      ),
                      subtitle: Text(
                        data[index].id.toString(),
                        maxLines: 2,
                      ),
                      trailing: Column(children: [
                        Text(
                          data[index].quantity.toString(),
                          maxLines: 2,
                        ),
                        IconButton(
                            onPressed: () => Cartrepository()
                                .delCart(data[index].id.toString())
                                .then((value) => setState(
                                      () {},
                                    )),
                            icon: Icon(Icons.delete))
                      ]),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}