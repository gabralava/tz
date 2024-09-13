abstract class SendData {
  final List<String> choosedEmotions;
  final double stressLevel;
  final double selfEsteemLevel;

  const SendData({required this.stressLevel, required this.selfEsteemLevel, required this.choosedEmotions});

  void sendToDataBaseData();
}