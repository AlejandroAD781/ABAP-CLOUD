CLASS zcl_fieldsymbols_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fieldsymbols_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA lt_tabla TYPE TABLE OF /dmo/flight.

  SELECT * FROM /dmo/flight INTO TABLE @lt_tabla.

   out->write( lt_tabla ).


*  LOOP AT lt_tabla ASSIGNING FIELD-SYMBOL(<fs_price>).
*    <fs_price>-price = <fs_price>-price * 2.
*  ENDLOOP.
*
*
*  UNASSIGN <fs_price>.

    LOOP AT lt_tabla INTO data(ls_price).
    ls_price-price = ls_price-price * 2.
    MODIFY lt_tabla FROM ls_price.
  ENDLOOP.

 out->write( lt_tabla ).

  ENDMETHOD.
ENDCLASS.
