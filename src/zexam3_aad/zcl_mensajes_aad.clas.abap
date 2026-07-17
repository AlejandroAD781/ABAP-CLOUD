CLASS zcl_mensajes_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_mensajes_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  message id 'ZC_MENSAJE_AAD' TYPE '' number '001' into data(lv_texto).
  out->write( lv_texto ).
  out->write( text-001 ).

  ENDMETHOD.
ENDCLASS.
