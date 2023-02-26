;***************************************************************
;Guardar como: BONAFONTE.asm
;20           Rojo Castellon Cesar Salim       
;10           Figueroa Ruiz Pedro
;
;===============================================================
;TECLA                  ASCII           CODIGO RASTREO
;===============================================================
;Flecha arriba            0                   48h
;Flecha abajo             0                   50h
;Flecha derecha           0                   4Dh
;Flecha izquierda         0                   4Bh
;Escape                  1BH                  01h
;*************************************************************** 
#start=thermometer.exe#;PARA ABRIR EL TERMOMETRO
INCLUDE MACROS.LIB
.model small
.stack
.data
        msjTitulo     db '***BONAFONTE***                 '
        msjOp1        db '[ ] Estado Animales             '
        msjOp2        db '[ ] Registrar especie           '
        msjOp3        db '[ ] Areas acuaticas             '
        msjOp4        db '[ ] Peligro Extincion           '
        msjOp5        db '[ ] Salir                       '
        msjOp         db 'Presiona ENTER para seleccionar'
        ren           db 0
        ren2          db 6
        rastreo       db 0
        ascii         db 0
        msjEstado     db 'Animal: XXXXXXXXXXXXXXX    '
        msjRegistro   db 'Datos: XXXXXXXXXXXXXXX     '
        msjAreas      db 'Area: XXXXXXXXXXXXXXX      '
        msjPeligro    db 'En Peligro: XXXXXXXXXXXXXXX'
        rLinea        db 0                            
        msjEscape     db 'Presione ESCAPE para regresar'
        ;***********VARIABLES PARA REGISTRO ESPECIES***********
        ruta1         db 'C:\BONAFONTE', 0
        ruta          db 'C:\BONAFONTE\RegistroEspecie.txt', 0
        msjErrorAbrir db 'Error al ABRIR el archivo'
        msjErrorCrear db 'Error al CREAR el archivo'
        msjErrorCreaC db 'Error al CREAR la carpeta'   
        msjSi         db 'Se ha ESCRITO en el archivo'
        msjNo         db 'NO se ha ESCRITO en el archivo'
        msjSiCarp     db 'Se ha creado la carpeta'
        msjSiArch     db 'Se ha creado el archivo'
        
        msjTituloReg  db '****REGISTRAR ESPECIE MARINA****'
        msjTitImpres  db '****DATOS DE LA ESPECIE MARINA****' 
        msjNomEspec   db 'Nombre Especie   :            '
        msjNomCien    db 'Nombre Cientifico:            '
        msjAreaEspec  db 'Area de especie  :            '
        msjCondicion  db 'Condicion especie:            '
        NombreEspecie db 16, 0, 16 dup(' ')
        NomCientifico db 31, 0, 31 dup(' ')
        AreaEspecie   db 21, 0, 21 dup(' ')
        CondicionEsp  db 16, 0, 16 dup(' ')
        
        msjTitRegEspe db '***REGISTRO ESPECIES***'
        
        msjCrearCar1  db '|======================|'
        msjCrearCar2  db '|                      |'
        msjCrearCar3  db '| [ ] Crear Carpeta    |'
        msjCrearCar4  db '|                      |'
        msjCrearCar5  db '|======================|'
        
        msjCrearArc1  db '|======================|'
        msjCrearArc2  db '|                      |'
        msjCrearArc3  db '| [ ] Crear Archivo    |'
        msjCrearArc4  db '|                      |'
        msjCrearArc5  db '|======================|'
        
        msjEscriArc1  db '|======================|'
        msjEscriArc2  db '|                      |'
        msjEscriArc3  db '| [ ] Escribir Archivo |'
        msjEscriArc4  db '|                      |'
        msjEscriArc5  db '|======================|'
        
        ren4          db 8
        
        Tort1         db '  _____     ____  '
        Tort2         db ' /      \  |  o | '
        Tort3         db '|        |/ ___\| '
        Tort4         db '|_________/       '
        Tort5         db '|_|_| |_|_|       '
        
        Delf1         db '         ,        '
        Delf2         db '      __)\___     '
        Delf3         db '  _.-´      .`-.  '
        Delf4         db '.´/~~```"~z/~´"`  '
        Delf5         db '^^                '
        
        ;***********VARIABLES PARA REGISTRO ESPECIES FIN******       
        letras1       db  'OOOO    OO   OO     O   OO   OOOO   OO   OO     O  OOOOO  OOOO'
        letras2       db  'O   O  O  O  O O    O  O  O  O     O  O  O O    O    O    O   '
        letras3       db  'O   O  O  O  O  O   O  O  O  O     O  O  O  O   O    O    O   '
        letras4       db  'OOOO   O  O  O   O  O  OOOO  OOO   O  O  O   O  O    O    OOO '
        letras5       db  'O   O  O  O  O    O O  O  O  O     O  O  O    O O    O    O   '
        letras6       db  'O   O  O  O  O     OO  O  O  O     O  O  O     OO    O    O   '
        letras7       db  'OOOO    OO   O      O  O  O  O      OO   O      O    O    OOOO'
        ;***********VARIABLES PARA PELIGRO EXTINCION******
        msjTitPelExt  db '***ESPECIES EN PELIGRO DE EXTINCION***'
        msjEspecie1   db '[ ] Tortuga Caguama'
        msjEspecie2   db '[ ] Picote Tequila '
        msjEspecie3   db '[ ] Caballo Mar    '
        msjEspecie4   db '[ ] Mantarraya     '
        
        msjTortuga1   db 'Se estima que quedan      '
        msjTortuga2   db 'menos de 50,000 ejemplares'
        
        msjCaballo1   db 'Es una especie de pez de  '
        msjCaballo2   db 'la familia Syngnathidae   '
        
        msjPicote1    db 'Se calcula que quedan unos 500'
        msjPicote2    db 'ejemplares -de ellos solo 50  '
        msjPicote3    db 'adultos reproductores         '
        
        msjManta1     db 'Se estima que quedan menos de '
        msjManta2     db '500,000 en todo el mundo      '
        
        ren3          db 6
        
        Tortuga1      db '|===============|'
        Tortuga2      db '|     _.._    _ |'
        Tortuga3      db '|   ."\__/"./`_\|'
        Tortuga4      db '| _/__<__>__\/  |'
        Tortuga5      db '|`"/_/""""\_\\  |'
        Tortuga6      db '|               |'
        Tortuga7      db '|===============|'
        
        Pez1      db '|=====================|'
        Pez2      db '|      /"*._         _|'
        Pez3      db '|  .-*`    `*-.._.-/| |'
        Pez4      db '|< * ))     ,       ( |'
        Pez5      db '|  `*-._`._(__.--*"`.\|'
        Pez6      db '|                     |'
        Pez7      db '|=====================|'
        
        Caballo1  db '|=====================|'
        Caballo2  db '|      \``/           |'
        Caballo3  db '|      /o `))         |'
        Caballo4  db '|     /_/\_ss))       |'
        Caballo5  db '|         |_ss))/|    |'
        Caballo6  db '|        |__ss))_|    |'
        Caballo7  db '|       |__sss))_|    |'
        Caballo8  db '|       |___ss))\|    |'
        Caballo9  db '|        |_ss))       |'
        Caballo10 db '|         )_s))       |'
        Caballo11 db '|   (`(  /_s))        |'
        Caballo12 db '|    (_\/_s))         |'
        Caballo13 db '|     (\/))           |'
        Caballo14 db '|=====================|'
        
        mant1      db '|==========================|'  
        mant2      db '|           __|__          |'
        mant3      db '|         _/     \_        |'
        mant4      db '|        /         \       |'
        mant5      db '|     __/           \__    |'
        mant6      db '|    /      *   *      \   |'
        mant7      db '|   /      *     *      \  |'
        mant8      db '|  /        *   *        \ |'
        mant9      db '| (        *     *        )|'
        mant10     db '|  \        *   *        / |'
        mant11     db '|   \                   /  |'
        mant12     db '|    \                 /   |' 
        mant13     db '|     \ ( O )   ( O ) /    |'
        mant14     db '|      \   _______   /     |'
        mant15     db '|       | |       | |      |'
        mant16     db '|       \_/       \_/      |'
        mant17     db '|==========================|'

        ;***********VARIABLES PARA PELIGRO EXTINCION FIN******
        ;***********VARIABLES PARA ESTATUS******
        datosLeidos   db 60 dup(' ')
        ;***********VARIABLES PARA ESTATUS FIN******
        salto         db 10 
        
        ;-------------------------VARIABLES DEL MAPA-----------------------------
         m0                db   '       ===============================================================        '
         m1                db   '       |          \________               _____/                     |        '
         m2                db   '       |          /        \_____      __/                           |        '
         m3                db   '       |         /  /\           \  __/                              |        '
         m4                db   '       |         \  \ \           \/  \          GOLFO DE            |        '
         m5                db   '       |          \  \ \               \          MEXICO             |        '
         m6                db   '       |           \  \ \               \          [3]               |        '
         m7                db   '       |           /  / /               /                            |        '
         m8                db   '       |           \  \ \              /             ________________|        '
         m9                db   '       |            \_/  \             \        ____/                |        '     
         m10               db   '       |                  \             \      /    \                |        '
         m11               db   '       |                   \             \____/     /                |        '
         m12               db   '       |                    \___                   /     CARIBE      |        '
         m13               db   '       |     PACIFICO      /    \_____         ___/     MEXICANO     |        '
         m14               db   '       |      NORTE       /           \_______/   \       [4]        |        '
         m15               db   '       |       [1]       /                    \_   \                 |        '
         m16               db   '       |              /\/                       \__/                 |        '
         m17               db   '       |             /       PACIFICO           /  \                 |        '
         m18               db   '       |            /          SUR            _/    \__              |        '
         m19               db   '       |           /           [2]           /         \___          |        '
         m20               db   '       |          /                         /              \         |        '
         m21               db   '       |         /                         /                \        |        '
         m22               db   '       |         \                        /                  \       |        '
         m23               db   '       ===============================================================        '
         M24               DB   '       ===============================================================           '
        ;LISTA DE ESPECIES EN PELIGRO QUE SE IMPRIMEN EN LA IMPRESORA
        TITULO_NORTE    DB '*****ESPECIES PACIFICO NORTE***** $' 
        TITULO_SUR      DB '******ESPECIES PACIFICO SUR****** $'
        TITULO_CARIBE   DB '*****ESPECIES CARIBE MEXICO****** $'
        TITULO_GOLFO    DB '****ESPECIES GOLFO DE MEXICO***** $'
        E1_NORTE        DB '1.- Ballena Azul[3,000]          ' 
        E2_NORTE        DB '2.- León Marino Steller[30,000]  '
        E3_NORTE        DB '3.- Ajolote mexicano[100]        '
        E4_NORTE        DB '4.- Foca Monje Mediterránea[350] '
        E5_NORTE        DB '5.- Nutria Marina[300,000]       '
        E1_SUR          DB '1.- Ballena azul[3,000]          '
        E2_SUR          DB '2.- Tiburón raya[1200]           '
        E3_SUR          DB '3.- Tiburon Blanco[470-1030]     '
        E4_SUR          DB '4.- Tortuga Carey[30,000]        '
        E5_SUR          DB '5.- Ballena azul[3,000]          '
        E1_GOLFO        DB '1.- Totoaba (Totoaba macdonaldi) '                 
        E2_GOLFO        DB '2.- Vaquita Marina[10 ejemplares]'
        E3_GOLFO        DB '3.- Tortuga Lora[5,500]          '
        E4_GOLFO        DB '4.- Tiburón Martillo Gigante[400]'
        E5_GOLFO        DB '5.- Delfín de Cabeza Blanca[100] '
        E1_CARIBE       DB '1.- Tortuga carey[30,000]        '
        E2_CARIBE       DB '2.- Manatí del Caribe[2,000]     '
        E3_CARIBE       DB '3.- Los delfines nariz de botella'
        E4_CARIBE       DB '4.- Tortuga Caguama(boba)[50,000]'
        E5_CARIBE       DB '5.- Picote tequila(Zoogoneticus) '  
        TEMP            DB 0  
        I               DB 'IMP '
        T               DB 'TEMP'
        
