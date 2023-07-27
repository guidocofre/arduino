#include <EEPROM.h> // Incluir la librería EEPROM para el manejo de la memoria EEPROM
#include <SoftwareSerial.h> // Incluir la librería SoftwareSerial para la comunicación serial

const int ledPin12 = 12; // Declarar el pin 12 como constante para el LED 12
const int ledPin11 = 11; // Declarar el pin 11 como constante para el LED 11
const int ledPin13 = 13; // Declarar el pin 13 como constante para el LED 13


bool led12State = false; // Variable booleana para almacenar el estado del LED 12
bool led11State = false; // Variable booleana para almacenar el estado del LED 11
bool led13State = false; // Variable booleana para almacenar el estado del LED 13

int led12Counter = 0; // Variable para contar las veces que se activa el LED 12
int led11Counter = 0; // Variable para contar las veces que se activa el LED 11
int led13Counter = 0; // Variable para contar las veces que se activa el LED 13

void setup() { // Función de configuración que se ejecuta al inicio
  Serial.begin(9600); // Inicializar la comunicación serial con una velocidad de 9600 baudios
  pinMode(ledPin12, OUTPUT); // Establecer el pin 12 como salida para el LED 12
  pinMode(ledPin11, OUTPUT); // Establecer el pin 11 como salida para el LED 11
  pinMode(ledPin13, OUTPUT); // Establecer el pin 13 como salida para el LED 13
  digitalWrite(ledPin12, LOW); // Apagar el LED 12 al inicio
  digitalWrite(ledPin11, LOW); // Apagar el LED 11 al inicio
  digitalWrite(ledPin13, LOW); // Apagar el LED 13 al inicio
}

void loop() { // Función de bucle principal que se ejecuta continuamente
  if (Serial.available()) { // Verificar si hay datos disponibles en la comunicación serial
    char c = Serial.read(); // Leer el caracter recibido
    
    if (c == 'a') { // Si se recibe la letra 'a'
      led12Counter++; // Incrementar el contador del LED 12
      if (led12Counter == 1) { // Si es la primera vez que se activa el LED 12
        led12State = true; // Establecer el estado del LED 12 como encendido
        digitalWrite(ledPin12, HIGH); // Encender el LED 12
      }
    } else if (c == 'b') { // Si se recibe la letra 'b'
      led12Counter--; // Decrementar el contador del LED 12
      if (led12Counter == 0) { // Si se ha apagado el LED 12
        led12State = false; // Establecer el estado del LED 12 como apagado
        digitalWrite(ledPin12, LOW); // Apagar el LED 12
      }
    } else if (c == 'c') { // Si se recibe la letra 'c'
      led11Counter++; // Incrementar el contador del LED 11
      if (led11Counter == 1) { // Si es la primera vez que se activa el LED 11
        led11State = true; // Establecer el estado del LED 11 como encendido
        digitalWrite(ledPin11, HIGH); // Encender el LED 11
      }
    } else if (c == 'd') { // Si se recibe la letra 'd'
      led11Counter--; // Decrementar el contador del LED 11
      if (led11Counter == 0) { // Si se ha apagado el LED 11
        led11State = false; // Establecer el estado del LED 11 como apagado
        digitalWrite(ledPin11, LOW); // Apagar el LED 11
      }
    } else if (c == 'e') { // Si se recibe la letra 'e'
      led13Counter++; // Incrementar el contador del LED 13
      if (led13Counter == 1) { // Si es la primera vez que se activa el LED 13
        led13State = true; // Establecer el estado del LED 13 como encendido
        digitalWrite(ledPin13, HIGH); // Encender el LED 13
      }
    } else if (c == 'f') { // Si se recibe la letra 'f'
      led13Counter--; // Decrementar el contador del LED 13
      if (led13Counter == 0) { // Si se ha apagado el LED 13
        led13State = false; // Establecer el estado del LED 13 como apagado
        digitalWrite(ledPin13, LOW); // Apagar el LED 13
      }
    }
  }
}

