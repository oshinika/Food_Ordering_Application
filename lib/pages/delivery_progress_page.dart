import 'package:flutter/material.dart';
import 'package:food/components/my_receipt.dart';
import 'package:food/models/restaurant.dart';
import 'package:food/services/auth/database/firestore.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // get access to db
  FirestoreService db = FirestoreService();
  @override
  void initState(){
    super.initState();

    // ifb we get to this page, submit order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),

      bottomNavigationBar: _buildBottomNavbar(context),
      body: Column(
        children: [
          MyReceipt(),
        ],
      ),
    );
  }

  //Custom bottom Nav Bar - Messege / Call delivery deliver
   Widget _buildBottomNavbar(BuildContext context){
    return Container(
      height:  100,
      decoration : BoxDecoration(
        color : Theme.of(context).colorScheme.secondary,
        borderRadius : const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
           ),
        ),

        padding: const EdgeInsets.all(25),

        child:  Row(
          children: [
            //profile pic of driver
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {} ,
                  icon: const Icon(Icons.person), )
                ),

                const SizedBox(width: 10),

                // driver details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mitch Koko",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontSize: 10,
                       color: Theme.of(context).colorScheme.inversePrimary,
                       ),
                        ),
                    Text("Driver",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                       fontSize: 10,
                       color: Theme.of(context).colorScheme.primary,
                       ),
                    ),

                  ],
                  ),

                  const Spacer(),
                //messege button
                 Row(
                  children: [
                    Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {} ,
                  icon: const Icon(Icons.message),
                  color: Theme.of(context).colorScheme.primary,)
                ),

                 const SizedBox(width: 10),
                Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {} ,
                  icon: const Icon(Icons.call),
                  color: Colors.green,
                   )
                ),
                  ],)


                // call button
          ],)
        );
   }
}
