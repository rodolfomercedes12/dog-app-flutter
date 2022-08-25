import 'package:dogs_app_flutter/blocs/dog/dog_bloc.dart';
import 'package:dogs_app_flutter/repository/dogs_repository.dart';
import 'package:dogs_app_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
  [DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _dogsRespository =  DogsRespository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DogBloc( dogsRespository: _dogsRespository ))
      ],
      child: const  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
      ),
    );
  }
}
