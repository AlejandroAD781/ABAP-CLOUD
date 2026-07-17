CLASS zcl_flight_manager_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES zif_flight_manager_aad.
    METHODS constructor IMPORTING
                          i_lt_vuelos TYPE zif_flight_manager_aad=>tt_reserva.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA lt_vuelos TYPE zif_flight_manager_aad=>tt_reserva.
ENDCLASS.

CLASS zcl_flight_manager_aad IMPLEMENTATION.

  METHOD constructor.
    lt_vuelos = i_lt_vuelos.
  ENDMETHOD.


  METHOD zif_flight_manager_aad~add_flight.

    IF vuelo-precio <= 0.
      RAISE EXCEPTION TYPE zcx_flight_error_aad
        EXPORTING
          i_error = 'El precio debe ser mayor que 0'.
    ENDIF.

    READ TABLE Lt_vuelos TRANSPORTING NO FIELDS
    WITH KEY aerolinea = vuelo-aerolinea
             num_vuelo = vuelo-num_vuelo.

    IF sy-subrc = 0.
      RAISE EXCEPTION TYPE zcx_flight_error_aad
        EXPORTING
          i_error = 'vuelo duplicado'.
    ENDIF.
    APPEND vuelo TO lt_vuelos.

  ENDMETHOD.


  METHOD zif_flight_manager_aad~get_all_flights.
  rt_vuelos = lt_vuelos.

  ENDMETHOD.


  METHOD zif_flight_manager_aad~get_cheapest_flight.

    DATA(lv_minimo) = REDUCE decfloat16(
      INIT m = lt_vuelos[ 1 ]-precio
      FOR ls IN lt_vuelos
      NEXT m = COND #( WHEN ls-precio < m THEN ls-precio ELSE m ) ).
    READ TABLE lt_vuelos INTO rv_barato WITH KEY precio = lv_minimo.

  ENDMETHOD.


  METHOD zif_flight_manager_aad~get_flights_by_airline.

    rv_vuelos = FILTER #(
                  lt_vuelos
                  USING KEY airline
                  WHERE aerolinea = aerolinea ).
  ENDMETHOD.


  METHOD zif_flight_manager_aad~get_total_revenue.

    rv_facturacion = REDUCE decfloat16(
    INIT s = 0
    FOR ls IN lt_vuelos
    NEXT s = s + ls-precio ).

  ENDMETHOD.


ENDCLASS.
