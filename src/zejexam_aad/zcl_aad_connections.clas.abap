CLASS zcl_aad_connections DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces  if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aad_connections IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  data(lo_vuelo) = new zcl_aad_connections2( ).

  out->write( lo_vuelo->get_connections( i_departure = 'FRA' ) ).

  ENDMETHOD.


ENDCLASS.
