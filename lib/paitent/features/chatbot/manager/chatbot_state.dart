part of 'chatbot_cubit.dart';


abstract class ChatbotState {}

class ChatbotInitial extends ChatbotState {}
class SendChatBotMessageLoading extends ChatbotState {}
class SendMessage extends ChatbotState {}
