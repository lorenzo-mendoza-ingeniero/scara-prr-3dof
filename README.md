# scara-prr-3dof

**Context:** Proyecto de ingeniería para el curso de **"Dinámica de Sistemas Multicuerpo (MT516)"** sobre el desarrollo de un manipulador de 3 dof.
**Date:** 2026  
**Tools:** SolidWorks, MATLAB, Arduino 
**Status:** Completed

## Summary
Manipulador SCARA de 3 dof para el paletizado de jabas de frutas orientado a satisfacer la demanda de infraestructura tecnológica en las Micro y Pequeñas empresas (MyPes) del sector agroindustrial.

## Objective
- Diseño, construcción, programación y validación de un prototipo de brazo robótico para la agroindustria que satisfaga las necesidades de infraestructura tecnológica en las MyPes.

## What I did
- Programe el código en MATLAB para obtener los parámetros de la cinemática directa e inversa del manipulador PRR SCARA 3dof y el código para la comunicación entre los motores NEMA y el ArduinoUNO.
- Simule las trayectorias en MATLAB usando la interfaz de desarrollo de aplicaciones nativa de MATLAB. 
- Valide las ecuaciones de cinemática directa e inversa, los parámetros empíricos de los motores y la relación entre las revoluciones y el desplazamiento prismático y/o cilíndrico.

## Results / Evidence
- Key result or metric: Descripción de las trayectorias cinématicas del manipulador SCARA (PRR) en un ambiente de trabajo controlado.
- Photos/videos: Ir a Repository contents -> Documentación y Medios (`docs/` y `media/`)
- Report: Ir a Repository contents -> Documentación y Medios (`docs/` y `media/`)

## Repository contents
Aquí se detalla la estructura y los archivos principales del proyecto del manipulador SCARA PRR (3DOF).

### 💻 Código Fuente (`src/`)
*   **[Control de Motores (Arduino)](src/arduino_control.ino)**: Código encargado de recibir las consignas y generar la respuesta de avance/posicionamiento para los motores paso a paso.

### 📊 Simulación y Modelamiento (`simulation/`)
*   **[Cinemática Directa, Inversa y Simulación (MATLAB)](simulation/)**

### ⚙️ Diseño CAD (`cad/`)
*   **[Ensamblaje Completo (SolidWorks)](cad/Ensamblaje_total2.SLDASM)**: Archivo principal del ensamble del manipulador.
*   **[Piezas Individuales](cad/piezas/)**: Carpeta con los archivos `.SLDPRT` de los eslabones, base y efector final.
*   *💡 Nota: Si necesitas previsualizar los archivos CAD sin usar SolidWorks, puedes descargar el archivo y usar visores ligeros en línea como [CADProps](https://www.cadprops.com) o eDrawings.*

### 📄 Documentación y Medios (`docs/` y `media/`)
*   **[Informe del Proyecto - Parte 1 (PDF)](docs/MT516-T1-G6.pdf)**: Memoria de cálculo enfocada en el diseño mecánico y CAD del manipulador SCARA.
*   **[Informe del Proyecto - Parte 2 (PDF)](docs/MT516-T2-G6.pdf)**: Detalles del diseño electrónico, selección de actuadores y cableado.
*   **[Informe del Proyecto - Parte 3 (PDF)](docs/MT516-T3-G6.pdf)**: Desarrollo del control, cinemática (MATLAB) y resultados finales.
*   **[Galería de Medios](media/)**: Fotografías del prototipo físico y animaciones (GIFs) demostrando el funcionamiento del manipulador.

## Limitations and next steps
## 🚧 Limitaciones del Prototipo
A partir del diseño conceptual y la posterior selección de componentes y ensamblaje, el sistema actual presenta las siguientes restricciones:

*   **Discrepancia entre carga útil y arquitectura:** Si bien el diseño conceptual plantea la manipulación de jabas de frutas de 15 a 20 kg, el prototipo físico fue construido con motores paso a paso Nema 17, piezas impresas en 3D (PLA/PETG), varillas de aluminio y un servomotor MG995. Estas restricciones presupuestales (aprox. S/ 1,155.00) limitan el prototipo a una maqueta de laboratorio (prueba de concepto) sin capacidad de levantar cargas industriales reales.
*   **Control en lazo abierto:** El uso de Arduino UNO, CNC Shield y drivers DRV8825 para los motores Nema 17 implica una falta de retroalimentación (sin encoders). Esto limita la precisión del posicionamiento (lejos de los 0.5 mm ideales) y expone al sistema a la pérdida de pasos por vibraciones o cargas dinámicas.
*   **Rigidez estructural y tolerancias:** La manufactura por impresión 3D y el uso de varillas de aluminio introducen holguras mecánicas y flexibilidad en los eslabones. Esto se aleja de la rigidez y repetitividad de un SCARA industrial, afectando la precisión de las trayectorias.
*   **Entorno de operación:** El prototipo actual no cuenta con sellado ni recubrimientos industriales (grado IP) para soportar la humedad y los residuos orgánicos propios de un entorno agroindustrial real, ni con las guardas de seguridad físicas exigidas por la Ley N° 29783 e ISO 10218.

## 🚀 Proyecciones a Futuro (Trabajos Futuros)
Para escalar el actual prototipo de laboratorio hacia un manipulador industrial apto para la agroindustria, se proyecta:

*   **Upgrade de Actuadores y Control:** Migrar de motores paso a paso a **servomotores industriales con encoders (control en lazo cerrado)** para garantizar la precisión de 0.5 mm y la capacidad de carga de 15-20 kg. Esto requerirá actualizar el hardware de control hacia un PLC o un controlador de movimiento dedicado.
*   **Rediseño Estructural:** Sustituir las piezas impresas en 3D y varillas de aluminio por componentes mecanizados en aluminio estructural o acero, eliminando las holguras y garantizando la repetitividad en ciclos de trabajo continuos.
*   **Planificación Avanzada de Trayectorias:** Implementar el modelo en **ROS (Robot Operating System)** o simulaciones dinámicas en MATLAB para la planificación de trayectorias, evasión de colisiones y optimización de tiempos de ciclo en el paletizado.
*   **Integración de Visión Artificial e IoT:** Incorporar cámaras y algoritmos de visión para identificar la posición exacta de las jabas y detectar daños en la fruta. Asimismo, integrar protocolos IoT para el monitoreo predictivo del robot (mantenimiento basado en datos).
*   **Adecuación Industrial y Seguridad:** Implementar celdas de seguridad con barreras optoelectrónicas, paradas de emergencia categorizadas y un diseño higiénico (materiales inocuos para la industria alimentaria). Además, se debe adaptar el gripper final según las dimensiones específicas de las cajas de exportación.

## Authors / credits
- Lorenzo A. Mendoza Cordova
- Luciano A. Mezones Rodas, Kevin A. Ramirez Cruz
