
# ESPECIFICACIONES
Proyecto construido sobre una FPGA- Nexys 4ddr, utilizando la herramiente Litex/migen.

Cuenta con :

+una pantalla lcd con tft_22_ili9225.

+ocho pulsadores normalmente abiertos.

+driver_arduino para microsd_card (si asi lo requiere). 

como se observa en la imagen:

El proyecto se encuentra separado en dos carpetas, final_1 y pruebas_periféricos; en el primero 
estará albergado la implementación final y completa del  proyecto. En pruebas_periféricos  
se encontrara todas las carpetas con cada prueba en los diferentes periféricos ; esto con el fin 
de que pueda ver el recorrido que se hizo para armar el proyecto en su totalidad.

Ya dentro de final_1 usted encontrara la siguiente distribución:

![final_1](https://user-images.githubusercontent.com/47976279/54495807-5858b600-48b5-11e9-98d4-0cfd5121cfa2.png)

La carpeta **test** contiene el archivo _csr.csv_  el cual es una ayuda para que usted entienda 
el mapa de memoria. En la carpeta **firmware** esta escrito el main.c, y demás archivos necesarios 
para nuestro software (explicación mas adelante). Luego se encuentran el archivo base.py donde se encuentra 
implementado nuestro **SOC**; los demás archivos .py a excepción de load.py son algunas 
implementaciones de hardware que serán usados por el soc para construir los periféricos pertinentes.

***

## Especificaciones de Hardware

Como se dijo anteriormente  el SoC esta implementado en el archivo _ base.py_   

```python
platform = Platform()


class BaseSoC(SoCCore):
   
    csr_peripherals = [
        ****
        ****
        ****
        ****
        ****
        ****
    ]

```

BaseSoC obtiene los atributos de SoCCore, la clase definida en el archivo _soc_core.py_  el cual  viene de **LiteX** 
con todo lo necesario para implementar un _SystemOnChip_ ademas  de tener  ya montado unos periféricos *uart* y *timer*. 
También se puede modificar su procesador (lm32 en este caso) y el tipo de bus para comunicación (wishbone).

Aquí declararemos nuestros periféricos **"leds"** ,**"botones"**, **"lcd"**, **"rs"**, **"rst"**, **"SD"**  los cuales serán explicados 
mas adelante.
###      arquitectura rs /rst

![Diagrama en blanco](https://user-images.githubusercontent.com/47976279/54499771-70dfc500-48e3-11e9-834d-2fdf0b929bef.png)

###      arquitectura botones

![botonesss](https://user-images.githubusercontent.com/47976279/54499832-2874d700-48e4-11e9-96dc-78d5ea0823b5.png)



El Soc presentara la siguiente arquitectura Maestro-esclavo:

![arq_HW1](https://user-images.githubusercontent.com/47976279/54497351-a2e32e00-48c7-11e9-8d77-1c22d0a3dbb1.png)


La Herramienta **LiteX**  construirá el   **Soc**  (cmd python3 base.py) obteniendo el siguiente mapa de memoria:

![mapa_memoria_1](https://user-images.githubusercontent.com/47976279/54497790-c78dd480-48cc-11e9-8f71-4b66660a0357.png)

A continuaion se muestra el mapa de memoria de cada periferico:

###      periferico lcd

![lcdMM](https://user-images.githubusercontent.com/47976279/54497874-e2147d80-48cd-11e9-9b84-a695fe7f22d4.png)

###      periferico rst/rs

![rs](https://user-images.githubusercontent.com/47976279/54497824-6b778000-48cd-11e9-9729-18c20a611c81.png)

![rst](https://user-images.githubusercontent.com/47976279/54497825-6f0b0700-48cd-11e9-95d3-a9043860aa9f.png)


###      periferico botones

![botones](https://user-images.githubusercontent.com/47976279/54497929-85fe2900-48ce-11e9-903a-888756f9f726.png)

###      periferico timer

![uart](https://user-images.githubusercontent.com/47976279/54498169-80eea900-48d1-11e9-99b0-8c199f4df6e1.png)

###      periferico uart

![uaruart](https://user-images.githubusercontent.com/47976279/54498251-e55e3800-48d2-11e9-9525-5debde142a05.png)

***
## Especificaciones de SOFTWARE

Como se menciono al comienzo , todo nuestro desarrollo de software se encontrara dentro de la carpeta firmware; aquí encontraremos varios archivo .c, .d, .h, .o y _makefile_ , los primeros son agrupaciones según el nombre (main, bloques ecc.).

![firmware](https://user-images.githubusercontent.com/47976279/54498363-6ff36700-48d4-11e9-8a18-387bcffc1c98.png)

 el proyecto  realizo la mayoría de sus requerimientos en software, continuación los mencionaremos  y explicaremos:


 ### configurar, iniciar y dibujar en la lcd
 
ya que el periférico spi que da **LiteX** no se modifico, la configuración inicial tuvo que ser hecha desde software; ademas  el dibujo fue echo gracias a una función que coloreaba pixel por pixel.

Todas las funciones para este fin se encuentran en  lcd.h, y se especifican en lcd.c
```h
#ifndef LCD_H
#define LCD_H

#include <stdio.h>
#include <generated/csr.h>

void lcd_config(void);

void lcd_inic(void);

void lcd_write( unsigned char rs, unsigned int info);  //escribe pixel

void dib_cua(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int ymax,unsigned int color); 
void dib_tiles(unsigned int Xmin,unsigned int Ymin,Matriz matris); //dibuja tiles

void busy_wait(unsigned int ds);

#endif

```


 ### desarrollo del juego
 
 el juego fue desarrollado en su totalidad en software y se divide en dos partes: la construcción del decorado/ambiente y la construcción de los objetos.

Para este fin se uso las funciones  de dibujado dib_cua (dibuja un cuadrado de un colo en una zona que se especifique y dib_tiles (en una zona de 15X15 dibuja una matriz que se especifica mas adelante).

El archivo juego.c tiene la función  _Juego_ en la cual se desarrolla todo el juego; cada nivel es una función diferente (ej. nivel1(void))

por ultimo cabe resaltar que el juego no tienen indicaciones ni mas dibujos debido a un saturamiento de la memoria (se explicara a continuación)

 ### dibujo de tiles
 
 Debido a problemas con el funcionamiento de la sd , se decidió colocar algunos tiles directamente en software, para esto se creo el archivo matrices.c donde se guardarían estas;   la función dib_tiles de lcd.c las lee y dibuja.

```h
unsigned int carrito1[14][14]={{0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000}};
/*

```

Un dato importante es el hecho de que  hay muy pocas matrices debido a que, al realizar esta tarea en software, se lleno la memoria .

![ram_llena](https://user-images.githubusercontent.com/47976279/54498780-45f07380-48d9-11e9-905b-324330fd61bb.png)

### el juego no esta escrito dentro en el main.c
Esta parte es crucial para  estandarizar el proyecto;  ya que permite el poder desarrollar otros juegos  e implementarlos en el proyecto.A continuación se muestra la función main.c, notese que esta funciona no tiene nada del juego en si; solo llama otra función que es _juego_ en donde esta implementado todo lo referente al juego.

### flujo del juego
por ultimo, a continuacion se  muestra un driagrama de flujo con el desarrollo del juego.

![flujo2](https://user-images.githubusercontent.com/47976279/54499816-fa8f9280-48e3-11e9-9e3c-93de88f5d81d.png)
