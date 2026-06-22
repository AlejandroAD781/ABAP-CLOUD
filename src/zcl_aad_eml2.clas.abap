CLASS zcl_aad_eml2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_aad_eml2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA agencies_upd TYPE TABLE FOR UPDATE /DMO/I_AgencyTP.

    agencies_upd = VALUE #( ( agencyid = '0700##' name = 'Some fancy new name' ) ).

    MODIFY ENTITIES OF /dmo/I_agencyTP ENTITY /dmo/agency UPDATE FIELDS ( name ) WITH agencies_upd.

    out->write( agencies_upd ).
    out->write( 'Method execution finished!' ).

  ENDMETHOD.
ENDCLASS.
