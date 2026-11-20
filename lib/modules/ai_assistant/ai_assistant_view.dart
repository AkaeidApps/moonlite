import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/widgets/moonlight_header.dart';
import '../../shared/widgets/glass_container.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import 'ai_assistant_controller.dart';

class AiAssistantView extends GetView<AiAssistantController> {
  const AiAssistantView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AiAssistantController());
    final TextEditingController textController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.moonlight),
                    onPressed: () => Get.back(),
                  ),
                  const Expanded(
                    child: MoonlightHeader(
                      title: 'Luna AI Assistant',
                      subtitle: 'Real-time astronomical intelligence',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _promptChip(controller, 'What is today\'s moon phase?'),
                  _promptChip(controller, 'Astrophotography tips'),
                  _promptChip(controller, 'When is the next Full Moon?'),
                  _promptChip(controller, 'Explain ocean tides'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: Obx(() => ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.messages.length + (controller.isTyping.value ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == controller.messages.length && controller.isTyping.value) {
                        return _typingIndicator();
                      }
                      final msg = controller.messages[index];
                      return _chatBubble(msg);
                    },
                  )),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                border: Border(top: BorderSide(color: AppColors.primary.withOpacity(0.2))),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      style: const TextStyle(color: AppColors.moonlight),
                      decoration: InputDecoration(
                        hintText: 'Ask Luna AI anything about astronomy...',
                        hintStyle: TextStyle(color: AppColors.textSecondary.withOpacity(0.7)),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (val) {
                        if (val.isNotEmpty) {
                          controller.sendMessage(val);
                          textController.clear();
                        }
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: AppColors.primary),
                    onPressed: () {
                      if (textController.text.isNotEmpty) {
                        controller.sendMessage(textController.text);
                        textController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _promptChip(AiAssistantController controller, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: ActionChip(
        backgroundColor: AppColors.surface,
        label: Text(text, style: AppTypography.bodySmall(color: AppColors.primary)),
        side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
        onPressed: () => controller.sendMessage(text),
      ),
    );
  }

  Widget _chatBubble(ChatMessage msg) {
    return Align(
      alignment: msg.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: msg.isUser ? AppColors.primary.withOpacity(0.2) : AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: msg.isUser ? AppColors.primary.withOpacity(0.5) : AppColors.primary.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!msg.isUser)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.auto_awesome, color: AppColors.gold, size: 12),
                  const SizedBox(width: 4),
                  Text('Luna AI', style: AppTypography.bodySmall(color: AppColors.gold)),
                ],
              ),
            if (!msg.isUser) const SizedBox(height: 6),
            Text(msg.text, style: AppTypography.body(color: AppColors.moonlight)),
          ],
        ),
      ),
    );
  }

  Widget _typingIndicator() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primary.withOpacity(0.2)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.auto_awesome, color: AppColors.gold, size: 12),
            const SizedBox(width: 8),
            Text('Luna AI is calculating & thinking...', style: AppTypography.bodySmall(color: AppColors.textSecondary)),
          ],
        ),
      ),
    );
  }
}