;-------------------------LOGIN----------------------------------------------------------------------------  
   USER_1  DB 9,0,9 DUP('$')
   PASS_1  DB 5,0,5 DUP('$')  
   USER    DB   'INTERFAZ$'
   PASS    DB   '1234$'  
   
   LOG2    DB   ' ___       ________  ________  ___  ________      '
   LOG3    DB   '|\  \     |\   __  \|\   ____\|\  \|\   ___  \    '
   LOG4    DB   '\ \  \    \ \  \|\  \ \  \___|\ \  \ \  \\ \  \   '
   LOG5    DB   ' \ \  \    \ \  \\\  \ \  \  __\ \  \ \  \\ \  \  '
   LOG6    DB   '  \ \  \____\ \  \\\  \ \  \|\ \\ \  \ \  \\ \  \ '
   LOG7    DB   '   \ \_______\ \_______\ \______\\ \__\ \__\\ \__\'
   LOG8    DB   '    \|_______|\|_______|\|_______|\|__|\|__| \|__|'                                  
   ;LOG2    DB   '   _       _____  ________  _____  __    _   '
   ;LOG3    DB   '  | |     |  _  ||  ______||_   _||  \  | |  '
   ;LOG4    DB   '  | |     | | | || |  ____   | |  |   \ | |  '
   ;LOG5    DB   '  | |     | | | || | |__  |  | |  | |\ \| |  '
   ;LOG6    DB   '  | |____ | |_| || |____| | _| |_ | | \   |  '
   ;LOG7    DB   '  |______||_____||________||____ ||_|  \__|  '
   ;LOG8    DB   ' ___________________________________________ ' 
   ;LOG9_1  DB   '                    |                                   |                       '
   LOG9_1  DB   '                                                  '
   LOG9    DB   '                    |                                   |                       '
   LOG10   DB   '       __)\_        |   USUARIO:___________________     |                       '
   LOG11   DB   ' (\_.-´    a`-.     |   |                          |    |                       '
   LOG12   DB   ' (/~~````(/~^^`     |   |__________________________|    |                       '
   LOG13   DB   '                    |                                   |      .                '
   LOG14   DB   '                    |                                   |     ":"               '
   LOG15   DB   '                    |   CONTRASENA:________________     |   ___:____     |"\/"| '
   LOG16   DB   '                    |   |                          |    | ,´        `.    \  /  '
   LOG17   DB   '        .           |   |__________________________|    | |  O        \___/  |  '
   LOG18   DB   '  \_____)\_____     |                                   |^~^~^~^~^~^~^~^~^~^~^~ '
   LOG19   DB   '  /--v____ __`<     |                                   |                       '
   LOG20   DB   '          )/        |                                   |                       '
   LOG21   DB   '          ´´        |                                   |                       '
   LOG22   DB   '                    |                                   |                       '
   LOG23   DB   '                    |                                   |                       '
   LOG24   DB   '                    |___________________________________|                       '
  
   manejador     dw 0
        
