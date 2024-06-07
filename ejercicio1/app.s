	.equ SCREEN_WIDTH,   640
	.equ SCREEN_HEIGH,   480
	.equ BITS_PER_PIXEL, 32

	.equ GPIO_BASE,    0x3f200000
	.equ GPIO_GPFSEL0, 0x00
	.equ GPIO_GPLEV0,  0x34

	.globl main

main:
	//x10 Guardamos el color
	//x0 contiene la direccion base del framebuffer
	//---------------- CODE HERE ------------------------------------
	
	bl fondo
	
	bl sillon
	bl cuadro
	bl lamparaTecho

	bl escritorio
	bl gabinete
	bl monitor
	bl teclado
	bl mouse
	bl lampara

	bl InfLoop						//Terminar Imagen

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

lamparaTecho:
	sub 	sp, sp, 8
	stur	lr, [sp, 0]
	
	movz 	x14, 0x190, lsl 0		/*foquito */
	movz 	x15, 0x60, lsl 0
	movz 	x2, 0x10, lsl 0
	movz 	x10, 0xff00, lsl 0
	movk	x10, 0xff, lsl 16
	bl		circulo

 	sub		x14, x14, 0x40			/*el coso de la lampara */
	sub 	x15, x15, 0x0
	movz 	x3, 0x85, lsl 0
	movz 	x10, 0x143c, lsl 0
	movk 	x10, 0xdc, lsl 16
	bl 		triangulo 

 	add 	x14, x14, 0x3f			/*sosten de la lampara */
	sub 	x15, x15, 0x60
	movz	x12, 0x196, lsl 0
	movz 	x13, 0x21, lsl 0
	movz 	x10, 0xc0c0, lsl 0
	movk 	x10, 0xc0, lsl 16
	bl 		rectangulo  
	

	ldur	lr, [sp, 0]
	add 	sp, sp, 8
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cuadro:
	sub 	sp, sp, 8
	stur	lr, [sp, 0]

	movz 	x14, 0x90, lsl 0			/* hilo donde cuelga el cuadro */
	movz 	x15, 0x60, lsl 0
	movz	x3, 0x35, lsl 0
	movz 	x10, 0x0000, lsl 0
	bl 		triangulo

	add		x14, x14, 0x1				
	sub 	x3, x3, 0x2
	movz	x10,0xcc99,lsl 0		
	movk	x10,0xff,lsl 16
	bl 		triangulo

	sub 	x14, x14, 0x30				/* marco del caudro */
	movz 	x12, 0xf5, lsl 0
	movz 	x13, 0xaf, lsl 0
	movz 	x10, 0x853f, lsl 0
	movk 	x10, 0xcd, lsl 16
	bl 		rectangulo

	add 	x14, x14, 0x6				/* cielo */
	add 	x15, x15, 0x6
	sub 	x12, x12, 0x6
	sub 	x13, x13, 0x6
	movz 	x10, 0xc4de, lsl 0
	movk 	x10, 0xb0, lsl 16
	bl 		rectangulo

	add 	x15, x15, 0x35				/* mar */
	movz 	x10, 0x90ff, lsl 0
	movk 	x10, 0x1e, lsl 16
	bl rectangulo

	add 	x14, x14, 0x20				/* parte inferior del barco */
	sub 	x12, x12, 0x30
	sub 	x15, x15, 0x07
	sub 	x13, x13, 0x0a
	movz 	x10, 0x4513, lsl 0
	movk 	x10, 0x8b, lsl 16 
	bl 		rectangulo

	sub 	x14, x14, 0x5				/* parte superior del barco */
	sub 	x15, x15, 0x0
	add		x12, x12, 0x5
	sub 	x13, x13, 0x6
	movz 	x10, 0x3406, lsl 0
	movk 	x10, 0x6f, lsl 16
	bl 		rectangulo

	add 	x3, x3, 0x10				/* vela */
	sub 	x15, x15, 0x7		
	sub 	x14, x14, 0x4
	movz 	x10, 0xf8ff, lsl 0
	movk 	x10, 0xf8, lsl 16
	bl 		triangulo

	add 	x14, x14, 0x22				/* corte vela */
	sub 	x15, x15, 0x20
	sub 	x12, x12, 0x4
	sub 	x13, x13, 0x6
	movz 	x10, 0xc4de, lsl 0
	movk 	x10, 0xb0, lsl 16
	bl 		rectangulo

	sub		x14, x14, 0x18				/* segunda vela */
	add 	x15, x15, 0x23
	add		x12, x12, 0x4
	add 	x13, x13, 0x6
	movz 	x10, 0xf8ff, lsl 0
	movk 	x10, 0xf8, lsl 16
	bl 		triangulo

	add 	x14, x14, 0x18				/* corte vela */
	sub 	x15, x15, 0x21
	sub 	x12, x12, 0x1b
	sub 	x13, x13, 0x6
	movz 	x10, 0xc4de, lsl 0
	movk 	x10, 0xb0, lsl 16
	bl 		rectangulo

	add		x15, x15, 0x1f				/* corte vela */
	sub 	x14, x14, 0x23
	bl 		rectangulo

	add 	x14, x14, 0x25				/* mastil */
	sub 	x12, x12, 0x3
	sub 	x15, x15, 0x23
	movz 	x10, 0x3406, lsl 0
	movk 	x10, 0x6f, lsl 16
	bl 		rectangulo

	sub 	x14, x14, 0x27				/* nubes */
	add 	x15, x15, 0x7
	add 	x2, x2, 0x3
	movz 	x10, 0xf5f5, lsl 0
	movk 	x10, 0xf5, lsl 16
	bl 		circulo

	sub 	x14, x14, 0x5
	add 	x15, x15, 0x5
	bl 		circulo

	add 	x14, x14, 0x0f
	bl 		circulo

	sub		x14, x14, 0x6
	add 	x15, x15, 0x3
	bl 		circulo

	add		x14, x14, 0x60				/* sol */
	sub 	x15, x15, 0x2
	add 	x2, x2, 0x5
	movz 	x10, 0xcb00, lsl 0
	movk	x10, 0xeb, lsl 16
	bl 		circulo

	sub		x2, x2, 0x4
	movz 	x10, 0xd700, lsl 0
	movk 	x10, 0xff, lsl 16
	bl 		circulo

	ldur 	lr, [sp, 0]
	add 	sp, sp, 8
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

