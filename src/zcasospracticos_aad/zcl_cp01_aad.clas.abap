CLASS zcl_cp01_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp01_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 1.1.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    TYPES: BEGIN OF ty_vuelo,
             aerolinea     TYPE c LENGTH 2,
             nvuelo        TYPE c LENGTH 4,
             origen        TYPE c LENGTH 3,
             destino       TYPE c LENGTH 3,
             precio        TYPE decfloat16,
             plazas_libres TYPE i,
           END OF ty_vuelo.

    DATA lt_vuelos TYPE STANDARD TABLE OF ty_vuelo.

    lt_vuelos = VALUE #(
     ( aerolinea = 'LH' nvuelo = '0400' origen = 'FRA' destino = 'JFK' precio = '899.00' plazas_libres = 15 )
     ( aerolinea = 'AA' nvuelo = '0017' origen = 'JFK' destino = 'SFO' precio = '450.50' plazas_libres = 0 )
     ( aerolinea = 'IB' nvuelo = '3740' origen = 'MAD' destino = 'BCN' precio = '120.00' plazas_libres = 42 )
     ( aerolinea = 'LH' nvuelo = '0455' origen = 'FRA' destino = 'MAD' precio = '310.75' plazas_libres = 8 )
     ( aerolinea = 'AA' nvuelo = '0064' origen = 'SFO' destino = 'JFK' precio = '510.00' plazas_libres = 3 )
     ( aerolinea = 'IB' nvuelo = '3950' origen = 'BCN' destino = 'LHR' precio = '275.30' plazas_libres = 0 )
     ( aerolinea = 'LH' nvuelo = '2030' origen = 'MUC' destino = 'FRA' precio = '95.00' plazas_libres = 60 )
     ( aerolinea = 'SQ' nvuelo = '0026' origen = 'SIN' destino = 'FRA' precio = '1250.00' plazas_libres = 5 )
   ).

    LOOP AT lt_vuelos INTO DATA(ls_vuelo).

      DATA(lv_categoria) = COND string(
        WHEN ls_vuelo-precio < 150 THEN 'Económico'
        WHEN ls_vuelo-precio >= 150 AND ls_vuelo-precio < 500 THEN 'Estándar'
        WHEN ls_vuelo-precio >= 500 AND ls_vuelo-precio <= 1000 THEN 'Premium'
        WHEN ls_vuelo-precio > 1000 THEN 'First Class'
        ELSE 'Sin categoría'
      ).

      out->write( |{ ls_vuelo-aerolinea } { ls_vuelo-nvuelo } { ls_vuelo-origen } { ls_vuelo-destino } { ls_vuelo-precio }€ Categoría: { lv_categoria }| ).

    ENDLOOP.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 1.2.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( '----' ).
    out->write( 'T1.2' ).
    out->write( '----' ).

    LOOP AT lt_vuelos INTO DATA(ls_vuelo2).

      IF ls_vuelo2-plazas_libres > 0 AND ( ls_vuelo2-origen = 'FRA' OR ls_vuelo2-destino = 'FRA' ) AND ls_vuelo2-precio < 1000.
        out->write( |{ ls_vuelo2-aerolinea } { ls_vuelo2-nvuelo } { ls_vuelo2-origen } { ls_vuelo2-destino } { ls_vuelo2-precio }€ { ls_vuelo2-plazas_libres } plazas libres| ).
      ENDIF.

    ENDLOOP.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 1.3.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( '----' ).
    out->write( 'T1.3' ).
    out->write( '----' ).

    LOOP AT lt_vuelos INTO DATA(ls_vuelo3).

      IF ls_vuelo3-plazas_libres > 0 AND ( ls_vuelo3-origen = 'FRA' OR ls_vuelo3-destino = 'FRA' ) AND ls_vuelo3-precio < 1000.
        DATA(lv_concat) = ls_vuelo3-aerolinea && '-' && ls_vuelo3-nvuelo.
        DATA(lv_minusculas) = to_lower( ls_vuelo3-destino ).
        DATA(lv_longitud) = strlen( lv_concat ).
        DATA(lv_pipe) = '|'.

        out->write( |{ ls_vuelo3-aerolinea }-{ ls_vuelo3-nvuelo } { lv_pipe } { lv_minusculas } { lv_pipe } { lv_longitud }| ).

      ENDIF.

    ENDLOOP.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " TAREA 1.4.
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( '----' ).
    out->write( 'T1.4' ).
    out->write( '----' ).

    DATA(lv_max) = REDUCE decfloat16(
      INIT m = lt_vuelos[ 1 ]-precio
      FOR ls IN lt_vuelos
      NEXT m = COND #( WHEN ls-precio > m THEN ls-precio ELSE m ) ).

    DATA(lv_min) = REDUCE decfloat16(
      INIT m = lt_vuelos[ 1 ]-precio
      FOR ls IN lt_vuelos
      NEXT m = COND #( WHEN ls-precio < m THEN ls-precio ELSE m ) ).


    DATA(lv_total) = REDUCE decfloat16(
    INIT s = 0
    FOR ls IN lt_vuelos
    NEXT s = s + ls-precio ).

    DATA(lv_count) = lines( lt_vuelos ).

    DATA(lv_media) = lv_total / lv_count.


    out->write( |Total: { lv_total } €| ).
    out->write( |Máximo: { lv_max } €| ).
    out->write( |Mínimo: { lv_min } €| ).
    out->write( |Media: { lv_media } €| ).

  ENDMETHOD.
ENDCLASS.
