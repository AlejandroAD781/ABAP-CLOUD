CLASS zcl_ejercicios_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_ejercicios_aad IMPLEMENTATION.

"ejercicio"

  METHOD if_oo_adt_classrun~main.

  DATA(lv_edad) = cl_abap_random_int=>create( seed = cl_abap_random=>seed( )
                                             min = 1
                                             max = 100 )->get_next( ).
DATA lv_precio TYPE i.
DATA lv_description TYPE string.

"determinar precio segun edad

IF lv_edad < 12.
    lv_precio = 5.
    lv_description = 'Menor de 12 años'.

ELSEIF lv_edad >= 13 AND lv_edad <= 18.
    lv_precio = 10.
    lv_description = 'Adolescente (13-18 años)'.

ELSEIF lv_edad > 18 AND lv_edad <= 65.
    lv_precio = 20.
    lv_description = 'Adulto (18-65 años)'.

ELSE.

    lv_precio = 10.
    lv_description = 'Mayor de 65 años'.
ENDIF.

out->write(  |Edad: { lv_edad } años| ).
out->write(  |Categoría: { lv_description }| ).
out->write(  |Precio: { lv_precio } €| ).
out->write(  'Fin de programa' ).

  ENDMETHOD.
ENDCLASS.