mouse:								//Procedimiento para dibujar un mouse
	sub		sp,sp,8
	stur	lr,[sp,0]

	movz	x10,0xb6b6,lsl 0		//Color mouse
	movk	x10,0xb6,lsl 16

	movz	x14,0x220,lsl 0			//mouse
	movz	x15,0x149,lsl 0
	add		x12,x14,16
	movz	x13,0x150,lsl 0
	bl rectangulo

	add		x14,x14,7				//Ruedita del mouse
	add		x12,x14,2
	mov		x13,x15
	sub		x15,x15,2
	bl rectangulo

	ldur	lr,[sp,0]
	add		sp,sp,8
	br		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

teclado:							//Procedimiento para dibujar un teclado
	sub 	sp,sp,16
	stur 	lr,[sp,0]
	
	movz	x10,0x2d2d,lsl 0		//Color base teclado
	movk	x10,0x2d,lsl 16

	movz	x14,0x130,lsl 0			//Base teclado
	movz	x15,0x148,lsl 0
	movz	x12,0x1e0,lsl 0
	movz	x13,0x150,lsl 0
	bl rectangulo

	sub		x15,x15,4				//Teclas del teclado
	sub		x13,x13,9
	movz 	x10,0x6060,lsl 0
	movk	x10,0x60,lsl 16
	teclasTeclado:
		add		x14,x14,2
		add		x12,x14,4
		cmp		x14,0x144
		b.eq	barraEspacio
		bl rectangulo
		finEspacio:
		cmp		x14,0x1da
		mov		x14,x12
		b.ne	teclasTeclado
		b		finalTeclado
	barraEspacio:
		stur	x12,[sp,8]
		movz	x12,0x174,lsl 0
		bl rectangulo
		ldur	x12,[sp,8]
		b  		finEspacio

	finalTeclado:
	ldur	lr,[sp,0]
	add 	sp,sp,16
	br		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

gabinete:							//Procedimiento para dibujar un gabinete
	sub 	sp,sp,8
	stur	lr,[sp,0]

	movz	x2,0x3,lsl 0

	movz	x14,0x110,lsl 0			//Gabinete
	movz	x15,0x18e,lsl 0
	add		x12,x14,70
	movz	x13,0x1e0,lsl 0
	movz	x10,0x2525,lsl 0
	movk	x10,0x25,lsl 16
	bl rectangulo

	movz	x10,0x3030,lsl 0		//Diseño del gabinete
	movk	x10,0x30,lsl 16
	add		x14,x14,3
	add		x15,x15,8
	sub		x12,x12,3
	disenoGabinete:
		add		x15,x15,14
		add		x13,x15,14
		bl rectangulo
		add		x15,x15,4
		sub		x2,x2,1
		cbnz	x2,disenoGabinete

	movz	x10,0x3535,lsl 0		//Boton apagado
	movk	x10,0x35,lsl 16
	sub		x14,x12,6
	movz	x15,0x199,lsl 0
	add		x2,x2,6
	bl circulo
	movz	x10,0x99,lsl 16			
	sub		x2,x2,2
	bl circulo

	sub		x14,x14,10				//Boton reinicio
	sub		x2,x2,1
	movz	x10,0x6060,lsl 0
	movk	x10,0x60,lsl 16
	bl circulo

	ldur	lr,[sp,0]
	add		sp,sp,8
	br 		lr
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

escritorio:							//Procedimiento para dibujar un escritorio
	sub 	sp,sp,8
	stur	lr,[sp,0]
	
	movz	x14,0x100,lsl 0			//Tabla del escritorio
	movz	x15,0x151,lsl 0
	movz	x12,0x277,lsl 0
	movz	x13,0x158,lsl 0
	movz	x10,0x3300,lsl 0
	movk	x10,0x66,lsl 16
	bl rectangulo

	add		x15,x13,1				//Pata derecha
	add		x12,x14,15
	movz	x13,0x1e0,lsl 0
	bl rectangulo
	
	movz	x14,0x269,lsl 0			//Pata izquierda
	movz	x12,0x277,lsl 0
	bl rectangulo

	movz	x14,0x110,lsl 0			//Parte tracera
	movz	x15,0x159,lsl 0	
	movz	x12,0x268,lsl 0
	movz	x13,0x1b0,lsl 0
	movz	x10,0x2e00,lsl 0
	movk	x10,0x5c,lsl 16
	bl rectangulo

	ldur	lr,[sp,0]
	add		sp,sp,8
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

