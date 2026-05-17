CLASS zcl_bucles_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BUCLES_AAD IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lv_num TYPE i VALUE 0.
    DATA lv_rep TYPE i VALUE 5.

    DO lv_rep TIMES.

      out->write( lv_num ).
      lv_num = lv_num + 1.

      IF lv_num = 3.
        EXIT.
      ENDIF.

    ENDDO.

    WHILE lv_num < 10.

    lv_num += 1.
    out->write(  lv_num ).

    ENDWHILE.

  ENDMETHOD.
ENDCLASS.
