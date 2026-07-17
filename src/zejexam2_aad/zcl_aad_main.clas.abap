CLASS zcl_aad_main DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aad_main IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TRY.
  DATA(lo_vuelo) = new zcl_aad_passenger_flight( i_carrier_id = 'op' i_connection_id = '0001' i_plane_type = 'A320-200').
   OUT->WRITE( 'CONEXION ESTABLECIDA' ).
  CATCH zcx_c_abapd_no_connection.
  OUT->WRITE( 'CONNEXION NO ESTABLECIDA' ).
  return. "Si añades el return evita que continue tras coger el catch.
  ENDTRY.
  ENDMETHOD.
ENDCLASS.