lampara:							//Procedimiento para dibujar una lampara
	sub 	sp, sp, 8
	stur 	lr, [sp, 0]
	movz 	x14, 0x255, lsl 0		/* base de la lampara */	
	movz 	x15, 0x150, lsl 0		/* x14 = 0x255 = 597,	x15 = 0x150 = 336, 	x3 = 0x20 = 32 */
	movz 	x3, 0x20, lsl 0
	movz 	x10, 0x6060, lsl 0
	movk	x10, 0x60, lsl 16
	bl 		triangulo

	add 	x14, x14, 0x10			/* linea vertical */
	sub 	x15, x15, 0x30			/* x14 = 0x265 = 613,	x15 = 0x120 = 288,	x12 = 0x129 = 297,	x13 = 0x140 = 320 */
	movz 	x12, 0x129, lsl 0
	movz 	x13, 0x140, lsl 0
	movz 	x10, 0x0000, lsl 0
	movk 	x10, 0x00, lsl 0
	bl 		rectangulo

	sub 	x14, x14, 0x15			/* linea horizontal */
	add 	x12, x12, 0x13c			/* x14 = 0x250 = 592,	x15 = 0x25c = 604,	x13 = 0x120 = 288 */
	sub 	x13, x13, 0x20
	movz 	x10, 0x0000, lsl 0
	movk 	x10, 0x00, lsl 0
	bl 		rectangulo

	sub 	x12, x12, 0x15			/* linea vertical 2 */
	add 	x13, x13, 0x7			/* x12 = 0x114 = 276,	x13 = 0x127 = 295 */
	movz 	x10, 0x0000, lsl 0
	movk 	x10, 0x00, lsl 0
	bl 		rectangulo

	add 	x15, x15, 0x10			/* circulo */
	movz	x2, 0xc, lsl 0			/* x15 = 0x26c = 620,	x2 = 0xc = 12 */
	movz 	x10, 0x6060, lsl 0
	movk	x10, 0x60, lsl 16
	bl 		circulo

	sub		x14, x14, 0xc			/* cortar circulo */
	add 	x12, x12, 0xc			/*	x14 = 0x244 = 580,	x12 = 0x120 = 288,	x3 = 0x13b = 315 */
	add		x13, x13, 0x14
	movz	x10,0xcc99,lsl 0		//Cargamos el color de la "pared de la casa"
	movk	x10,0xff,lsl 16
	bl 		rectangulo

	add 	x14, x14, 0xc			/* foquito */
	sub 	x2, x2, 0x5				/* x14 = 0x250 = 592,	x2 = 0xa= 10 */
	movz	x10, 0xff00, lsl 0
	movk	x10, 0xff, lsl 16
	bl 		circulo

	sub 	x14, x14, 0x7			/* cortar foquito */
	sub 	x15, x15, 0x6			/* x14 = 0x249 = 585,	x15 = 0x266 = 614,	x12 = 0x11a = 282,	x13 = 0x11b = 283 */
	sub 	x12, x12, 0x6
	sub 	x13, x13, 0xc
	movz 	x10, 0x6060, lsl 0
	movk	x10, 0x60, lsl 16
	bl 		rectangulo

	ldur	lr, [sp, 0]
	add		sp, sp, 8
	br 		lr 

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

