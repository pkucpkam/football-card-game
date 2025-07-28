const List<Map<String, dynamic>> yourPlayers = [
  {
    'imageUrl':
        'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
    'name': 'Bruno Fernandes',
    'position': 'Tiền vệ',
    'stats': {'speed': 80, 'shooting': 85, 'passing': 90},
    'value': 90,
  },
  {
    'imageUrl':
        'https://assets.manutd.com/AssetPicker/images/0/0/22/86/1464016/Jadon-Sancho1751383232235.png',
    'name': 'Marcus Rashford',
    'position': 'Tiền đạo',
    'stats': {'speed': 92, 'shooting': 87, 'passing': 82},
    'value': 80,
  },
];

String getPositionName(int index) {
  const positions = [
    'GK',
    'LB',
    'CB1',
    'CB2',
    'RB',
    'LM',
    'CM1',
    'CM2',
    'RM',
    'ST1',
    'ST2',
  ];
  return positions[index];
}

double getXPosition(int index) {
  const xPositions = [
    0.5,
    0.15,
    0.37,
    0.63,
    0.85,
    0.15,
    0.35,
    0.65,
    0.85,
    0.35,
    0.65,
  ];
  return xPositions[index];
}

double getYPosition(int index) {
  const yPositions = [
    0.82,
    0.65,
    0.68,
    0.68,
    0.65,
    0.35,
    0.5,
    0.5,
    0.35,
    0.2,
    0.2,
  ];
  return yPositions[index];
}
