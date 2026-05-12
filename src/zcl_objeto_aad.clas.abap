CLASS zcl_objeto_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
      INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_objeto_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
        DATA(lo_perro) = new ZCL_POO_AAD( ).
        OUT->WRITE( lo_perro ).
*Comprobrar si perro se ha creado CON if bound no es necesario pero asegura que exista.
        IF lo_perro IS BOUND.
            lo_perro->nombre = 'Dante'.
            out->write( lo_perro->ladrar(  ) ).
            lo_perro->lanzar_pelota( RECEIVING rv_accion = data(lv_accion) ).
            out->write( lv_accion ).
        ENDIF.
  ENDMETHOD.
ENDCLASS.