monitor:							//Procedimiento para dibujar el monitor
	sub		sp,sp,8
	stur	lr,[sp,0]

	movz	x14,0x148,lsl 0			//Posicion inicial X superior del monitor
	movz	x15,0x98,lsl 0			//Posicion inicial Y superior del monitor
	movz	x12,0x238,lsl 0			//Posicion final X inferior del monitor
	movz	x13,0x128,lsl 0			//Posicion final Y inferior del monitor
	movz	x10,0x2020,lsl 0		//Color girs oscuro para el marco del monitor
	movk	x10,0x20,lsl 16
	bl rectangulo
	
	add		x14,x14,8				//Posicion inicial X del fondo de pantalla del monitor
	add		x15,x15,8				//Posicion inicial Y del fondo de pantalla del monitor
	sub		x12,x12,8				//Posicion final X del fondo de pantalla del monitor
	sub		x13,x13,8				//Posicion final Y del fondo de pantalla del monitor
	movz	x10,0x2953,lsl 0		//Color para el fondo de pantalla
	movk	x10,0x77,lsl 16
	bl rectangulo

	sub		x12,x12,0x30			//Posicion final X inferior de la terminal			
	sub		x13,x13,0x30			//Posicion final Y inferior de la terminal
	movz	x10,0x4040,lsl 0		//Cargamos un color gris la terminal
	movk	x10,0x40,lsl 16
	bl rectangulo
	

	movz	x14,0x230,lsl 0			//Posicion inicial X de la luz de encendido
	sub		x14,x14,7
	movz	x15,0x120,lsl 0			//Posicion inicial Y de la luz de encendido
	add		x15,x15,4
	movz	x10,0xff,lsl 0			//Color de la luz de encendido
	movz	x3,0x5,lsl 0			//Largo de la linea
	bl pintarLineaHorizontal

	movz	x14,0x150,lsl 0			//Posicion inicial X superior del borde de la terminal
	movz	x15,0xa0,lsl 0			//Posicion inicial Y superior del borde de la terminal
	movz	x12,0x200,lsl 0			//Posicion final X inferior del borde de la terminal
	movz	x13,0xa8,lsl 0			//Posicion final Y inferior del borde de la terminal
	movz	x10,0x4e4e,lsl 0		//Color del borde de la terminal
	movk	x10,0x4e,lsl 16
	bl	rectangulo

	add 	x14,x14,8				//Dibuja el runQEMU
	add		x15,x15,18
	bl runqemu
	
	movz	x14,0x1fc,lsl 0			//Boton cerrar terminal
	movz	x15,0xa4,lsl 0
	movz	x2,0x3,lsl 0
	movz	x10,0xcc,lsl 16
	bl circulo

	sub		x14,x14,10				//Boton minimizar terminal
	movz	x3,0x4,lsl 0
	movz	x10,0xe0e0,lsl 0
	movk	x10,0xe0,lsl 16
	bl pintarLineaHorizontal

	movz	x14,0x150,lsl 0			//Barra de tareas de Ubuntu
	movz	x15,0x118,lsl 0
	movz	x12,0x230,lsl 0
	movz	x13,0x120,lsl 0
	movz	x10,0x2750,lsl 0
	movk	x10,0x5e,lsl 16
	bl rectangulo
	add		x15,x15,2
	movz	x12,0x1f0,lsl 0
	sub		x13,x13,1
	movz	x10,0x3900,lsl 0
	barraDeTarea:
		add		x14,x14,4
		add		x12,x14,4
		bl rectangulo
		add		x10,x10,0xe
		mov		x14,x12
		cmp		x12,0x1e6
		b.le	barraDeTarea


	bl cables						//Dibuja cables del monitor al gabinete
		
	movz	x14,0x1ba,lsl 0			//Base del monitor
	movz	x15,0x129,lsl 0
	movz	x12,0x1c5,lsl 0
	movz	x13,0x14d,lsl 0
	movz	x10,0x2020,lsl 0
	movk	x10,0x20,lsl 16
	bl rectangulo
	movz	x14,0x180,lsl 0
	mov		x15,x13
	movz	x12,0x200,lsl 0
	add		x13,x13,3
	bl rectangulo

	ldur	lr,[sp,0]
	add		sp,sp,8
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

cables:								//Procedimiento para dibujar cables
	sub 	sp,sp,8
	stur	lr,[sp,0]

	movz	x10,0x0,lsl 0			//Color del cable

	movz	x14,0x1e9,lsl 0			//2 cables de atras del monitor
	movz	x15,0x129,lsl 0
	add		x12,x14,2
	movz	x13,0x150,lsl 0
	bl rectangulo

	add		x14,x12,9
	add		x12,x14,2
	bl rectangulo

	movz	x14,0x15f,lsl 0			//3 cables de atras del gabinete
	movz	x15,0x1b1,lsl 0
	add		x12,x14,2
	movz	x13,0x1bf,lsl 0
	bl rectangulo

	add		x14,x12,4
	add		x12,x14,2
	add		x13,x13,4
	bl rectangulo

	add		x14,x12,3
	add		x12,x14,2
	sub		x13,x13,12
	bl rectangulo

	movz	x14,0x157,lsl 0
	movz	x15,0x1bd,lsl 0
	add		x12,x14,7
	add		x13,x15,2
	bl rectangulo

	add 	x15,x15,4
	add		x12,x12,6
	add		x13,x13,4
	bl rectangulo

	sub		x15,x15,12
	add		x12,x12,5
	sub		x13,x13,12
	bl rectangulo


	ldur	lr,[sp,0]
	add		sp,sp,8
	br		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

