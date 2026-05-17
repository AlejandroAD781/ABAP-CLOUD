CLASS zcl_tablas_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
       INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_TABLAS_AAD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


*    TYPES: BEGIN OF ty_cliente,
*          nombre TYPE ZDE_NOMBRE_AAD,
*          id TYPE ZDE_ID_AAD,
*          edad TYPE ZDE_EDAD_AAD,
*          TELEFONO TYPE ZDE_TELEFONO_AAD,
*          CORREO TYPE ZDE_CORREO_AAD,
*          end of ty_cliente.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""TIPOS DE TABLAS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA ls_cliente TYPE ty_cliente.
*    DATA lt_cliente TYPE TABLE OF ty_cliente. "" == DATA lt_cliente TYPE STANDARD TABLE OF ty_cliente.
**    DATA lt_cliente_sorted TYPE SORTED TABLE OF ty_cliente with UNIQUE key correo. ""permite hacer non-unique.
**    DATA lt_cliente_hashed TYPE HASHED TABLE OF ty_cliente WITH UNIQUE KEY correo. "no permite hacer non-unique. la más rapida va directa a las keys unicas.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""CREAR UNA TABLA A PARTIR DE ESTRUCTURAS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    ls_cliente-nombre = 'Juan'.
*    ls_cliente-edad = 40.
*    ls_cliente-id = '12345'.
*    ls_cliente-telefono = '666666666'.
*    ls_cliente-correo = '1@a.com'.
*
**ls_cliente = VALUE #( nombre = 'Juann' edad = 50 id = '12345' telefono = '66666666' correo = 'a@a.com'). OTRA FORMA DE METER DATOS.
*
*    INSERT ls_cliente into table lt_cliente. """into table" NO SE PONE index. COLOCA LA ESTRUCTURA AL FINAL. TAMBIEN VALNDRÍA CON APPEND.
*    ls_cliente-nombre = 'Alex'.
*    ls_cliente-edad = 50.
*    ls_cliente-id = '12345'.
*    ls_cliente-telefono = '666666666'.
*    ls_cliente-correo = '1@a.com'.
*
*    INSERT ls_cliente into lt_cliente index 1. "into si requiere index.
*
*    ls_cliente-nombre = 'Blue'.
*    ls_cliente-edad = 60.
*    ls_cliente-id = '54321'.
*    ls_cliente-telefono = '777777777'.
*    ls_cliente-correo = '1@a.com'.
*
*    INSERT ls_cliente into lt_cliente index 2.
*
*    ls_cliente-nombre = 'REDDD'.
*    ls_cliente-edad = 60.
*    ls_cliente-id = '54321'.
*    ls_cliente-telefono = '777777777'.
*    ls_cliente-correo = '1@a.com'.
*
*
*    INSERT ls_cliente into table lt_cliente.
*
*    INSERT VALUE #(
*    nombre = 'Laura'
*    edad = 7
*    id = 8
*    telefono = '66666777'
*    correo = 'asfas' )
*    into table lt_cliente.

*    out->write( lt_cliente ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""DUPLICAR EL CONTENIDO DE UNA TABLA EN OTRA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    data lt_cliente2 like lt_cliente. ""DUPLICAR EL TIPO.
*    INSERT LINES OF LT_CLIENTE INTO TABLE LT_CLIENTE2.
*
*    INSERT LINES OF lt_cliente to 1 into table lt_cliente2. ""copiar la linea indicada.
*    INSERT LINES OF lt_cliente from 2 to 3 INTO table LT_CLIENTE2. ""copiar el rango de lineas indicado.
*    out->write( lt_cliente2 ).

*LOOP at lt_cliente into ls_cliente.
*out->write( |NOMBRE: { ls_cliente-nombre } , EDAD: { ls_cliente-edad }| ).
*
*ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"CREAR REGISTRO EN BLANCO EN UNA TABLA
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*INSERT VALUE #( ) INTO TABLE lt_tabla. "OPCION 1
*
*APPEND INITIAL LINE TO lt_tabla. "OPCION 2
*
*CLEAR ls_estructura.
*INSERT ls_estructura INTO TABLE lt_tabla. "OPCION 3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" CREAR TABLA RAPIDAMENTE PONIENDO DATOS QUE QUERAMOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*DATA LT_EMPLEADO3 TYPE TABLE OF TY_cliente.
*lt_empleado3 = VALUE #(
*( id = 1 nombre = 'Juan' correo = 'Perez' )
*( id = 1 nombre = 'Juan' correo = 'Perez' )
*( id = 1 nombre = 'Juan' correo = 'Perez' )
*( id = 1 nombre = 'Juan' correo = 'Perez' )
*( id = 1 nombre = 'Juan' correo = 'Perez' )
*( id = 1 nombre = 'Juan' correo = 'Perez' ) ).
*
*out->write( lt_empleado3 ).

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIO DE FILTRAR AEROPUESTOS QUE EMPIECEN POR M"""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


