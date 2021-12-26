import 'dart:math';
Random random = Random();
int colorsLen = 10 - random.nextInt(5);
List<int> colorsList = [for (var i = 0; i < colorsLen; i++) 0];
int specialElement = random.nextInt(colorsLen);
int lastClickedElement = -1;
void clickedNoneSpecialElement(currentIndex){
  print("BEFORE " + specialElement.toString() + ' ' + (currentIndex).toString());
  for (int i = 0; i < colorsLen; i++) {
    if (colorsList[i] == 1 && i != currentIndex){
      colorsList[i] = 0;
    }
  }
  for(;;){
    specialElement = random.nextInt(colorsLen);
    if (colorsList[specialElement] == 2 || (specialElement) == currentIndex){
      specialElement = random.nextInt(colorsLen);
    } else {
      break;
    }
  }

}

void restartGame(){
  colorsLen = 10 - random.nextInt(5);
  colorsList = [for (var i = 0; i < colorsLen; i++) 0];
  specialElement = random.nextInt(colorsLen);
  lastClickedElement = -1;
}