import 'package:flutter/material.dart';
import 'package:network_layer_flutter/screens/poke_list_vm.dart';
import 'package:provider/provider.dart';

class PokeListView extends StatelessWidget {

  const PokeListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokeListVM>(
        builder: (context, viewModel, _) {
          return Scaffold(
              body: SafeArea (
                child: Stack (
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: viewModel.pokemonList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Text('${viewModel.pokemonList?[index].name}');
                        }),
                    (viewModel.loading == true) ? _loading() : Container(),
                    (viewModel.error == true) ? AlertDialog(
                      title: const Text('Warning'),
                      content: Text(viewModel.errorMsg!),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('OK'),
                          onPressed: () {
                            viewModel.hideError();
                          },
                        ),
                      ],
                    ) : Container()
                  ],
                ),
              )
          );
        });
  }

  Widget _loading(){
    return SizedBox (
      width: double.infinity,
      height: double.infinity,
      child: Center (
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(
                color: Colors.black
              ),
            ],
          )
      ),
    );
  }
}
