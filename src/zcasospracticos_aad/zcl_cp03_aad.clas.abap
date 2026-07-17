CLASS zcl_cp03_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES: BEGIN OF ty_reserva,
             id_reserva TYPE i,
             aerolinea  TYPE c LENGTH 2,
             num_vuelo  TYPE n LENGTH 4,
             pasajero   TYPE string,
             fecha      TYPE d,
             precio     TYPE p LENGTH 6 DECIMALS 2,
             estado     TYPE c LENGTH 1,
           END OF ty_reserva.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_cp03_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_vuelos TYPE zif_flight_manager_aad=>tt_reserva.

    CLEAR lt_vuelos.

    out->write( '--TABLA INICIAL--' ).
    lt_vuelos = VALUE #(
      ( id_reserva = 1 aerolinea = 'LH' num_vuelo = '0400' precio = '899.00' )
      ( id_reserva = 2 aerolinea = 'IB' num_vuelo = '3740' precio = '120.00' )
      ( id_reserva = 3 aerolinea = 'AA' num_vuelo = '0017' precio = '450.50' )
      ( id_reserva = 4 aerolinea = 'LH' num_vuelo = '0455' precio = '310.75' )
      ( id_reserva = 5 aerolinea = 'SQ' num_vuelo = '0026' precio = '1250.00' ) ).

    out->write( lt_vuelos ).

    DATA(lo_manager) = NEW zcl_flight_manager_aad( i_lt_vuelos = lt_vuelos ).

    out->write( '--añadir 5 vuelos--' ).
    TRY.
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 6 aerolinea = 'LH' num_vuelo = '0405' precio = '560.00') ).
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 7 aerolinea = 'SQ' num_vuelo = '3798' precio = '224.00' ) ).
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 8 aerolinea = 'SQ' num_vuelo = '1700' precio = '458.50' ) ).
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 9 aerolinea = 'AA' num_vuelo = '4655' precio = '340.75' ) ).
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 10 aerolinea = 'SQ' num_vuelo = '7896' precio = '980.00' ) ).
      CATCH zcx_flight_error_aad INTO DATA(lx0_error).
        out->write( lx0_error->error ).
    ENDTRY.

    out->write( lo_manager->zif_flight_manager_aad~get_all_flights( ) ).

    out->write( '--fallo precio duplicado--' ).
    TRY.
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 11 aerolinea = 'SQ' num_vuelo = '7896' precio = '-980.00' ) ).
      CATCH zcx_flight_error_aad INTO DATA(lx1_error).
        out->write( lx1_error->error ).
    ENDTRY.

    out->write( '--fallo vuelo duplicado--' ).
    TRY.
        lo_manager->zif_flight_manager_aad~add_flight( VALUE #( id_reserva = 10 aerolinea = 'SQ' num_vuelo = '7896' precio = '980.00' ) ).
      CATCH zcx_flight_error_aad INTO DATA(lx_error2).
        out->write( lx_error2->error ).

    ENDTRY.

    out->write( '--datos aerolinea concreta--' ).
    out->write( lo_manager->zif_flight_manager_aad~get_flights_by_airline( 'LH' ) ).

    out->write( '--vuelo más barato--' ).
    out->write( lo_manager->zif_flight_manager_aad~get_cheapest_flight( ) ).

    out->write( '--facturacion total--' ).
    out->write( lo_manager->zif_flight_manager_aad~get_total_revenue( ) ).

  ENDMETHOD.
ENDCLASS.
