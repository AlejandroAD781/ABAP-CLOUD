CLASS zcl_tablas_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
       INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_tablas_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    TYPES: BEGIN OF ty_cliente,
*          nombre TYPE ZDE_NOMBRE_AAD,
*          id TYPE ZDE_ID_AAD,
*          edad TYPE ZDE_EDAD_AAD,
*          TELEFONO TYPE ZDE_TELEFONO_AAD,
*          CORREO TYPE ZDE_CORREO_AAD,
*          end of ty_cliente.
*
*    DATA ls_cliente TYPE ty_cliente.
*    DATA lt_cliente TYPE TABLE OF ty_cliente. "" == DATA lt_cliente TYPE STANDARD TABLE OF ty_cliente.
**    DATA lt_cliente_sorted TYPE SORTED TABLE OF ty_cliente with UNIQUE key correo. ""permite hacer non-unique.
**    DATA lt_cliente_hashed TYPE HASHED TABLE OF ty_cliente WITH UNIQUE KEY correo. "no permite hacer non-unique. la más rapida va directa a las keys unicas.
*
*    ls_cliente-nombre = 'Juan'.
*    ls_cliente-edad = 40.
*    ls_cliente-id = '12345'.
*    ls_cliente-telefono = '666666666'.
*    ls_cliente-correo = '1@a.com'.
*
**ls_cliente = VALUE #( nombre = 'Juann' edad = 50 id = '12345' telefono = '66666666' correo = 'a@a.com'). OTRA FORMA DE METER DATOS.
*
*    INSERT ls_cliente into table lt_cliente. """into table" NO SE PONE index. COLOCA LA ESTRUCTURA AL FINAL.
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

*    data lt_cliente2 like lt_cliente.
*    INSERT LINES OF LT_CLIENTE INTO TABLE LT_CLIENTE2.
*
*    INSERT LINES OF lt_cliente to 1 into table lt_cliente2.
*    INSERT LINES OF lt_cliente from 2 to 3 INTO table LT_CLIENTE2.
*    out->write( lt_cliente2 ).

*LOOP at lt_cliente into ls_cliente.
*out->write( |NOMBRE: { ls_cliente-nombre } , edad: { ls_cliente-edad }| ).
*
*ENDLOOP.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIO DE FILTRAR AEROPUESTOS QUE EMPIECEN POR M"""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
DATA lt_aeropuerto TYPE TABLE OF /dmo/airport.

DATA ls_aeropuerto TYPE /dmo/airport.

ls_aeropuerto = VALUE #(
airport_id = 'FRA'
name = 'baguete'
city = 'Paris'
country = 'FR'
).

INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

ls_aeropuerto = VALUE #(
airport_id = 'ESP'
name = 'barajas'
city = 'Palma de Mallorca'
country = 'ES'
).

INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

ls_aeropuerto = VALUE #(
airport_id = 'EEU'
name = 'JFK'
city = 'Minesota'
country = 'EU'
).

INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

ls_aeropuerto = VALUE #(
airport_id = 'EWR'
name = 'NEWARK'
city = 'Bronx'
country = 'US'
).

INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

ls_aeropuerto = VALUE #(
airport_id = 'BAR'
name = 'MADRID'
city = 'MADRID'
country = 'ES'
).

INSERT ls_aeropuerto INTO TABLE lt_aeropuerto.

out->write( 'tabla' ).
out->write( lt_aeropuerto ).

*DATA lv_aeropuerto_find TYPE i.

out->write( 'filtracion + ID POSICION LOOP' ).

** FILTRACIÓN CIUDADDES QUE EMPIECEN POR LA LETRA M.

DATA lt_aeropuerto2 TYPE TABLE OF /dmo/airport.
DATA lv_contador TYPE i VALUE 01.

LOOP AT lt_aeropuerto INTO ls_aeropuerto.

lv_contador += 1.

DATA(lv_aeropuerto_find) = find( val = ls_aeropuerto-city sub = 'M' ).

  IF lv_aeropuerto_find = 0.

    ls_aeropuerto-city = ls_aeropuerto-city && lv_contador.

    INSERT ls_aeropuerto INTO TABLE lt_aeropuerto2.

  ENDIF.

ENDLOOP.

out->write( lt_aeropuerto2 ).




"CREAR NUEVA TABLA CON LOS RESULTADOS. TABLA NUEVA CON AL MENOS 2 CAMPOS QUE COINCIDAN QUE AÑADIRLE UN ID AUTOMATICO. PRIMERA FILA ID. NOMBRE EDAD -ID AUTOMÁTICAMENTE.


ENDMETHOD.

ENDCLASS.
