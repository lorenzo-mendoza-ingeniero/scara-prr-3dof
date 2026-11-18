// Demo_01 - Versión con RECEPCIÓN DE ÓRDENES por Serial

int MOTOR_X_pasos = 2;
int MOTOR_Y_pasos = 3;
int MOTOR_Z_pasos = 4;
int MOTOR_X_direccion = 5;
int MOTOR_Y_direccion = 6;
int MOTOR_Z_direccion = 7;
int DRIVER_ENABLE = 8;

void setup() 
{
  pinMode(MOTOR_Z_pasos, OUTPUT);
  pinMode(MOTOR_Z_direccion, OUTPUT);
  pinMode(DRIVER_ENABLE, OUTPUT);
  
  // *** HABILITAMOS EL DRIVER (LOW = Habilitado) ***
  digitalWrite(DRIVER_ENABLE, LOW); 

  // *** INICIAMOS LA COMUNICACIÓN SERIE PARA RECIBIR ÓRDENES ***
  Serial.begin(9600);
  Serial.println("Shield listo. Envia orden: F[Pasos] o B[Pasos]");
}

void loop() 
{
  // Preguntamos si hay datos disponibles en el puerto serie
  if (Serial.available() > 0) 
  {
    // Leemos la cadena completa hasta encontrar un salto de línea (Enter)
    String comando = Serial.readStringUntil('\n');
    comando.trim(); // Eliminamos espacios o saltos de línea sobrantes

    // Verificamos si el comando empieza con 'F' (Forward) o 'B' (Backward)
    if (comando.startsWith("F") || comando.startsWith("f")) 
    {
      // Extraemos el número de pasos (ej: "F200" -> 200)
      int pasos = comando.substring(1).toInt();
      if (pasos > 0) {
        Serial.print("Girando adelante ");
        Serial.print(pasos);
        Serial.println(" pasos");
        enviar_pasos(pasos, 1, MOTOR_Z_direccion, MOTOR_Z_pasos);
      }
    } 
    else if (comando.startsWith("B") || comando.startsWith("b")) 
    {
      int pasos = comando.substring(1).toInt();
      if (pasos > 0) {
        Serial.print("Girando atras ");
        Serial.print(pasos);
        Serial.println(" pasos");
        enviar_pasos(pasos, 0, MOTOR_Z_direccion, MOTOR_Z_pasos);
      }
    }
    else 
    {
      Serial.println("Comando no valido. Usa F[numero] o B[numero]");
    }
  }
}

// --------------------------------------------------- //
// FUNCION PARA MOVER EL MOTOR (sin delays bloqueantes largos)
// --------------------------------------------------- //
void enviar_pasos(int pasos, int DIR, int PIN_direccion, int PIN_pasos)
{
  digitalWrite(PIN_direccion, (DIR == 1) ? HIGH : LOW);

  for(int i = 0; i < pasos; i++)
  {
    digitalWrite(PIN_pasos, HIGH);
    delayMicroseconds(2000); // Tiempo en alto (más rápido que 5ms)
    digitalWrite(PIN_pasos, LOW);
    delayMicroseconds(2000); // Tiempo en bajo
  }
}