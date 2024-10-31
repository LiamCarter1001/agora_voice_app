// lib/voice_channel_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'voice_channel_provider.dart';

class VoiceChannelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final voiceChannelProvider = Provider.of<VoiceChannelProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agora Voice Channel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              voiceChannelProvider.isJoined
                  ? 'Connected to Channel'
                  : 'Not connected',
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: voiceChannelProvider.isJoined
                  ? voiceChannelProvider.leaveChannel
                  : voiceChannelProvider.joinChannel,
              child: Text(
                voiceChannelProvider.isJoined ? 'Leave Channel' : 'Join Channel',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
