import 'package:mothercare_mobile/features/ektp/ektp.dart';
import 'package:mothercare_mobile/features/profile/bloc/profile_bloc.dart';

@RoutePage()
class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    sl<ProfileBloc>().add(DataProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Loadable(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: BaseColor.primaryColor,
        title: Text18WhitekBold("Cart"),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: LeftAlignedColumn(
            children: [Center(child: Text("Cart"))],
          ),
        ),
      ),
    );
  }
}