.code
inicio:
        MOV AX, @DATA
        MOV DS, AX
        MOV ES, AX 
LOGIN:        
    SCROLL_ARRIBA 0, 0, 0, 24, 79, 3BH 
    BEEP
     ;IMPRIMIR LINEAS PA QUE SE VEA BONITO
    CURSOR 0, 0, 0
      ;veces, caracter, pagina, color
      CARACTER_COLOR 80, 177, 0, 3BH
    CURSOR 2, 0, 0
      CARACTER_COLOR 80, 177, 0, 3BH
    IMPRIMIR_TEXTO LOG2,50,1,14,0,0B3H 
    IMPRIMIR_TEXTO LOG3,50,2,14,0,0B3H 
    IMPRIMIR_TEXTO LOG4,50,3,14,0,0B3H 
    IMPRIMIR_TEXTO LOG5,50,4,14,0,0B3H 
    IMPRIMIR_TEXTO LOG6,50,5,14,0,0B3H 
    IMPRIMIR_TEXTO LOG7,50,6,14,0,0B3H 
    IMPRIMIR_TEXTO LOG8,50,7,14,0,0B3H
    IMPRIMIR_TEXTO LOG9_1,50,8,14,0,0B3H  
    IMPRIMIR_TEXTO LOG9,80,9,0,0,3BH 
    IMPRIMIR_TEXTO LOG10,80,10,0,0,3BH 
    IMPRIMIR_TEXTO LOG11,80,11,0,0,3BH 
    IMPRIMIR_TEXTO LOG12,80,12,0,0,3BH 
    IMPRIMIR_TEXTO LOG13,80,13,0,0,3BH 
    IMPRIMIR_TEXTO LOG14,80,14,0,0,3BH 
    IMPRIMIR_TEXTO LOG15,80,15,0,0,3BH 
    IMPRIMIR_TEXTO LOG16,80,16,0,0,3BH 
    IMPRIMIR_TEXTO LOG17,80,17,0,0,3BH 
    IMPRIMIR_TEXTO LOG18,80,18,0,0,3BH
    IMPRIMIR_TEXTO LOG19,80,19,0,0,3BH 
    IMPRIMIR_TEXTO LOG20,80,20,0,0,3BH 
    IMPRIMIR_TEXTO LOG21,80,21,0,0,3BH 
    IMPRIMIR_TEXTO LOG22,80,22,0,0,3BH 
    IMPRIMIR_TEXTO LOG23,80,23,0,0,3BH 
    IMPRIMIR_TEXTO LOG24,80,24,0,0,3BH           
    CURSOR 11,25,0
    LEER_INFO USER_1 
    MOV CX,8 ;INICIALIZAR CX
    MOV SI, OFFSET USER
    MOV DI, OFFSET USER_1+2
    CICLO_USER:
        MOV DL, [SI]
        MOV DH, [DI]
        CMP DL,DH
        JNE LOGIN
        INT 21H
        INC SI
        INC DI
     LOOP CICLO_USER  
    
    CURSOR 16,25,0
    LEER_INFO PASS_1 
    
    MOV CX,4 ;INICIALIZAR CX
    MOV SI, OFFSET PASS
    MOV DI, OFFSET PASS_1+2
    CICLO_PASSWORD:
        MOV DL, [SI]
        MOV DH, [DI]
        CMP DL,DH
        JNE LOGIN
        ;INT 21H
        INC SI
        INC DI
     LOOP CICLO_PASSWORD 
        
        MOV CX, 25
        JMP fondo
