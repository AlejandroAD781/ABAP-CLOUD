CLASS zcl_oo_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_oo_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*    data(lo_perro) = new zcl_poo_aad(  ).
*
*    if lo_perro is bound.
*
*    lo_perro->lv_nombre = 'Dante'.
*    out->write( lo_perro->ladrar(  ) ).
*
*    lo_perro->lv_nombre = 'PACO'.
*    out->write( lo_perro->lanzar_pelota( ) ).
*
*    lo_perro->lv_nombre = 'MANOLO'.
*    lo_perro->lv_color = 'AMARILLO'.
*    out->write( lo_perro->dormir(  ) ).
*
*    ENDIF.


    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    ""Pasar el ejercicio de las tablas a programacion a objetos
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    DATA(lo_ejercicio) = NEW zcl_poo2_aad(  ).

IF lo_ejercicio is bound.
    out->write( '=== CARGAR BBDD ===' ).
    DATA(lt_cargada) = lo_ejercicio->cargarbbdd( ).
    out->write( lt_cargada ).

    out->write( '=== INGRESAR ALUMNO ===' ).
    lo_ejercicio->lv_nombre = 'CR7'.
    DATA(lt_anuevo) = lo_ejercicio->ingresaralumno( ).
    out->write( lt_anuevo ).

    out->write( '=== RECOGER RANDOM ===' ).
    DATA(ls_rrandom) = lo_ejercicio->randompick( ).
    out->write( ls_rrandom ).

ENDIF.

  ENDMETHOD.



ENDCLASS.
