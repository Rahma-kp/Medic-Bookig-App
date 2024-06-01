import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medic/controller/chat_provider.dart';
import 'package:medic/view/userside/chat/widget/chat_tile.dart';
import 'package:medic/widget/text_form_filed.dart';
import 'package:provider/provider.dart';

class DoctorChatList extends StatelessWidget {
  const DoctorChatList({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 241, 240, 240),
        title: Text(
          "Chats",
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Color.fromARGB(255, 241, 240, 240),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 210, 207, 207),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for Doctors",
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Consumer<ChatController>(
                builder: (context, chatController, child) {
                  if (chatController.isLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (chatController.myAllChat == null ||
                      chatController.myAllChat!.isEmpty) {
                    return const Center(
                      child: CustomText(
                        text: 'No chats available',
                        size: 16,
                        color: Colors.grey,
                      ),
                    );
                  }

                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ChatTileWidget(
                        chatModel: chatController.myAllChat![index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    itemCount: chatController.myAllChat!.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