reinicio:
        ;PARA QUE SE BORRE CUALQUIER PANTALLA DONDE TE ENCUENTRES
        SCROLL_ARRIBA 0, 0, 0, 24, 79, 3BH
        JMP lineas
        
        MOV CX, 25
fondo:
     PUSH CX        
        ;1. FONDO
        CURSOR ren, 0, 0
            CARACTER_COLOR 80, 219, 0, 3H   ;IMPRIMIR LINEA
          INC ren
            POP CX
        LOOP fondo

lineas:        
        ;IMPRESION LINEAS HORIZONTALES
        CURSOR 3, 0, 0
            CARACTER_COLOR 80, 177, 0, 3BH
        CURSOR 5, 0, 0
            CARACTER_COLOR 80, 177, 0, 3BH
        CURSOR 17, 0, 0
            CARACTER_COLOR 80, 177, 0, 3BH
        CURSOR 0, 0, 0
            CARACTER_COLOR 80, 177, 0, 3BH         
        
        IMPRIME_CAD_COLOR letras1, 62, 18, 10, 0, 3BH, 0
        IMPRIME_CAD_COLOR letras2, 62, 19, 10, 0, 3BH, 0
        IMPRIME_CAD_COLOR letras3, 62, 20, 10, 0, 3BH, 0
        IMPRIME_CAD_COLOR letras4, 62, 21, 10, 0, 3BH, 0        
        IMPRIME_CAD_COLOR letras5, 62, 22, 10, 0, 3BH, 0
        IMPRIME_CAD_COLOR letras6, 62, 23, 10, 0, 3BH, 0
        IMPRIME_CAD_COLOR letras7, 62, 24, 10, 0, 3BH, 0
            
        ;2. IMPRESION DEL MENU
        ;CADENA,LONG,REN,COL,PAG,COLOR,MODO
        IMPRIME_CAD_COLOR msjTitulo, 15, 4, 33, 0, 3BH, 0
                  IMPRIME_CAD_COLOR msjOp1 25, 6, 30, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjOp2 25, 8, 30, 0, 3BH, 0
                  IMPRIME_CAD_COLOR msjOp3 25, 10, 30, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjOp4 25, 12, 30, 0, 3BH, 0
                  IMPRIME_CAD_COLOR msjOp5 25, 14, 30, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjOp 31, 16, 26, 0, 3BH, 0
   
cicloFlechas:
     CURSOR ren2, 31, 0
        
     MOV AH, 0
     INT 16H
       CMP AH, 48H
       JE arriba
       CMP AH, 50H
       JE abajo
       CMP AL, 13
       JE enter
                    