runqemu:							//Proceso para escribir MAKE RUNQEMU
	sub		sp,sp,40
	stur 	lr,[sp,0]
	stur 	x2,[sp,8]
	stur	x3,[sp,16]
	stur	x14,[sp,24]
	stur	x15,[sp,32]

	movz	x10,0xffff,lsl 0		//Color Blanco
	movk	x10,0xff,lsl 16

	movz	x2,0x4,lsl 0			//Cargamos el largo de las diagonales

	bl diagonalDab					// >
	bl pintarPixel
	sub 	x14,x14,1
	add		x15,x15,1
	bl diagonalIab

	add		x14,x14,7				// M
	sub 	x15,x15,11
	add 	x12,x14,xzr
	add		x13,x15,10
	bl rectangulo
	add		x14,x14,1
	movz	x2,0x3,lsl 0
	bl diagonalDab
	bl pintarPixel
	add 	x14,x14,1
	sub		x15,x15,1
	bl diagonalDar
	add 	x15,x15,1
	add 	x12,x14,xzr
	add		x13,x15,10
	bl rectangulo

	add		x14,x14,2				// A
	add 	x12,x14,xzr
	bl rectangulo
	add		x14,x14,1
	movz	x3,0x5,lsl 0
	bl pintarLineaHorizontal
	add		x15,x15,4
	bl pintarLineaHorizontal
	add		x14,x14,5
	sub		x15,x15,4
	add 	x12,x14,xzr
	bl rectangulo

	add		x14,x14,2				// K
	add 	x12,x14,xzr
	bl rectangulo
	add 	x15,x15,5
	add		x14,x14,1
	movz	x2,0x5,lsl 0
	bl diagonalDar
	sub 	x14,x14,5
	add		x15,x15,6
	bl diagonalDab

	add		x14,x14,1				// E
	sub		x15,x15,11
	add 	x12,x14,xzr
	bl rectangulo
	add		x14,x14,1
	bl pintarLineaHorizontal
	add		x15,x15,5
	bl pintarLineaHorizontal
	add		x15,x15,5
	bl pintarLineaHorizontal 

	add		x14,x14,11				//R
	sub		x15,x15,10
	add 	x12,x14,xzr
	bl rectangulo
	add		x14,x14,1
	bl pintarLineaHorizontal

	add		x14,x14,7				//U
	add 	x12,x14,xzr
	bl rectangulo
	add		x15,x15,10
	bl pintarLineaHorizontal
	add		x14,x14,5
	sub		x15,x15,10
	add 	x12,x14,xzr
	bl rectangulo

	add 	x14,x14,3				//N
	add 	x12,x14,xzr
	bl rectangulo
	movz 	x2,0x6,lsl 0
	bl diagonalDab
	sub 	x15,x15,6
	add 	x12,x14,xzr
	bl rectangulo

	add		x14,x14,3				//Q
	add 	x12,x14,xzr
	bl rectangulo
	bl pintarLineaHorizontal
	add		x15,x15,10
	bl pintarLineaHorizontal
	add		x14,x14,5
	sub		x15,x15,10
	add 	x12,x14,xzr
	bl rectangulo
	add 	x15,x15,8
	sub		x14,x14,2
	movz	x2,0x4,lsl 0
	bl diagonalDab

	add		x14,x14,1				// E
	sub		x15,x15,12
	add 	x12,x14,xzr
	bl rectangulo
	add		x14,x14,1
	bl pintarLineaHorizontal
	add		x15,x15,5
	bl pintarLineaHorizontal
	add		x15,x15,5
	bl pintarLineaHorizontal 

	add		x14,x14,7				// M
	sub 	x15,x15,10
	add 	x12,x14,xzr
	add		x13,x15,10
	bl rectangulo
	add		x14,x14,1
	movz	x2,0x3,lsl 0
	bl diagonalDab
	bl pintarPixel
	add 	x14,x14,1
	sub		x15,x15,1
	bl diagonalDar
	add 	x15,x15,1
	add 	x12,x14,xzr
	add		x13,x15,10
	bl rectangulo

	add		x14,x14,3				//U
	add 	x12,x14,xzr
	bl rectangulo
	add		x15,x15,10
	bl pintarLineaHorizontal
	add		x14,x14,5
	sub		x15,x15,10
	add 	x12,x14,xzr
	bl rectangulo

	ldur	x15,[sp,32]
	ldur	x14,[sp,24]
	ldur 	x3,[sp,16]
	ldur	x2,[sp,8]
	ldur 	lr,[sp,0]
	add		sp,sp,40
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

diagonalDab:						//Procedimiento para hacer una diagonal hacia la derecha y ABAJO desde (x14,x15) = (X,Y) de x2 de largo
	sub 	sp,sp,16				//Reservamos lugar en el stack
	stur	lr,[sp,0]				//Guardamos el return address
	stur 	x13,[sp,8]				//Guardamos lo que haya en x13
	add		x13,xzr,xzr				//Inicializamos nuestro contador en 0
	diagDab:
		bl 		pintarPixel			//Pintamos pixel
		add 	x14,x14,1			//Sumamos 1 a la direccion X donde inicia la diagonal
		add 	x15,x15,1			//Sumamos 1 a la direccion Y donde inicia la diagonal
		add 	x13,x13,1			//Incrementamos el contador
		cmp		x2,x13				//Comparamos si el contador llego a la distancia deseada de la diagonal
		b.ne 	diagDab				//Si no llego, repetimos el loop
	ldur	x13,[sp,8]				//Recuperamos x13
	ldur	lr,[sp,0]				//Recuperamos return address
	add		sp,sp,16
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

diagonalDar:						//Procedimiento para hacer una diagonal hacia la derecha y ARRIBA desde (x14,x15) = (X,Y) de x2 de largo
	sub 	sp,sp,16				//Reservamos lugar en el stack
	stur	lr,[sp,0]				//Guardamos el return address
	stur 	x13,[sp,8]				//Guardamos lo que haya en x13
	add		x13,xzr,xzr				//Inicializamos nuestro contador en 0
	diagDar:
		bl 		pintarPixel			//Pintamos pixel
		add 	x14,x14,1			//Sumamos 1 a la direccion X donde inicia la diagonal
		sub 	x15,x15,1			//Restamos 1 a la direccion Y donde inicia la diagonal
		add 	x13,x13,1			//Incrementamos el contador
		cmp		x2,x13				//Comparamos si el contador llego a la distancia deseada de la diagonal
		b.ne 	diagDar				//Si no llego, repetimos el loop
	ldur	x13,[sp,8]				//Recuperamos x13
	ldur	lr,[sp,0]				//Recuperamos return address
	add		sp,sp,16
	br 		lr


