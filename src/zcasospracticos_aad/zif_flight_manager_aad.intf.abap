INTERFACE zif_flight_manager_aad
  PUBLIC .

  TYPES: BEGIN OF ty_reserva,
           id_reserva TYPE i,
           aerolinea  TYPE c LENGTH 2,
           num_vuelo  TYPE c LENGTH 4,
           precio     TYPE decfloat16,
         END OF ty_reserva.

  TYPES tt_reserva TYPE SORTED TABLE OF ty_reserva WITH UNIQUE KEY id_reserva
  WITH NON-UNIQUE SORTED KEY airline COMPONENTS aerolinea.


  METHODS add_flight
    IMPORTING vuelo TYPE ty_reserva RAISING zcx_flight_error_aad.

  METHODS get_all_flights
  RETURNING VALUE(rt_vuelos) TYPE tt_reserva.

  METHODS get_flights_by_airline
    IMPORTING aerolinea        TYPE ty_reserva-aerolinea
    RETURNING VALUE(rv_vuelos) TYPE tt_reserva.

  METHODS get_cheapest_flight
    RETURNING VALUE(rv_barato) TYPE ty_reserva.

  METHODS get_total_revenue
    RETURNING VALUE(rv_facturacion) TYPE ty_reserva-precio.

ENDINTERFACE.