arriba:
     CMP ren2, 6
     JE abajo
     DEC ren2
     DEC ren2
     JMP cicloFlechas
abajo:     
     CMP ren2, 14
     JE arriba
     INC ren2
     INC ren2
     JMP cicloFlechas

ENTER: 
    MOV AL, ren2
    CMP AL, 6
    JE Estado_Especies
    CMP ren2, 8
    JE Registro_Especies_Principal
    CMP AL, 10
    JE Areas_Acuaticas
    CMP AL, 12
    JE Peligro_Extincion
    JMP fin
   
Estado_Especies:
    ;AQUI VA LO DE LA IMPRESORA
    ;ABRIMOS EL ARCHIVO
    BEEP 
    ABRIR_ARCHIVO ruta, 2
        MOV manejador, AX
        JC error_abrir
        
    ;LEEMOS EL ARCHIVO
    LEER_ARCHIVO manejador, 60, datosLeidos
    
    ;INICIALIZAMOS LA IMPRESORA
incio_impresora:
        MOV AH, 5
        MOV DL, 12
        INT 21H
    
    MOV CX, 37
    MOV SI, OFFSET msjTitImpres
encabezado:
    MOV AH, 5
    MOV DL, [SI]
    INT 21H
     INC SI
      LOOP encabezado
            
            MOV AH, 5
            MOV DL, 13
            INT 21H
                MOV AH, 5
                MOV DL, 9
                INT 21H    
        
    MOV SI, OFFSET datosLeidos
    MOV CX, 60
imprimir:
        MOV AH, 5
        MOV DL, [SI]
        INT 21H
         INC SI
          LOOP imprimir
    JMP reinicio
    
error_abrir:
    CURSOR 20, 25, 0
        IMPRIME_CAD_COLOR msjErrorAbrir, 25, 20, 30, 0, 3BH, 0

Registro_Especies_Principal:
    BEEP
    ;USANDO LA MACRO SCROLL PARA LIMPIAR LA PANTALLA
    SCROLL_ARRIBA 0, 0, 0, 24, 79, 3BH
    
    ;IMPRIMIR LINEAS PA QUE SE VEA BONITO
    CURSOR 0, 0, 0
      ;veces, caracter, pagina, color
      CARACTER_COLOR 80, 177, 0, 3BH
    CURSOR 2, 0, 0
      CARACTER_COLOR 80, 177, 0, 3BH
    
    ;HACER TODO EL MENU DONDE NOS VAMOS A MOVER
    ;cadena, long, ren, col, pag, color, modo
    IMPRIME_CAD_COLOR msjTitRegEspe, 23, 1, 31, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearCar1, 24, 6, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearCar2, 24, 7, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearCar3, 24, 8, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearCar4, 24, 9, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearCar5, 24, 10, 29, 0, 3BH, 0
        
        IMPRIME_CAD_COLOR msjCrearArc1, 24, 11, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearArc2, 24, 12, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearArc3, 24, 13, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearArc4, 24, 14, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCrearArc5, 24, 15, 29, 0, 3BH, 0
        
        IMPRIME_CAD_COLOR msjEscriArc1, 24, 16, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEscriArc2, 24, 17, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEscriArc3, 24, 18, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEscriArc4, 24, 19, 29, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEscriArc5, 24, 20, 29, 0, 3BH, 0
        
        IMPRIME_CAD_COLOR Tort1, 18, 13, 0, 0, 3BH, 0
        IMPRIME_CAD_COLOR Tort2, 18, 14, 0, 0, 3BH, 0
        IMPRIME_CAD_COLOR Tort3, 18, 15, 0, 0, 3BH, 0
        IMPRIME_CAD_COLOR Tort4, 18, 16, 0, 0, 3BH, 0
        IMPRIME_CAD_COLOR Tort5, 18, 17, 0, 0, 3BH, 0 
        
        IMPRIME_CAD_COLOR Delf1, 18, 14, 56, 0, 3BH, 0
        IMPRIME_CAD_COLOR Delf2, 18, 15, 56, 0, 3BH, 0
        IMPRIME_CAD_COLOR Delf3, 18, 16, 56, 0, 3BH, 0
        IMPRIME_CAD_COLOR Delf4, 18, 17, 56, 0, 3BH, 0
        IMPRIME_CAD_COLOR Delf5, 18, 18, 56, 0, 3BH, 0
                                      
        IMPRIME_CAD_COLOR msjEscape, 29, 23, 29, 0, 3BH, 0
    
cicloFlechas3:
        CURSOR ren4, 32, 0
        
        MOV AH, 0
        INT 16H
            CMP AH, 48H
            JE arriba3
            CMP AH, 50H
            JE abajo3
            CMP AL, 13
            JE ENTER3
            CMP AH, 01H
            JE reinicio
                    
arriba3:
           CMP ren4, 8
           JE abajo3
           DEC ren4
           DEC ren4
           DEC ren4
           DEC ren4
           DEC ren4
           JMP cicloFlechas3

abajo3:     
           CMP ren4, 18
           JE arriba3
           INC ren4
           INC ren4
           INC ren4
           INC ren4
           INC ren4
           JMP cicloFlechas3

