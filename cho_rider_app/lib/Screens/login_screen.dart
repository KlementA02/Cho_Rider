import 'package:cho_rider_app/Screens/rider_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow.shade600,
        title: Row(
          children: [
            const Text(
              "C",
            ),
            Text(
              "H",
              style: TextStyle(color: Colors.orange.shade600),
            ),
            const Text(
              "O",
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  const Icon(
                    Icons.delivery_dining,
                    color: Colors.grey,
                    size: 128,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Form(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color(0xFF373737),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.mail),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Password',
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: const Color(0xFF373737),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 1, color: Colors.black)),
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.password),
                                ),
                              ),
                            ),
                          ],
                        )),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => const RiderPage(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  minimumSize: const Size(double.infinity, 60),
                                  elevation: 0,
                                  backgroundColor: const Color(0xFFFFD200)),
                              child: Text(
                                'Sign In',
                                style: GoogleFonts.getFont(
                                  'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17,
                                  color: const Color(0xFF373737),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 14.7, 0),
                          child: RichText(
                            text: TextSpan(
                              style: GoogleFonts.getFont(
                                'Poppins',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: const Color(0xFF373737),
                              ),
                              children: const [
                                // TextSpan(
                                //   text: "Don't have an account?",
                                //   style: GoogleFonts.getFont(
                                //     'Poppins',
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 15,
                                //     height: 1.3,
                                //     color: const Color(0xFF838383),
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: '  ',
                                //   style: GoogleFonts.getFont(
                                //     'Poppins',
                                //     fontWeight: FontWeight.w400,
                                //     fontSize: 15,
                                //     height: 1.3,
                                //   ),
                                // ),
                                // TextSpan(
                                //   text: 'Register',
                                //   recognizer: TapGestureRecognizer()
                                //     ..onTap = () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   const Signup()));
                                //     },
                                //   style: GoogleFonts.getFont(
                                //     'Poppins',
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: 15,
                                //     height: 1.3,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