*DATA lt_aeropuerto TYPE TABLE OF /dmo/airport.
*
*DATA ls_aeropuerto TYPE /dmo/airport.
*
*ls_aeropuerto = VALUE #(
*airport_id = 'FRA'
*name = 'baguete'
*city = 'Paris'
*country = 'FR'
*).
*
*INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
*
*ls_aeropuerto = VALUE #(
*airport_id = 'ESP'
*name = 'barajas'
*city = 'Palma de Mallorca'
*country = 'ES'
*).
*
*INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
*
*ls_aeropuerto = VALUE #(
*airport_id = 'EEU'
*name = 'JFK'
*city = 'Minesota'
*country = 'EU'
*).
*
*INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
*
*ls_aeropuerto = VALUE #(
*airport_id = 'EWR'
*name = 'NEWARK'
*city = 'Bronx'
*country = 'US'
*).
*
*INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
*
*ls_aeropuerto = VALUE #(
*airport_id = 'BAR'
*name = 'MADRID'
*city = 'MADRID'
*country = 'ES'
*).
*
*INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.
*
*out->write( 'tabla' ).
*out->write( lt_aeropuerto ).
*
**DATA lv_aeropuerto_find TYPE i.
*
*out->write( 'filtracion' ).
*
*** FILTRACIÓN CIUDADDES QUE EMPIECEN POR LA LETRA M.
*
*DATA lt_aeropuerto2 TYPE TABLE OF /dmo/airport.
*DATA lv_contador TYPE i VALUE 0.
*
*
*LOOP AT lt_aeropuerto INTO ls_aeropuerto.
*
*lv_contador += 1.
*
*DATA(lv_aeropuerto_find) = find( val = ls_aeropuerto-city sub = 'M' ).
*
*  IF lv_aeropuerto_find = 0.
*
*    ls_aeropuerto-city = ls_aeropuerto-city.
*
*    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto2.
*
*  ENDIF.
*
*ENDLOOP.
*
*out->write( lt_aeropuerto2 ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*AÑADIR ID A NUEVA COLUMNA ID
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*TYPES: BEGIN OF ty_aeropuerto,
*        airport_id TYPE /dmo/airport_id,
*        name TYPE /dmo/airport_name,
*        city TYPE /dmo/city,
*        country TYPE land1,
*        idcity TYPE i,
*        idairport TYPE i,
*        END of TY_aeropuerto.
*
*DATA lt_aeropuerto3 TYPE TABLE OF ty_aeropuerto.
*DATA ls_aeropuerto2 TYPE ty_aeropuerto.
*
*ls_aeropuerto2 = VALUE #(
*airport_id = 'FRA'
*name = 'baguete'
*city = 'Paris'
*country = 'FR'
*idcity = 0
*iDairport = 0
*).
*
*INSERT ls_aeropuerto2 INTO TABLE lt_aeropuerto3.
*
*ls_aeropuerto2 = VALUE #(
*airport_id = 'ESP'
*name = 'barajas'
*city = 'Palma de Mallorca'
*country = 'ES'
*idcity = 0
*idairport = 0
*).
*
*INSERT ls_aeropuerto2 INTO TABLE lt_aeropuerto3.
*
*ls_aeropuerto2 = VALUE #(
*airport_id = 'EEU'
*name = 'JFK'
*city = 'Minesota'
*country = 'EU'
*idcity = 0
*idairport = 0
*).
*
*INSERT ls_aeropuerto2 INTO TABLE lt_aeropuerto3.
*
*ls_aeropuerto2 = VALUE #(
*airport_id = 'EWR'
*name = 'NEWARK'
*city = 'Bronx'
*country = 'US'
*idcity = 0
*idairport = 0
*).
*
*INSERT ls_aeropuerto2 INTO TABLE lt_aeropuerto3.
*
*ls_aeropuerto2 = VALUE #(
*airport_id = 'BAR'
*name = 'MADRID'
*city = 'MADRID'
*country = 'ES'
*idcity = 0
*idairport = 0
*).
*
*INSERT ls_aeropuerto2 INTO TABLE lt_aeropuerto3.
*
*out->write( 'tabla' ).
*out->write( lt_aeropuerto3 ).
*out->write( '--------------------' ).
*out->write( 'filtracion por M + ID ALEATORIA EN DOS COLUMNAS' ).
*
*** FILTRACIÓN CIUDADDES QUE EMPIECEN POR LA LETRA M.
*
*DATA lt_aeropuerto4 TYPE TABLE OF ty_aeropuerto.
*DATA lv_contador2 TYPE i VALUE 0.
*DATA lv_contador3 TYPE i VALUE 100.
*
*LOOP AT lt_aeropuerto3 INTO ls_aeropuerto2.
*
*lv_contador2 += 1.
*lv_contador3 += 1.
*
*DATA(lv_aeropuerto_find2) = find( val = ls_aeropuerto2-city sub = 'M' ).
*
*  IF lv_aeropuerto_find2 = 0.
*
*   ls_aeropuerto2-idcity = lv_contador2.
*   ls_aeropuerto2-idairport = lv_contador3.
*
*   INSERT ls_aeropuerto2 INTO TABLE lt_aeropuerto4.
*
*  ENDIF.
*
*ENDLOOP.
*
*out->write( lt_aeropuerto4 ).


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""La forma más clean de hacer el filtrado con ID nuevas
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
TYPES: BEGIN OF ty_aeropuerto,
         airport_id TYPE /dmo/airport_id,
         name       TYPE /dmo/airport_name,
         city       TYPE /dmo/city,
         country    TYPE land1,
         idcity     TYPE i,
         idairport  TYPE i,
       END OF TY_aeropuerto.