ENTER3: 
    MOV AL, ren4
    CMP AL, 8
    JE Registro_Especies_CARPETA
    CMP ren4, 13
    JE Registro_Especies_ARCHIVO
    CMP AL, 18
    JE Registro_Especies_ESCRIBIR
    JMP fin    

Registro_Especies_CARPETA:
        CREAR_CARPETA ruta1
         JC errorCrearC         ;JC = BANDERA DE ACARREO ENCENDIDA
            ;CADENA,LONG,REN,COL,PAG,COLOR,MODO
            IMPRIME_CAD_COLOR msjSiCarp, 23, 22, 29, 0, 3BH, 0   
        JMP cicloFlechas3             
         
errorCrearC:
         IMPRIME_CAD_COLOR msjErrorCreaC, 25, 22, 29 , 0, 3BH, 0 
         JMP fin    
        
Registro_Especies_ARCHIVO:
        CREAR_ARCHIVO ruta
         JC errorCrearA
          IMPRIME_CAD_COLOR msjSiArch, 23, 22, 29, 0, 3BH, 0
        JMP cicloFlechas3
         
errorCrearA:
        IMPRIME_CAD_COLOR msjErrorCrear, 25, 22, 29, 0, 3BH, 0
        JMP fin              
    
Registro_Especies_ESCRIBIR:
BEEP
    ;USANDO LA MACRO SCROLL PARA LIMPIAR LA PANTALLA
    SCROLL_ARRIBA 0, 0, 0, 24, 79, 3BH
    
    IMPRIME_CAD_COLOR msjTituloReg, 32, 4, 23, 0, 3BH, 0                  
    ;ABRIR ARCHIVO
    ABRIR_ARCHIVO ruta, 2   
        MOV manejador, AX  ;Regresar al manejador
    JC error_abrir
    
    ;IMPRIMIR EL FORMULARIO        cadena, long, ren, col, pag, color, modo
    IMPRIME_CAD_COLOR msjNomEspec, 29, 6, 23, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjNomCien, 30, 8, 23, 0, 3BH, 0
    IMPRIME_CAD_COLOR msjAreaEspec, 29, 10, 23, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjCondicion, 30, 12, 23, 0, 3BH, 0 
    
    IMPRIME_CAD_COLOR msjEscape, 29, 23, 29, 0, 3BH, 0
    
    ;CURSOR 6, 50, 0
    ;MOV AH, 0
    ;INT 16H
     ;       CMP AH, 01H
     ;       JE Registro_Especies_Principal
    
    ;CAPTURAR LOS DATOS
    CURSOR 6, 45, 0
    LEER_CADENA NombreEspecie
        CURSOR 8, 45, 0
        LEER_CADENA NomCientifico
    CURSOR 10, 45, 0
    LEER_CADENA AreaEspecie
        CURSOR 12, 45, 0
        LEER_CADENA CondicionEsp
        
    ;ESCRIBIR LOS DATOS SOLICITADOS POR TECLADO EN EL ARCHIVO
    XOR CX, CX   ;INICIALIZAR A 0
    MOV CL, NombreEspecie[1]
     ESCRIBIR_ARCHIVO manejador, CX, NombreEspecie+2
      ESCRIBIR_ARCHIVO manejador, 1, salto
       ESCRIBIR_ARCHIVO manejador, 1, salto
        XOR CX, CX   
        MOV CL, NomCientifico[1]
        ESCRIBIR_ARCHIVO manejador, CX, NomCientifico+2
         ESCRIBIR_ARCHIVO manejador, 1, salto
          ESCRIBIR_ARCHIVO manejador, 1, salto 
    XOR CX, CX 
    MOV CL, AreaEspecie[1]
    ESCRIBIR_ARCHIVO manejador, CX, AreaEspecie+2     
     ESCRIBIR_ARCHIVO manejador, 1, salto    
      ESCRIBIR_ARCHIVO manejador, 1, salto
        XOR CX, CX   
        MOV CL, CondicionEsp[1]
        ESCRIBIR_ARCHIVO manejador, CX, CondicionEsp+2
         ESCRIBIR_ARCHIVO manejador, 1, salto
          ESCRIBIR_ARCHIVO manejador, 1, salto
        
    
    ;MENSAJE DE "SE HA ESCRITO EN EL ARCHIVO"
    IMPRIME_CAD_COLOR msjSi, 27, 20, 28, 0, 3BH, 0
    MOV AH, 0
    INT 16H
            CMP AH, 01H
            JE reinicio 
    
    ;POR SI DA UN ERROR AL ABRIR EL ARCHIVO
error_abrir2:
        IMPRIME_CAD_COLOR msjErrorAbrir, 25, 20, 28, 0, 3BH, 0
        JMP fin
