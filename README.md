# scara-prr-3dof

**Context:** Proyecto de ingeniería para el curso de **"Dinámica de Sistemas Multicuerpo (MT516)"** sobre el desarrollo de un manipulador de 3 dof.
**Date:** 2026  
**Tools:** SolidWorks, MATLAB, Arduino IDE  
**Status:** Completed

## Summary
Manipulador SCARA de 3 dof para el paletizado de jabas de frutas orientado a satisfacer la demanda de infraestructura tecnológica en las Micro y Pequeñas empresas (MyPes) del sector agroindustrial.

## Objective
- Diseño, construcción, programación y validación de un prototipo de brazo robótico para la agroindustria que satisfaga las necesidades de infraestructura tecnológica en las MyPes.

## What I did
- Programmed ...
- Simulated ...
- Validated ...

## Results / Evidence
- Key result or metric:
- Photos/videos:
- Report:

## Repository contents
Aquí se detalla la estructura y los archivos principales del proyecto del manipulador SCARA PRR (3DOF).

### 💻 Código Fuente (`src/`)
*   **[Control de Motores (Arduino)](src/arduino_control.ino)**: Código encargado de recibir las consignas y generar la respuesta de avance/posicionamiento para los motores paso a paso.

### 📊 Simulación y Modelamiento (`simulation/`)
*   **[Cinemática Directa (MATLAB)](simulation/cinematica_directa_scara.m)**
*   *   **[Cinemática Inversa (MATLAB)](simulation/cinematica_inversa_scara.m)**
*   **[Frames (MATLAB)](simulation/plot_frame.m)**
*   **[SCARA LINKS (MATLAB)](simulation/plot_scara_links.m)**

### ⚙️ Diseño CAD (`cad/`)
*   **[Ensamblaje Completo (SolidWorks)](cad/scara_prr_ensamble.SLDPRT)**: Archivo principal del ensamble del manipulador.
*   **[Piezas Individuales](cad/piezas/)**: Carpeta con los archivos `.SLDPRT` de los eslabones, base y efector final.
*   *💡 Nota: Si necesitas previsualizar los archivos CAD sin usar SolidWorks, puedes descargar el archivo y usar visores ligeros en línea como [CADProps](https://www.cadprops.com) o eDrawings.*

### 📄 Documentación y Medios (`docs/` y `media/`)
*   **[Informe del Proyecto (PDF)](docs/informe_scara_prr.pdf)**: Memoria de cálculo con los detalles de diseño mecánico, electrónico y de control.
*   **[Galería de Medios](media/)**: Fotografías del prototipo físico y animaciones (GIFs) demostrando el funcionamiento del manipulador.

## How to reproduce / open
...

## Limitations and next steps
...

## Authors / credits
- Your name
- Coauthors if applicable