//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

diagonalIab:						//Procedimiento para hacer una diagonal hacia la izquierda y ABAJO desde (x14,x15) = (X,Y) de x2 de largo
	sub 	sp,sp,16				//Reservamos lugar en el stack
	stur	lr,[sp,0]				//Guardamos el return address
	stur 	x13,[sp,8]				//Guardamos lo que haya en x13
	add		x13,xzr,xzr				//Inicializamos nuestro contador en 0
	diagIab:
		bl 		pintarPixel			//Pintamos pixel
		sub 	x14,x14,1			//Restamos 1 a la direccion X donde inicia la diagonal
		add 	x15,x15,1			//Sumamos 1 a la direccion Y donde inicia la diagonal
		add 	x13,x13,1			//Incrementamos el contador
		cmp		x2,x13				//Comparamos si el contador llego a la distancia deseada de la diagonal
		b.ne 	diagIab				//Si no llego, repetimos el loop
	ldur	x13,[sp,8]				//Recuperamos x13
	ldur	lr,[sp,0]				//Recuperamos return address
	add		sp,sp,16
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

diagonalIar:						//Procedimiento para hacer una diagonal hacia la izquierda y ARRIBA desde (x14,x15) = (X,Y) de x2 de largo
	sub 	sp,sp,16				//Reservamos lugar en el stack
	stur	lr,[sp,0]				//Guardamos el return address
	stur 	x13,[sp,8]				//Guardamos lo que haya en x13
	add		x13,xzr,xzr				//Inicializamos nuestro contador en 0
	diagIar:
		bl 		pintarPixel			//Pintamos pixel
		sub 	x14,x14,1			//Restamos 1 a la direccion X donde inicia la diagonal
		sub 	x15,x15,1			//Restamos 1 a la direccion Y donde inicia la diagonal
		add 	x13,x13,1			//Incrementamos el contador
		cmp		x2,x13				//Comparamos si el contador llego a la distancia deseada de la diagonal
		b.ne 	diagIar				//Si no llego, repetimos el loop
	ldur	x13,[sp,8]				//Recuperamos x13
	ldur	lr,[sp,0]				//Recuperamos return address
	add		sp,sp,16
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

fondo:								//Procedimiento para pintar todo el fondo de un color x10
	sub		sp,sp,8					//Reservamos 1 byte para sp
	stur	lr,[sp,0]				//Guardamos el return address
	movz 	x14,0x0,lsl 0			//Cargamos la posicion X inicial del framebuffer, "pared de la casa"
	movz	x15,0x0,lsl 0			//Cargamos la posicion Y inicial del framebuffer, "pared de la casa"
	movz	x12,0x280,lsl 0			//Cargamos la posicion X final de la "pared de la casa"
	movz	x13,0x150,lsl 0			//Cargamos la posicion Y final de la "pared de la casa"
	movz	x10,0xcc99,lsl 0		//Cargamos el color de la "pared de la casa"
	movk	x10,0xff,lsl 16
	bl rectangulo					//Dibujamos la "pared de la casa"
	movz	x15,0x151,lsl 0			//Cargamos la posicion Y inicial del "piso de la casa"
	movz	x13,0x1e0,lsl 0			//Cargamos la posicion Y final del "piso de la casa"
	movz	x10,0xaa6e,lsl 0		//Cargamos el color del "piso de la casa"
	movk 	x10,0xd8,lsl 16			
	bl rectangulo					//Dibujamos el "piso de la casa"
	ldur 	lr,[sp,0]				//Recuperamos el return address
	add 	sp,sp,8
	br 		lr
	
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

sillon:								//Procedimiento para dibujar un sillon
	sub 	sp,sp,8
	stur	lr,[sp,0]
	
	movz 	x14, 0x25, lsl 0		/* circulo arriba izquierdo del respaldo */
	movz 	x15, 0xfc, lsl 0		
	movz	x2, 0xd, lsl 0
	movz	x10, 0x691e, lsl 0 
	movk 	x10, 0xd2, lsl 16
	bl 		circulo

	sub 	x2, x2, 0x3				/* sombra del circulo arriba izquierda del respaldo*/
	movz 	x10, 0x702c, lsl 0		
	movk	x10, 0xe0, lsl 16
	bl 		circulo
/*
	movz	x10, 0x691e, lsl 0 
	movk 	x10, 0xd2, lsl 16
chocolate
*/