;*********************************CODIGO DEL MAPA**********************************       
Areas_Acuaticas: 
    BEEP
    ;AQUI VA LO DEL MAPA
    ;USANDO LA MACRO SCROLL PARA LIMPIAR LA PANTALLA
    SCROLL_ARRIBA 0, 0, 0, 24, 79, 0H  
    IMPRIMIR_TEXTO M0,80,0,0,0,3BH
    IMPRIMIR_TEXTO M1,80,1,0,0,3BH 
    IMPRIMIR_TEXTO M2,80,2,0,0,3BH 
    IMPRIMIR_TEXTO M3,80,3,0,0,3BH 
    IMPRIMIR_TEXTO M4,80,4,0,0,3BH 
    IMPRIMIR_TEXTO M5,80,5,0,0,3BH 
    IMPRIMIR_TEXTO M6,80,6,0,0,3BH 
    IMPRIMIR_TEXTO M7,80,7,0,0,3BH 
    IMPRIMIR_TEXTO M8,80,8,0,0,3BH 
    IMPRIMIR_TEXTO M9,80,9,0,0,3BH 
    IMPRIMIR_TEXTO M10,80,10,0,0,3BH 
    IMPRIMIR_TEXTO M11,80,11,0,0,3BH 
    IMPRIMIR_TEXTO M12,80,12,0,0,3BH 
    IMPRIMIR_TEXTO M13,80,13,0,0,3BH 
    IMPRIMIR_TEXTO M14,80,14,0,0,3BH 
    IMPRIMIR_TEXTO M15,80,15,0,0,3BH 
    IMPRIMIR_TEXTO M16,80,16,0,0,3BH 
    IMPRIMIR_TEXTO M17,80,17,0,0,3BH
    IMPRIMIR_TEXTO M18,80,18,0,0,3BH 
    IMPRIMIR_TEXTO M19,80,19,0,0,3BH 
    IMPRIMIR_TEXTO M20,80,20,0,0,3BH 
    IMPRIMIR_TEXTO M21,80,21,0,0,3BH 
    IMPRIMIR_TEXTO M22,80,22,0,0,3BH 
    IMPRIMIR_TEXTO M23,80,23,0,0,3BH 
    IMPRIMIR_TEXTO M24,80,24,0,0,3BH  
    
;TEXTO,LONG,REN,COL,MODO,COLOR
IMPRESORA:
IMPRIMIR_TEXTO I,4,0,76,0,4CH
CICLO_PRINTER:
    MOV AH,0 ;RASTREO
    INT 16H 
       CMP AL,49
       JE UNOE
       CMP AL,50
       JE DOSE 
       CMP AL,51
       JE TRESE
       CMP AL,52
       JE CUATROE 
       CMP AL,84
       JE TERMO 
       CMP AL,116
       JE TERMO 
       CMP AH, 01H
       JE reinicio
     JMP CICLO_PRINTER       
UNOE: 
    CURSOR 15,16,0
    ESPECIES_PRINTER TITULO_NORTE,E1_NORTE,E2_NORTE,E3_NORTE,E4_NORTE,E5_NORTE
    JMP CICLO_PRINTER
DOSE: 
    CURSOR 19,32,0                                      
    ESPECIES_PRINTER TITULO_SUR,E1_SUR,E2_SUR,E3_SUR,E4_SUR,E5_SUR 
    JMP CICLO_PRINTER
TRESE:
    CURSOR 6,52,0                                    
    ESPECIES_PRINTER TITULO_GOLFO,E1_GOLFO,E2_GOLFO,E3_GOLFO,E4_GOLFO,E5_GOLFO     
    JMP CICLO_PRINTER
CUATROE: 
    CURSOR 14,59,0                                        
    ESPECIES_PRINTER TITULO_CARIBE,E1_CARIBE,E2_CARIBE,E3_CARIBE,E4_CARIBE,E5_CARIBE
    JMP CICLO_PRINTER
        
;-------------------------------------------------------------------------
TERMO:
IMPRIMIR_TEXTO T,4,0,76,0,4CH
TERMOMETRO:
   MOV AH,0 ;RASTREO
    INT 16H 
       CMP AL,49
       JE UNOT
       CMP AL,50
       JE DOST 
       CMP AL,51                                    
       JE TREST
       CMP AL,52
       JE CUATROT 
       CMP AL,73
       JE IMPRESORA 
       CMP AL,105
       JE IMPRESORA 
       CMP AH, 01H
       JE reinicio
     JMP TERMOMETRO       
UNOT:
    MOV TEMP,37 
    CURSOR 15,16,0
    JMP PRENDER
DOST:
    MOV TEMP,40
    CURSOR 19,32,0
    JMP PRENDER
TREST:
    MOV TEMP,27
    CURSOR 6,52,0  
    JMP PRENDER
CUATROT:
    MOV TEMP,30 
    CURSOR 14,59,0
    JMP PRENDER
    
PRENDER: 
      MOV AL,1;ENCENDER EL TERMOMETRO        
      OUT 127,AL
      MOV CX,1
      MOV SI,1
      JMP CICLO_INFINITO      
APAGAR: 
    MOV AL,0
    OUT 127,AL
    JMP TERMOMETRO
    
CICLO_INFINITO:
 IN AL,125 
 CMP AL,TEMP
 JAE MAYOR 
INC SI
MOV CX,SI
LOOP CICLO_INFINITO

MAYOR:
    BEEP
    BEEP
    BEEP
    JMP APAGAR  
    
