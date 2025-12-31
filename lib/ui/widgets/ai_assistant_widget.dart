import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import '../../providers/chat_provider.dart';
import '../../models/resume_model.dart';
import '../../../utils/constants.dart';

class AiAssistantWidget extends StatefulWidget {
  const AiAssistantWidget({super.key});

  @override
  State<AiAssistantWidget> createState() => _AiAssistantWidgetState();
}

class _AiAssistantWidgetState extends State<AiAssistantWidget> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(ChatProvider provider) {
    if (_controller.text.trim().isEmpty) return;
    provider.sendMessage(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ChatProvider>();

    return Positioned(
      bottom: 24,
      right: 24,
      child: provider.isOpen
          ? Container(
              width: 350,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 30,
                    offset: Offset(0, 10),
                  ),
                ],
                border: Border.all(color: const Color(0xFFE2E8F0)), // Slate 200
              ),
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    color: const Color(kPrimaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(LucideIcons.sparkles, color: Colors.white, size: 20),
                            const SizedBox(width: 8),
                            Text(
                              "AI 職涯助手",
                              style: GoogleFonts.notoSansTc(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(LucideIcons.x, color: Colors.white, size: 20),
                          onPressed: () => provider.toggleChat(),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          style: IconButton.styleFrom(
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Messages
                  Expanded(
                    child: Container(
                      color: const Color(0xFFF8FAFC).withOpacity(0.5), // Slate 50
                      child: ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(16),
                        reverse: true, // Show latest at bottom naturally by reversing list order in UI logic or data
                        // But provider.messages is in chronological order (old -> new).
                        // So for reverse: true ListView, index 0 is bottom-most.
                        // We should pass reversed list or map index.
                        // Let's use standard ListView and auto-scroll for now to match logic in Spec,
                        // OR use reverse: true and access messages from end.
                        // Spec suggested reverse: true.
                        itemCount: provider.messages.length + (provider.isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          // Reverse index mapping
                          // List: [Msg1, Msg2, Msg3]
                          // ListView (reverse): Item 0 is bottom (Msg3), Item 2 is top (Msg1).
                          // So Item k corresponds to provider.messages[length - 1 - k]
                          
                          // Handling loading indicator as the "latest" item (index 0)
                          if (provider.isLoading && index == 0) {
                            return const _LoadingIndicator();
                          }

                          final dataIndex = provider.isLoading 
                              ? provider.messages.length - index 
                              : provider.messages.length - 1 - index;
                          
                          final message = provider.messages[dataIndex];
                          return _MessageBubble(message: message);
                        },
                      ),
                    ),
                  ),

                  // Input
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(top: BorderSide(color: const Color(0xFFE2E8F0))),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              hintText: "詢問關於他的技術棧、經歷...",
                              hintStyle: TextStyle(fontSize: 14, color: const Color(kSubTextColor).withOpacity(0.5)),
                              filled: true,
                              fillColor: const Color(0xFFF1F5F9), // Slate 100
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(fontSize: 14),
                            onSubmitted: (_) => _sendMessage(provider),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: provider.isLoading || _controller.text.isEmpty
                              ? null 
                              : () => _sendMessage(provider),
                          icon: const Icon(LucideIcons.send, size: 18),
                          style: IconButton.styleFrom(
                            backgroundColor: const Color(kPrimaryColor),
                            foregroundColor: Colors.white,
                            disabledBackgroundColor: const Color(kPrimaryColor).withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : FloatingActionButton(
              onPressed: () => provider.toggleChat(),
              backgroundColor: const Color(kPrimaryColor),
              elevation: 4,
              child: const Icon(LucideIcons.messageCircle, size: 28),
            ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const _MessageBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? const Color(kPrimaryColor) : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(message.isUser ? 16 : 4),
            bottomRight: Radius.circular(message.isUser ? 4 : 16),
          ),
          boxShadow: message.isUser ? [] : [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
            ),
          ],
          border: message.isUser ? null : Border.all(color: const Color(0xFFF1F5F9)),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : const Color(kTextColor),
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFF1F5F9)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _Dot(delay: 0),
            const SizedBox(width: 4),
            _Dot(delay: 1),
            const SizedBox(width: 4),
            _Dot(delay: 2),
          ],
        ),
      ),
    );
  }
}

class _Dot extends StatefulWidget {
  final int delay;
  const _Dot({required this.delay});

  @override
  State<_Dot> createState() => _DotState();
}

class _DotState extends State<_Dot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
    
    // Stagger animation based on delay
    Future.delayed(Duration(milliseconds: widget.delay * 200), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(
        width: 6,
        height: 6,
        decoration: const BoxDecoration(
          color: Color(0xFF94A3B8), // Slate 400
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
