#include <SPI.h>
#include <MFRC522.h>
/////////////////////
// Pin Definitions //
/////////////////////
#define RST_PIN D4
#define SS_PIN  D3
/////////////////////////
// Variable Definitions//
/////////////////////////
MFRC522 mfrc522(SS_PIN, RST_PIN);  // Lav MFRC522 objekt
String tagUID1 = "6E 55 B5 63"; //String med UID for tag#1
String tagUID2 = "49 CF 48 1B"; //String med UID for tag#2
String tagOLD = "";

void setup() {
  Serial.begin(115200);    // Initialize serial communications with the PC
  while (!Serial);    // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)

  SPI.begin();      // Init SPI bus
  mfrc522.PCD_Init();   // Init MFRC522

  Serial.println(F("Scan PICC..."));
}

void loop() {
  delay(500);
  if ( ! mfrc522.PICC_IsNewCardPresent()) {
    Serial.println("Ikke en ny PICC"); //Virker kun hver anden gang
  } else {
    if ( ! mfrc522.PICC_ReadCardSerial()) { // Laes PICC
      Serial.println("Kan ikke laese UID");
      return;
    } else {
      String tag = "";
      for (byte i = 0; i < mfrc522.uid.size; i++)
      {
        tag.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
        tag.concat(String(mfrc522.uid.uidByte[i], HEX));
      }
      tag.toUpperCase();
      if (tag.substring(1) == tagUID1 && tagOLD.substring(1) != tag.substring(1))
      { // Hvis UID fra tag#1 er fundet
        tagOLD = tag;
        Serial.println(F("Found Tag #1"));
      } else if (tag.substring(1) == tagUID2 && tagOLD.substring(1) != tag.substring(1))
      { // Hvis UID fra tag#2 er fundet
        tagOLD = tag;
        Serial.println(F("Found Tag #2"));
      } else if (tagOLD.substring(1) != tag.substring(1))
      { // Hvis UID er ukendt
        tagOLD = tag;
        Serial.println(F("Found Wrong Tag!"));
      }
    }
  }
}