/*
	movz 	x10, 0x702c, lsl 0		
	movk	x10, 0xe0, lsl 16
color del sillon de los simpson (supuestamente)
*/
	add		x14, x14, 0x100			/* circulo parte derecha arriba del respaldo */
	add 	x2, x2, 0x3
	movz	x10, 0x691e, lsl 0 
	movk 	x10, 0xd2, lsl 16
	bl 		circulo		

	sub 	x2, x2, 0x3				/* sombra del circulo arriba derecha del respaldo*/
	movz 	x10, 0x702c, lsl 0		
	movk	x10, 0xe0, lsl 16
	bl 		circulo	

	sub 	x14, x14, 0x102
	sub 	x15, x15, 0xc
	movz 	x12, 0x127, lsl 0
	movz 	x13, 0x108, lsl 0
	movz	x10, 0x691e, lsl 0 
	movk 	x10, 0xd2, lsl 16
	bl 		rectangulo

	add		x15, x15, 0x3			/*sombra */
	movz 	x10, 0x702c, lsl 0		
	movk	x10, 0xe0, lsl 16
	bl 		rectangulo

	sub		x14, x14, 0xa
	add		x15, x15, 0xa
	add 	x12, x12, 0xa
	add 	x13, x13, 0x48
	movz	x10, 0x691e, lsl 0 
	movk 	x10, 0xd2, lsl 16
	bl rectangulo

	add		x14, x14, 0x3			/* sombra */
	sub 	x12, x12, 0x3
	sub 	x13, x13, 0x3
	movz 	x10, 0x702c, lsl 0		
	movk	x10, 0xe0, lsl 16
	bl rectangulo

	add 	x15, x15, 0x27			/*pata izquierda */
	add 	x2, x2, 0x3
	movz	x10, 0x691e, lsl 0 
	movk 	x10, 0xd2, lsl 16
	bl 		circulo

	sub 	x2, x2, 0x3				/*pata izquierda */
	movz 	x10, 0x702c, lsl 0		
	movk	x10, 0xe0, lsl 16
	bl 		circulo

	sub 	x14, x14, 0xc			/*pata izquieda */
	sub 	x12, x12, 0x106
	add 	x13, x13, 0x3
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16
	bl 		rectangulo

	add 	x14, x14, 0x3			/*pata izquierda */
	sub 	x12, x12, 0x3
	sub 	x13, x13, 0x3
	movz 	x10, 0x702c, lsl 0	
	movk	x10, 0xe0, lsl 16
	bl 		rectangulo

	add 	x2, x2, 0x3
	add 	x14, x14, 0x11d
	add 	x15, x15, 0x1
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16
	bl 		circulo

	sub 	x2, x2, 0x3
	movz 	x10, 0x702c, lsl 0	
	movk	x10, 0xe0, lsl 16
	bl 		circulo

	sub 	x14, x14, 0xc		/*pata derecha */
	add 	x15, x15, 0x0
	add 	x12, x12, 0x117
	add 	x13, x13, 0x3
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16
	bl 		rectangulo

 	add 	x14, x14, 0x3		/* sombra */		
	sub 	x12, x12, 0x3
	sub 	x13, x13, 0x3
	movz 	x10, 0x702c, lsl 0	
	movk	x10, 0xe0, lsl 16
	bl 		rectangulo 

	add 	x15, x15, 0x17		/* piso */
	sub 	x14, x14, 0x100
	sub		x12, x12, 0x14
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16
	bl 		rectangulo

	add 	x14, x14, 0x2		/*sombra del piso */
	sub		x12, x12, 0x2
	add 	x15, x15, 0x3
	movz 	x10, 0x702c, lsl 0	
	movk	x10, 0xe0, lsl 16
	bl 		rectangulo

	sub		x15, x15, 0x14		/*cogines */
	sub 	x13, x13, 0x20
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16	
	bl 		rectangulo

	add 	x13, x13, 0x10
	sub 	x12, x12, 0xaa
	bl 		rectangulo

	add		x15, x15, 0x03
	sub		x13, x13, 0x02
	sub		x12, x12, 0x3
	movz 	x10, 0x702c, lsl 0	
	movk	x10, 0xe0, lsl 16
	bl 		rectangulo

	add 	x14, x14, 0x50
	add 	x12, x12, 0x5f
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16	
	bl 		rectangulo
	
	add 	x14, x14, 0x01
	sub		x12, x12, 0x3
	movz 	x10, 0x702c, lsl 0	
	movk	x10, 0xe0, lsl 16
	bl 		rectangulo

	sub 	x14, x14, 0x25			/* puntitos del sillon */
	sub 	x15, x15, 0x20
	sub 	x2, x2, 0x6
	movz	x10, 0x691e, lsl 0
	movk 	x10, 0xd2, lsl 16	
	bl 		circulo

	add 	x14, x14, 0x50
	bl 		circulo

	add 	x14, x14, 0x50
	bl 		circulo

	ldur	lr, [sp, 0]
	add 	sp, sp, 8
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

