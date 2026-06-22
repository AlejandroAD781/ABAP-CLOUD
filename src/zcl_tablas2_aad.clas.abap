CLASS zcl_tablas2_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_tablas2_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

*"seleciona todos los los aeropuertos de DE de una BASE DE DATOS y generalos en una tabla interna lt_airports.
*    SELECT * FROM /dmo/airport "== select from ... fields *.
*
*    WHERE country = 'DE' "EQ = "="
*    into table @data(lt_flights). ""esta tabla ya hereda todos los tipos de la /dmo/airport. aqui se usa @ en el data.
*    if sy-subrc = 0.
*    out->write( lt_flights ).
*
*    READ TABLE lt_flights into data(ls_flight) index 1. "read table. se usa para leer una linea de una TABLA INTERNA en tiempo de ejecución y asociarla a una estructura. no usa @ en data.
*    out->write( ls_flight ).
*
*    READ TABLE lt_flights into data(ls_flight2) index 2 TRANSPORTING airport_id city. "leer solo los datos de columnas indicadas "airport_id" y "city".
*    out->write( ls_flight2 ).
*
*    READ TABLE lt_flights into data(ls_flight3) with key city = 'Berlin'. "primer resultado: leer tabla donde city tenga balores de berlin.
**    data(ls_flight3) = lt_flights[ city = 'Berlin' ]. "igual leer tabla donde city tenga balores de berlin.
*
*        out->write( ls_flight3 ).
*
*    data(lv_flight4) = lt_flights[ city = 'Berlin' ]-airport_id. "primer resultado: solo coge la celda indicada. es una variable.
*
*    out->write( lv_flight4 ).
*
*    endif.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" VER COMPORTAMIENTO SY-SUBRC = 0. PONERLO AL TRABAJAR CON TABLAS DE BBDD ES BUENA PRACTICA.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*SELECT * FROM /dmo/flight WHERE carrier_id = 'LH' INTO TABLE @DATA(lt_flight_standard).
*
*READ TABLE lt_flight_standard WITH KEY connection_id = '0403' TRANSPORTING NO FIELDS.
*IF sy-subrc = 0.
*  out->write( 'el vuelo existe en la BBDD' ).
*ELSE.
*  out->write( 'el vuelo no existe en la BBDD' ).
*ENDIF.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" OBTENER INDICE DE UN CAMPO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*DATA(lv_index) = line_index( lt_flight_standard[ connection_id = '0403' ] ).
*out->write( lv_index ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RECORRER LA TABLA Y GUARDARLA EN ESTRUCTURA CON ESE REGISTRO.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
SELECT FROM /dmo/flight FIELDS * INTO TABLE @data(lt_flight_standard).
LOOP AT lt_flight_standard INTO DATA(ls_vuelo) WHERE connection_id = '0015'.
out->write( ls_vuelo ).
ENDLOOP.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" USO DE ALIAS 'AS'. cambiar nombre de columna y coger algunas columnas.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*SELECT * FROM /dmo/flight WHERE carrier_id = 'LH' into table @data(lt_vuelos).
*
*SELECT carrier_id, connection_id as conexion , flight_date FROM @lt_vuelos as lt INTO TABLE @data(lt_copia).
*
*out->write( lt_vuelos ).
*out->write( lt_copia ).

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TRATAMIENTO DE SORTED TABLES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lt_flight_sort type SORTED TABLE OF /dmo/airport WITH NON-UNIQUE KEY airport_id.
*
*    SELECT from /dmo/airport
*    FIELDS *
*    INTO TABLE @lt_flight_sort.
*
*    out->write( lt_flight_sort ).
*
*    READ TABLE lt_flight_sort INTO DATA(ls_flight) with table key airport_id = 'LAS'. "CAMBIA EN WITH TABLE KEY
*    out->write( ls_flight ).
*
*    data(ls_flight2) = lt_flight_sort[ key primary_key airport_id = 'LAS' ].

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIOS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*out->write( '--EXTRAER REGISTROS CON CAMPO UK--' ).
*SELECT * FROM /dmo/airport WHERE country = 'UK' INTO TABLE @DATA(lt_ukairports).
*out->write( lt_ukairports ).
*
*out->write( | | ).
*out->write( '--EXTRAER EL NOMBRE ASOCIADO AL ID LGW--' ).
*READ TABLE lt_ukairports INTO DATA(ls_ukairport) WITH KEY airport_id = 'LGW'.
*out->write( ls_ukairport-name ).
*"""""OPCION 2
**data(ls_ukairportname) = lt_ukairports[ airport_id = 'LGW' ]-name.
**out->write( ls_ukairportname ).
*
*
*out->write( | | ).
*out->write( '--EXTRAER CON SORTED LOS REGISTROS COUNTRY = IT--' ).
*DATA lt_flight_it TYPE SORTED TABLE OF /dmo/airport WITH NON-UNIQUE KEY city.
*SELECT * FROM /dmo/airport WHERE country = 'IT' INTO TABLE @lt_flight_it.
*out->write( lt_flight_it ).

  ENDMETHOD.

ENDCLASS.
