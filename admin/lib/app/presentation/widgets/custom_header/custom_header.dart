import 'package:admin/app/core/config/user_manager.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatelessWidget {
  CustomHeader({super.key, required this.title});

   final UserManager _manager = GetIt.I<UserManager>();
   final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Text(title.toUpperCase(),
            style: GoogleFonts.montserrat(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),),
            const Spacer(),
            const Spacer(),
            Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0XFF171e29),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     const Padding(
                      padding: EdgeInsets.only(left: 8, top: 5, bottom: 5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo/avatar_man.png'),
                      ),
                    ),
                    Observer(builder: (_) =>
                    Padding(
                      padding: const EdgeInsets.only(left: 12, right: 10),
                      child: Text(
                        _manager.userEntity!.nome!.toUpperCase(),
                        style: GoogleFonts.montserrat(
                          color: Colors.grey[10]
                        ),
                      ),
                    ),
                    )
                  ],
                ),
              )
            ],
            )
          ],
        ),
      );
  }
}