rectangulo:							//Procedimiento para hacer un rectangulo (x14, x15) = (XSuperior,YSuperior) y (x12, x13) = (XInferior,YIinferiro) 
	sub 	sp,sp,40				//Reservamos 5 bytes para sp
	stur 	lr,[sp,0]				//Guardamos lr en sp[0]
	stur 	x12,[sp,8]				//Guardamos x12 = XI en sp[1]
	stur 	x13,[sp,16]				//Guardamos x13 = YI en sp[2]
	stur 	x14,[sp,24]				//Guardamos x14 = XS en sp[3]
	stur 	x15,[sp,32]				//Guardamos x15 = YS en sp[4]
	loopRectFila:
		ldur 	x15,[sp,32]
	loopRectColumna:
		bl 		pintarPixel
		add		x15,x15,1
		subs 	xzr,x15,x13
		b.le 	loopRectColumna
		add 	x14,x14,1
		subs 	xzr,x14,x12
		b.le 	loopRectFila	
	ldur 	x15,[sp,32]				//Recuperamos x15
	ldur 	x14,[sp,24]				//Recuperamos x14
	ldur 	x13,[sp,16]				//Recuperamos x13
	ldur 	x12,[sp,8]				//Recuperamos x12
	ldur 	lr,[sp,0]				//Recuperamos lr
	add 	sp,sp,40
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

circulo: 							//Proceso para hacer un circulo, dado coordenadas del centro (x14, x15), el radio (x2) y el color (x10)
	sub 	sp,sp,32
    stur 	lr,[sp,0]
	stur	x14,[sp,8]
	stur	x15,[sp,16]
	stur	x2,[sp,24]

	mov 	x18,x14 				//Guarda la coordenada X
	mov 	x19,x15					//Guarda la coordenada Y
	add 	x25,x14,x2 				//Guarda el valor (radio+X) 
	add 	x27,x15,x2 				//Guarda el valor (radio+Y)
	sub 	x14,x14,x2				//Guarda el valor (X-radio)
	sub 	x15,x15,x2 				//Guarda el valor (Y-radio) 
	smull 	x22,w2,w2 				//Guarda r^2
    loopCirculo:
        sub 	x23,x14,x18 		//X - x0
        smull 	x23,w23,w23 		//(X - x0)^2
        sub 	x24,x15,x19			//Y - y0
        smull 	x24,w24,w24 		//(Y - y0)^2
        add 	x24,x24,x23 		//(X - x0)^2 + (Y - y0)^2
        cmp 	x22,x24				//Compara si r^2 con (X - x0)^2 + (Y - y0)^2
        b.le 	skipPinta
        bl 		pintarPixel
    skipPinta:
        add 	x14,x14,1
        cmp 	x25,x14
        b.ne 	loopCirculo
        sub 	x14,x14,x2
        sub 	x14,x14,x2
        add 	x15,x15,1
        cmp 	x27,x15
        b.ne 	loopCirculo

	ldur	x2,[sp,24]
	ldur	x15,[sp,16]
	ldur	x14,[sp,8]
    ldur 	lr,[sp,0] 				//Recupero la direccion de partida
    add 	sp,sp,32
    br 		lr 						//Salto a la direccion de partida

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

triangulo:							//(x14,x15) = (x,y)
	sub		sp,	sp, 32
	stur 	lr, [sp, 0]
	stur 	x14, [sp, 8]			//X
	stur 	x15, [sp, 16]			//Y
	stur 	x3,	[sp, 24]			//Longitud
	loopTriangulo:
		bl 		pintarLineaHorizontal
		sub 	x3, x3, 2			//restamos 2 a la longitud
		sub 	x15, x15, 1			//sumamos y para movernos a la siguiente fila
		add		x14, x14, 1			//sumamos x para movernos a la siguiente fila
		cmp		xzr, x3			//si 0<x16
		b.lt	loopTriangulo
	ldur 	x3, [sp, 24]
	ldur	x15, [sp, 16]
	ldur	x14, [sp, 8]
	ldur 	lr, [sp, 0]
	add 	sp, sp, 32
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

pintarPixel:						//Procedimiento para pintar pixel, tomamos x10 = color, (x14,x15) = (X,Y)
	sub		sp,sp,8	
	stur 	x27,[sp,0]				
	mov		x27,SCREEN_WIDTH		//x27 = 640
	mul	 	x27,x15,x27				//x27 = y * 640
	add 	x27,x14,x27				//x27 = x + (y * 640)
	lsl		x27,x27,2				//x27 = 4 * [x + (y * 640)]
	add 	x27,x0,x27				//x27 = DirInit + 4 * [x + (y * 640)]
	stur	w10,[x27]				//Pintamos el Pixel
	ldur	x27,[sp,0]
	add 	sp,sp,8
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

pintarLineaHorizontal:				//Procedimiento que pinta una linea horizontal, toma (x14,x15) = (x,y), un color (x10) y un contador/longitud (x3)
	sub 	sp, sp, 32
	stur 	lr, [sp, 0]
	stur 	x3, [sp, 8]
	stur 	x15, [sp, 16]
	stur 	x14, [sp, 24]
	loopPintarFila:
		bl		pintarPixel			//Pintamos 
		add		x14, x14, 1			//Nos movemos en x
		sub 	x3, x3, 1			//Restamos el contador
		cbnz	x3, loopPintarFila	//Si el contador no es 0 => volvemos a loopa
	ldur 	x14, [sp, 24]
	ldur 	x15, [sp, 16]
	ldur 	x3, [sp, 8]
	ldur 	lr, [sp, 0] 
	add 	sp, sp, 32
	br 		lr

//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

InfLoop:
	b InfLoop
