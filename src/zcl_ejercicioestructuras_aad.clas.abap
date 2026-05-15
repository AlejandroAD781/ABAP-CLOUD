CLASS zcl_ejercicioestructuras_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
  interfaces if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_ejercicioestructuras_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

 ""
 "Ejercicio1
 ""

    TYPES: BEGIN OF ty_flights,
           iduser TYPE string,
           aircode TYPE /dmo/carrier_id,
           flightnum TYPE /dmo/connection_id,
           key TYPE land1,
           seat TYPE /dmo/plane_seats_occupied,
           flightdate TYPE /dmo/flight_date,
           END OF ty_flights.

    TYPES: BEGIN OF ty_airlines,
           carrid TYPE /dmo/carrier_id,
           connid TYPE /dmo/connection_id,
           countryfr TYPE land1,
           cityfrom TYPE /dmo/city,
           airfrom TYPE /dmo/airport_id,
           countryto TYPE land1,
           END OF ty_airlines.


""""""
""Ejercicio2
""""

    TYPES: BEGIN OF ty_nested,
           ls_airlinesnested TYPE ty_airlines,
           ls_flightsnested TYPE ty_flights,
           END OF ty_nested.

"""
"Ejercicio4
"""

    DATA: ls_flights TYPE ty_flights,
          ls_airlines TYPE ty_airlines,
          ls_nested TYPE ty_nested.

     ls_flights = VALUE #( iduser = 'aaaa' aircode = 'CDA' flightnum = '123' key = 'ABC' seat = 12 flightdate = '20210101').
     ls_airlines = VALUE #( carrid = 'ABP' connid = '123' countryfr = 'UIA' cityfrom = 'ALMERIA' airfrom = 'CBA' countryto = 'DTA' ).
     ls_nested = VALUE #( ls_airlinesnested = ls_airlines ls_flightsnested = ls_flights ).

out->write( '--------EJERCICIO 4--------' ).
out->write( ls_flights ).
out->write( ls_airlines ).
out->write( ls_nested ).

"""
"Ejercicio5
""
out->write( '--------EJERCICIO 5--------' ).

    DATA ls_include_flights TYPE ty_nested.
    out->write( ls_include_flights ).

"OPCION2

*    DATA ls_include_flights2 TYPE ty_flights.
*    DATA ls_include_airlines TYPE ty_airlines.
*
*    out->write( ls_include_flights2 ).
*    out->write( ls_include_airlines ).

""
"Ejercicio6"
""

    CLEAR ls_nested.
    CLEAR ls_include_flights.

    out->write( '--------EJERCICIO 6--------' ).
    out->write( ls_nested ).

  ENDMETHOD.

ENDCLASS.