DATA lt_aeropuerto3 TYPE TABLE OF /dmo/airport.
DATA ls_aeropuerto2 TYPE /dmo/airport.

lt_aeropuerto3 = VALUE #(
  ( airport_id = 'FRA' name = 'baguete' city = 'Paris'             country = 'FR' )
  ( airport_id = 'ESP' name = 'barajas' city = 'Palma de Mallorca' country = 'ES' )
  ( airport_id = 'EEU' name = 'JFK'     city = 'Minesota'          country = 'EU' )
  ( airport_id = 'EWR' name = 'NEWARK'  city = 'Bronx'             country = 'US' )
  ( airport_id = 'BAR' name = 'MADRID'  city = 'MADRID'            country = 'ES' )
).


out->write( 'tabla a filtrar' ).
out->write( lt_aeropuerto3 ).
out->write( | | ).
out->write( 'filtracion por M + ID ALEATORIA EN DOS COLUMNAS' ).

** FILTRACIÓN CIUDADDES QUE EMPIECEN POR LA LETRA M.

DATA lt_aeropuerto4 TYPE TABLE OF ty_aeropuerto.
DATA lv_contador2 TYPE i VALUE 0.
DATA lv_contador3 TYPE i VALUE 100.

LOOP AT lt_aeropuerto3 INTO ls_aeropuerto2.

  lv_contador2 += 1.
  lv_contador3 += 1.

  DATA(lv_aeropuerto_find2) = find( val = ls_aeropuerto2-city sub = 'M' ).

  IF lv_aeropuerto_find2 = 0.

    INSERT VALUE #( city = ls_aeropuerto2-city country = ls_aeropuerto2-country airport_id = ls_aeropuerto2-airport_id name = ls_aeropuerto2-name idcity = lv_contador2 idairport = lv_contador3 ) INTO TABLE lt_aeropuerto4.

  ENDIF.

ENDLOOP.

out->write( lt_aeropuerto4 ).

ENDMETHOD.
ENDCLASS.