;----------------------------------------------------------------------------------    
Peligro_Extincion:
    BEEP
    ;USANDO LA MACRO SCROLL PARA LIMPIAR LA PANTALLA
    SCROLL_ARRIBA 0, 0, 0, 24, 79, 3BH
    
    ;IMPRIMIR LINEAS PA QUE SE VEA BONITO
    CURSOR 0, 0, 0
      ;veces, caracter, pagina, color
      CARACTER_COLOR 80, 177, 0, 3BH
    CURSOR 2, 0, 0
      CARACTER_COLOR 80, 177, 0, 3BH
    
    ;HACER TODO EL MENU DONDE NOS VAMOS A MOVER
    ;cadena, long, ren, col, pag, color, modo
    IMPRIME_CAD_COLOR msjTitPelExt, 38, 1, 25, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEspecie1, 19, 6, 4, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEspecie2, 19, 9, 4, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEspecie3, 19, 12, 4, 0, 3BH, 0
        IMPRIME_CAD_COLOR msjEspecie4, 19, 15, 4, 0, 3BH, 0
        
    IMPRIME_CAD_COLOR msjEscape, 29, 3, 25, 0, 3BH, 0
    
    ;POSICIONAR EL CURSOR PARA MOVERNOS ENTRE ESPECIES
cicloFlechas2:
        CURSOR ren3, 5, 0
        
        MOV AH, 0
        INT 16H
            CMP AH, 48H
            JE arriba2
            CMP AH, 50H
            JE abajo2
            CMP AL, 13
            JE enter2
            CMP AH, 01H
            JE reinicio
                    
arriba2:
           CMP ren3, 6
           JE abajo2
           DEC ren3
           DEC ren3
           DEC ren3
           JMP cicloFlechas2

abajo2:     
           CMP ren3, 15
           JE arriba2
           INC ren3
           INC ren3
           INC ren3
           JMP cicloFlechas2

ENTER2: 
    MOV AL, ren3
    CMP AL, 6
    JE Tortuga_caguama
    CMP ren3, 9
    JE Picote_Tequila
    CMP AL, 12
    JE Caballo_Mar
    CMP AL, 15
    JE Mantarraya
    JMP fin

Tortuga_caguama:        
    ;IMPRIMIR LOS DIBUJOS Y LA INFO DE LOS ANIMALES
    ;SCROLL PARA LIMPIAR PARTE DE LA PANTALLA
    SCROLL_ARRIBA 0, 4, 39, 24, 79, 3BH
    ;cadena, long, ren, col, pag, color, modo
    IMPRIME_CAD_COLOR Tortuga1, 17, 7, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Tortuga2, 17, 8, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Tortuga3, 17, 9, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Tortuga4, 17, 10, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Tortuga5, 17, 11, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Tortuga6, 17, 12, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Tortuga7, 17, 13, 45, 0, 0B3H, 0
    
    IMPRIME_CAD_COLOR msjTortuga1, 26, 15, 40, 0, 0B3H, 0
    IMPRIME_CAD_COLOR msjTortuga2, 26, 17, 40, 0, 0B3H, 0
        
    JMP cicloFlechas2

Picote_Tequila:
    ;SCROLL PARA LIMPIAR PARTE DE LA PANTALLA
    SCROLL_ARRIBA 0, 4, 39, 24, 79, 3BH
    
    IMPRIME_CAD_COLOR Pez1, 23, 7, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Pez2, 23, 8, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Pez3, 23, 9, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Pez4, 23, 10, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Pez5, 23, 11, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Pez6, 23, 12, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Pez7, 23, 13, 45, 0, 0B3H, 0 
    
    IMPRIME_CAD_COLOR msjPicote1, 30, 15, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR msjPicote2, 30, 17, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR msjPicote3, 30, 19, 45, 0, 0B3H, 0
    
    JMP cicloFlechas2
    
Caballo_Mar: 
    ;SCROLL PARA LIMPIAR PARTE DE LA PANTALLA
    SCROLL_ARRIBA 0, 4, 39, 24, 79, 3BH
    
    IMPRIME_CAD_COLOR Caballo1, 23, 4, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo2, 23, 5, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo3, 23, 6, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo4, 23, 7, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo5, 23, 8, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo6, 23, 9, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo7, 23, 10, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo8, 23, 11, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo9, 23, 12, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo10, 23, 13, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo11, 23, 14, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo12, 23, 15, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo13, 23, 16, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR Caballo14, 23, 17, 45, 0, 0B3H, 0
    
    IMPRIME_CAD_COLOR msjCaballo1, 26, 19, 40, 0, 0B3H, 0
    IMPRIME_CAD_COLOR msjCaballo2, 26, 21, 40, 0, 0B3H, 0
    
    JMP cicloFlechas2

Mantarraya:
    ;SCROLL PARA LIMPIAR PARTE DE LA PANTALLA
    SCROLL_ARRIBA 0, 4, 39, 24, 79, 3BH

    IMPRIME_CAD_COLOR mant1, 28, 4, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant2, 28, 5, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant3, 28, 6, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant4, 28, 7, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant5, 28, 8, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant6, 28, 9, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant7, 28, 10, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant8, 28, 11, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant9, 28, 12, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant10, 28, 13, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant11, 28, 14, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant12, 28, 15, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant13, 28, 16, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant14, 28, 17, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant15, 28, 18, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR mant16, 28, 19, 45, 0, 0B3H, 0 
    IMPRIME_CAD_COLOR mant17, 28, 20, 45, 0, 0B3H, 0 
    
    IMPRIME_CAD_COLOR msjManta1, 30, 22, 45, 0, 0B3H, 0
    IMPRIME_CAD_COLOR msjManta2, 30, 24, 45, 0, 0B3H, 0
    
    JMP cicloFlechas2
    
fin:
        MOV AX, 4C00H
        INT 21H
END                                               


