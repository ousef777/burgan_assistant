import 'package:burgan_assistant/providers/auth_provider.dart';
import 'package:burgan_assistant/providers/goals_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    return Scaffold(
        backgroundColor: const Color(0xFFE5F1F9),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Home Page",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 12,
        ),
        drawer: Drawer(
            child: FutureBuilder(
                future: context.read<AuthProvider>().initAuth(),
                builder: (context, snapshot) {
                  return ListView(
                    children: [
                      Container(
                        decoration: BoxDecoration(color: Colors.orange),
                        //margin: EdgeInsets.all(8.0),
                        padding:
                            EdgeInsets.only(top: 100, bottom: 10, left: 10),
                        child: Row(
                          children: [
                            //Icon(Icons.person),
                            Text(
                              "Welcome User",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        title: Text("Profile"),
                        leading: Icon(Icons.person),
                        onTap: () {
                          GoRouter.of(context).push('/profile');
                        },
                      ),
                      ListTile(
                        title: Text("Branches"),
                        leading: Icon(Icons.location_on_outlined),
                        onTap: () {
                          GoRouter.of(context).push('/branches');
                        },
                      ),
                      ListTile(
                        title: Text("Help and Services"),
                        leading: Icon(Icons.headphones),
                        onTap: () {
                          GoRouter.of(context).push('/help');
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Log out",
                          style: TextStyle(color: Colors.red),
                        ),
                        leading: Icon(Icons.logout),
                        onTap: () {
                          context.read<AuthProvider>().logout();
                          GoRouter.of(context).go('/');
                        },
                      ),
                      // Container(
                      //   alignment: Alignment.bottomLeft,
                      //   child: Icon(Icons.settings),
                      // )
                    ],
                  );
                })
            // FutureBuilder(
            //     future: context.watch<AuthProvider>().initAuth(),
            //     builder: (context, snapshot) {
            //       return Consumer<AuthProvider>(builder: (context, provider, _) {
            //         return (provider.isAuth())
            //             ? ListView(
            //                 padding: EdgeInsets.zero,
            //                 children: [
            //                   Text(
            //                     "Welcome ${provider.user!.email}",
            //                   ),
            //                   ListTile(
            //                     title: Text("Log out"),
            //                     trailing: const Icon(Icons.how_to_reg),
            //                     onTap: () {
            //                       provider.logout();
            //                       GoRouter.of(context).go('/');
            //                     },
            //                   ),
            //                   ListTile(
            //                     title: Text("Profile"),
            //                     trailing: const Icon(Icons.how_to_reg),
            //                     onTap: () {
            //                       GoRouter.of(context).push('/profile');
            //                     },
            //                   )
            //                 ],
            //               )
            //             : ListView(
            //                 children: [
            //                   GestureDetector(
            //                     onTap: () {
            //                       GoRouter.of(context).push('/login');
            //                     },
            //                     child: const ListTile(
            //                       title: Text("Login"),
            //                     ),
            //                   ),
            //                   GestureDetector(
            //                     onTap: () {
            //                       GoRouter.of(context).push('/signup');
            //                     },
            //                     child: ListTile(
            //                       title: Text("Sign up"),
            //                     ),
            //                   ),
            //                 ],
            //               );
            //       });
            //     }),
            ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Balance Card
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle balance card tap here
                        GoRouter.of(context).push('/main', extra: 0);
                      },
                      child: Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    "Premier Account",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "0514008001",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.grey),
                              const SizedBox(height: 4),
                              const Text(
                                "Available Balance",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: const [
                                  Text(
                                    "15586 KWD",
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.credit_card,
                                      color: Colors.blue, size: 20),
                                  Text(
                                    "•••• 6154  VISA",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Image Container with Button in Card (Saving Vault)
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            'assets/images/saving.jpeg',
                            fit: BoxFit.cover,
                            height: 200,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Saving Vault",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Do you want anything? Save for it in the Vault.",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press here
                            GoRouter.of(context).push('/main', extra: 1);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Let's start",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Heading for Goals
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Your way to reach your goals:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Horizontal List of Goals
                  SizedBox(
                    height: 150,
                    child: Consumer<GoalsProvider>(
                        builder: (context, provider, _) {
                      return ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: provider.list.length,
                        itemBuilder: (context, index) {
                          // String goalName = "Goal ${index + 1}";
                          // double amount = (index + 1) * 1000.0;
                          // int duration = (index + 1) * 6;
                          // Provider.of<GoalsProvider>(context, listen: false)
                          //     .list
                          //     .add({
                          //   'name': goalName,
                          //   'amount': amount,
                          //   'duration': duration
                          // });

                          var goal = provider.list[index];
                          return GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push('/edit', extra: index);
                            },
                            child: Card(
                              //color: const Color.fromARGB(255, 255, 179, 65),
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 20),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 8),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      goal.name,
                                      style: const TextStyle(
                                          //color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "Amount: ${goal.amount.toStringAsFixed(2)} KWD",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      "Duration: ${goal.duration} months",
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    SizedBox(
                                      height: 5,
                                      width: 100,
                                      child: LinearProgressBar(
                                        maxSteps: 6,
                                        progressType: LinearProgressBar
                                            .progressTypeLinear,
                                        currentStep: index + 1,
                                        progressColor: Colors.red,
                                        backgroundColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                  const SizedBox(height: 18),

                  // Add goal button
                  ElevatedButton(
                      onPressed: () {
                        GoRouter.of(context).push('/main', extra: 1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Text("Add Goal",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ))),
                  const SizedBox(height: 18),

                  // TM Card
                  Card(
                    elevation: 5,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15)),
                          child: Image.asset(
                            'assets/images/financing.jpeg',
                            fit: BoxFit.cover,
                            height: 300,
                            width: double.infinity,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "Burgan's Finance",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Empowering Your Financial Journey with Tailored Financing Solutions",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Handle button press here
                            GoRouter.of(context).push('/main', extra: 2);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            "Learn more",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Invest Card
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Invest Your Future",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Explore a variety of investment options and start building your wealth today.",
                              style: TextStyle(fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to investment options or perform an action
                                GoRouter.of(context).push('/main', extra: 3);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                "Start Investing",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
          onTap: () {
            scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease);
          },
          child: Container(
            decoration:
                BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: Icon(
              color: Colors.white,
              Icons.keyboard_arrow_down,
              size: 50,
            ),
          ),
        ));
  }
}
