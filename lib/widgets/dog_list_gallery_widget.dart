import 'package:dogs_app_flutter/blocs/dog/dog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DogList extends StatelessWidget {
  const DogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: BlocBuilder<DogBloc, DogState>(
            builder: (context, state) {
              return state.imagesDogs.isEmpty
                  ? Center(child: CircularProgressIndicator())
                  : StaggeredGridView.countBuilder(
                      physics: BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      itemCount: state.imagesDogs.length,
                      itemBuilder: (context, index) {
                        String imgDog = state.imagesDogs[index];

                        return ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                              child: FadeInImage(
                            placeholder: AssetImage("assets/pet.png"),
                            image: NetworkImage(
                              imgDog,
                            ),
                            fit: BoxFit.cover,
                          )),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.count(
                          (index % 7 == 0) ? 2 : 1, (index % 7 == 0) ? 2 : 1),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    );
            },
          )),
    );
  }
}
