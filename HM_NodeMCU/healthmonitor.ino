#include<ESP8266WiFi.h>
#include<SoftwareSerial.h>
#include<FirebaseArduino.h>
#include<ArduinoJson.h>
#include<ESP8266HTTPClient.h>
#include <DHT.h>



#define FIREBASE_HOST "healthmonitor-7142e-default-rtdb.firebaseio.com"
#define FIREBASE_AUTH "BB6VqDeBO903f3u7bbdYoEXp4lYaCb0wGNsyBoVb"

#define WIFI_SSID "Piyush01"
#define WIFI_PASSWORD "PIYush123"

#define DHTPIN 13 //datapin
#define DHTTYPE DHT11 

DHT dht(DHTPIN,DHTTYPE);

unsigned long previousMillis=0;
const long interval=10000;//sensor data input rate

void setup() {
 pinMode(5,OUTPUT);
 Serial.begin(115200);
 delay(500);
 WiFi.begin(WIFI_SSID,WIFI_PASSWORD);
 Serial.println("connecting...");

 while(WiFi.status()!= WL_CONNECTED){
 Serial.print(".");
 delay(500); 
 }
 Serial.println();
 Serial.print("connected to  ");
 Serial.println(WiFi.localIP());
 Firebase.begin(FIREBASE_HOST,FIREBASE_AUTH);
 dht.begin();

 delay(1000);
 
}//void setup closed

void readData(){
  //float h=dht.readHumidity();
  //float t = dht.readTempreature();
   
  float t=dht.readTemperature(); 
  String mystring=" ";
  mystring= String(t);
  Serial.println(t);
  Firebase.setFloat("Data/Tempreature",t);
 // Firebase.setString("healthmonitor-7142e-default-rtdb.firebaseio.com/Data/Tempreature",mystring);//setting values in firebase
  //Firebase.setString("/Data/SPO2:",mystring);
  
  }

void loop() {
  
unsigned long currentMillis=millis();
if(currentMillis-previousMillis >=interval){
  readData();
  previousMillis=currentMillis;
  }
}
