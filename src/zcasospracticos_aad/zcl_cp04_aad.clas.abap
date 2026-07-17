CLASS zcl_cp04_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp04_aad IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA lt_reserva TYPE STANDARD TABLE OF zst_booking_aad.

    lt_reserva = VALUE #(
      ( id_reserva = 1 aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Ana García'    fecha = '20260515' precio = '899.00'  estado = 'A' )
      ( id_reserva = 2 aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Carlos López'  fecha = '20260515' precio = '120.00'  estado = 'A' )
      ( id_reserva = 3 aerolinea = 'AA' num_vuelo = '0017' pasajero = 'John Smith'    fecha = '20260520' precio = '450.50'  estado = 'A' )
      ( id_reserva = 4 aerolinea = 'LH' num_vuelo = '0455' pasajero = 'María Pérez'   fecha = '20260520' precio = '310.75'  estado = 'A' )
      ( id_reserva = 5 aerolinea = 'IB' num_vuelo = '3740' pasajero = 'Pedro Ruiz'    fecha = '20260515' precio = '120.00'  estado = 'C' )
      ( id_reserva = 6 aerolinea = 'SQ' num_vuelo = '0026' pasajero = 'Lisa Tan'      fecha = '20260601' precio = '1250.00' estado = 'A' )
      ( id_reserva = 7 aerolinea = 'LH' num_vuelo = '0400' pasajero = 'Hans Müller'   fecha = '20260515' precio = '899.00'  estado = 'A' )
      ( id_reserva = 8 aerolinea = 'AA' num_vuelo = '0064' pasajero = 'Sarah Jones'   fecha = '20260525' precio = '510.00'  estado = 'A' )
    ).

    INSERT VALUE #( id_reserva = 9 aerolinea = 'IB' num_vuelo = '3950' pasajero = 'Elena Martin'    fecha = '20260601' precio = '275.30'  estado = 'A' ) INTO TABLE lt_reserva.
    INSERT VALUE #( id_reserva = 10 aerolinea = 'LH' num_vuelo = '2030' pasajero = 'Franz Weber'    fecha = '20260610' precio = '95.00'  estado = 'A' ) INTO TABLE lt_reserva.

    out->write( lt_reserva ).

    out->write( '----' ).
    out->write( 'T2.2' ).
    out->write( '----' ).

    LOOP AT lt_reserva INTO DATA(ls_reserva).
      IF ls_reserva-id_reserva = 3.
        ls_reserva-precio = '480'.
        MODIFY lt_reserva FROM ls_reserva.
      ENDIF.

      IF ls_reserva-aerolinea = 'LH'.
        ls_reserva-precio = ls_reserva-precio * '0.9'.
        MODIFY lt_reserva FROM ls_reserva.
      ENDIF.
    ENDLOOP.

    out->write( lt_reserva ).


    out->write( '----' ).
    out->write( 'T2.3' ).
    out->write( '----' ).


    LOOP AT lt_reserva INTO DATA(ls_reserva2).
      IF ls_reserva2-id_reserva = 4.
        ls_reserva2-estado = 'C'.
        MODIFY lt_reserva FROM ls_reserva2.
      ENDIF.

      IF ls_reserva2-estado = 'C'.
        DELETE lt_reserva WHERE estado = 'C'.
      ENDIF.
    ENDLOOP.

    out->write( lt_reserva ).
    DATA(nregistros) = lines( lt_reserva ).
    out->write( | Numero registros: { nregistros } | ).

    out->write( '----' ).
    out->write( 'T2.4' ).
    out->write( '----' ).

    READ TABLE lt_reserva TRANSPORTING NO FIELDS WITH KEY pasajero = 'Lisa Tan'.

    IF sy-subrc <> 0.
      out->write( 'No existe' ).
    ELSE.
      out->write( 'Existe' ).
    ENDIF.

    READ TABLE lt_reserva REFERENCE INTO DATA(ls_reserva4)
      WITH KEY id_reserva = 6.
    out->write( ls_reserva4 ).

    DATA(lv_pasajero) = lt_reserva[ id_reserva = 1 ]-pasajero.
    out->write( lv_pasajero ).

    out->write( '----' ).
    out->write( 'T2.5' ).
    out->write( '----' ).

    DATA lt_agrupada TYPE ztt_booking_aad.

    TYPES: BEGIN OF ty_resumen,
             aerolinea    TYPE zde_airline_aad,
             num_reservas TYPE i,
             precio_total TYPE zde_flight_price_aad,
             precio_medio TYPE zde_flight_price_aad,
           END OF ty_resumen.

    DATA lt_resumen  TYPE STANDARD TABLE OF ty_resumen.

    SORT lt_reserva BY aerolinea.

    LOOP AT lt_reserva INTO DATA(ls_reserva5)
         GROUP BY ( aero = ls_reserva5-aerolinea )
         ASCENDING
         INTO DATA(ls_grupo).

      DATA(ls_resumen) = VALUE ty_resumen( aerolinea = ls_grupo-aero ).

      LOOP AT GROUP ls_grupo INTO DATA(ls_miembro).

        APPEND ls_miembro TO lt_agrupada.

        ls_resumen-num_reservas = ls_resumen-num_reservas + 1.
        ls_resumen-precio_total = ls_resumen-precio_total + ls_miembro-precio.

      ENDLOOP.

      ls_resumen-precio_medio = ls_resumen-precio_total / ls_resumen-num_reservas.

      APPEND ls_resumen TO lt_resumen.

    ENDLOOP.

    out->write( lt_resumen ).



  ENDMETHOD.
ENDCLASS.
