CLASS zcl_aad_tablarangos DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_aad_tablarangos IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*SIGN -> dice si la condicino es incluir (I) o excluir (E).
*OPTION -> dice el tipo de comparacion EQ (=) NE (<>) GT(>) LT (<) BT (ENTRE) CP ( COMO LIKE)
*LOW (VALOR MINIMO O EXACTO)
*HIGH (VALOR MAXIMO SOLO SE USA CON "ENTRE")

*LISTA COCHE QUIERO ROJO Y AZUL PERO NO AMARILLO.

    "SING  OPTION  LOW     HIGH
    "I     EQ      ROJO
    "I     EQ      AZUL
    "E     EQ      AMARILLO

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " DECLARACION DE TABLA DE RANGOS
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

*    DATA lr_asientos TYPE RANGE OF /dmo/plane_seats_occupied.
*
*    "QUIERO VUELOS CON ASIENTOS ENTRE 50-100.
*    APPEND VALUE #( sign = 'I' option = 'BT' low = 50 high = 100 ) TO lr_asientos.
*
*    "PERO TAMBIEN QUIERO VUELOS CON ASIENTOS IGUALES A 141.
*    APPEND VALUE #( sign = 'I' option = 'EQ' low = 141 ) TO lr_asientos.
*
*    "NO QUIERO VUELOS CON ASIENTOS MENORES A 10.
*    APPEND VALUE #( sign = 'E' option = 'LT' low = 76 ) TO lr_asientos.
*
*    out->write( lr_asientos ).
*
*    DATA lt_vuelo TYPE TABLE OF /dmo/flight.
*
*    SELECT * FROM /dmo/flight WHERE seats_occupied IN @lr_asientos INTO TABLE @lt_vuelo.
*
*    LOOP AT lt_vuelo INTO DATA(ls_vuelos). "QUE CUMPLA LAS 3 CONDICIONES
*
*      out->write( ls_vuelos ).
**      out->write( ls_vuelos-carrier_id ).
**      out->write( ls_vuelos-seats_occupied ).
*
*    ENDLOOP.
*    out->write( lt_vuelo ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "EJERCICIOS TABLA DE RANGOS
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA lr_carrier TYPE RANGE OF /dmo/carrier_id.
    DATA lr_carrier2 TYPE RANGE OF /dmo/carrier_id.
    DATA lr_date TYPE RANGE OF /dmo/flight_date.
    DATA lr_connection TYPE RANGE OF /dmo/connection_id.
    DATA lr_price TYPE RANGE OF /dmo/flight_price.
    DATA lt_vuelo TYPE TABLE OF /dmo/flight.


    out->write( '---TAREA 1 ---' ).
    APPEND VALUE #( sign = 'I' option = 'EQ' low = 'AA' ) TO lr_carrier.
    APPEND VALUE #( sign = 'I' option = 'EQ' low = 'LH' ) TO lr_carrier.
    APPEND VALUE #( sign = 'I' option = 'EQ' low = 'SQ' ) TO lr_carrier.

    SELECT * FROM /dmo/flight WHERE carrier_id IN @lr_carrier INTO TABLE @lt_vuelo.
    out->write( |VUELOS ENCONTRADOS: { lines( lt_vuelo ) } | ).
    out->write( lt_vuelo ).

    out->write( | | ).
    out->write( '---TAREA 2 ---' ).
    APPEND VALUE #( sign = 'I' option = 'BT' low = '20250101' high = '20260630' ) TO lr_date.
    SELECT * FROM /dmo/flight WHERE flight_date IN @lr_date INTO TABLE @lt_vuelo.
    out->write( |VUELOS ENCONTRADOS: { lines( lt_vuelo ) } | ).
    out->write( lt_vuelo ).

    out->write( | | ).
    out->write( '---TAREA 3 ---' ).
    APPEND VALUE #( sign = 'I' option = 'CP' low = '1*' ) TO lr_connection. "QUE EMPIECE CON 1, NO LO CUMPLE PORQUE SOLO SIRVE PARA CARACTERES.
    SELECT * FROM /dmo/flight WHERE connection_id IN @lr_connection INTO TABLE @lt_vuelo.
    out->write( |VUELOS ENCONTRADOS: { lines( lt_vuelo ) } | ).
    out->write( lt_vuelo ).

    out->write( | | ).
    out->write( '---TAREA 4 ---' ).
    APPEND VALUE #( sign = 'E' option = 'EQ' low = 'UA' ) TO lr_carrier2.
    SELECT * FROM /dmo/flight WHERE carrier_id IN @lr_carrier2 INTO TABLE @lt_vuelo.
    out->write( |VUELOS ENCONTRADOS: { lines( lt_vuelo ) } | ).
    out->write( lt_vuelo ).

    out->write( | | ).
    out->write( '---TAREA 5 ---' ).
    APPEND VALUE #( sign = 'I' option = 'GT' low = 100 ) TO lr_price.
    APPEND VALUE #( sign = 'I' option = 'LE' low = 50 ) TO lr_price.
    SELECT * FROM /dmo/flight WHERE price IN @lr_price INTO TABLE @lt_vuelo.
    out->write( |VUELOS ENCONTRADOS: { lines( lt_vuelo ) } | ).
    out->write( lt_vuelo ).

    out->write( | | ).
    out->write( '---TAREA 6 ---' ).

    SELECT * FROM /dmo/flight
    WHERE carrier_id IN @lr_carrier AND flight_date IN @lr_date AND carrier_id IN @lr_carrier2
    INTO TABLE  @lt_vuelo.
    out->write( |VUELOS ENCONTRADOS: { lines( lt_vuelo ) } | ).
    out->write( lt_vuelo ).

  ENDMETHOD.
ENDCLASS.
