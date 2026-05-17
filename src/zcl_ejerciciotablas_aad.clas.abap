CLASS zcl_ejerciciotablas_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ejerciciotablas_aad IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF ty_empleados,
             nombre   TYPE string,
             edad     TYPE i,
             telefono TYPE string,
             correo   TYPE string,
           END OF ty_empleados.

    DATA lt_tabla1 TYPE TABLE OF ty_empleados.
    DATA lt_tabla2 LIKE lt_tabla1.

    out->write( '1. CREAR TABLA' ).
    out->write( |············· | ).
    lt_tabla1 = VALUE #(
  ( nombre = 'Carlos'   edad = 25 telefono = '987654321' correo = 'carlos@gmail.com' )
  ( nombre = 'María' edad = 30 telefono = '912345678' correo = 'maria@hotmail.com' )
  ( nombre = 'José'     edad = 28 telefono = '923456781' correo = 'jose@yahoo.com' )
  ( nombre = 'Lucía'    edad = 22 telefono = '934567812' correo = 'lucia@gmail.com' )
  ( nombre = 'Pedro'    edad = 35 telefono = '945678123' correo = 'pedro@outlook.com' )
  ( nombre = 'Sofía'    edad = 27 telefono = '956781234' correo = 'sofia@gmail.com' )
  ( nombre = 'Andrés'   edad = 31 telefono = '967812345' correo = 'andres@yahoo.com' )
  ( nombre = 'Valeria'  edad = 24 telefono = '978123456' correo = 'valeria@hotmail.com' )
  ).

    out->write( lt_tabla1 ).

    out->write( | | ).
    out->write( '2. COPIAR TIPO Y CONTENIDO EN TABLA NUEVA' ).
    out->write( |············· | ).

    INSERT LINES OF lt_tabla1 INTO TABLE lt_tabla2.
    out->write( lt_tabla2 ).


    out->write( | | ).
    out->write( '3. INTRODUCIR EN LINEA 2 UN ESPACIO EN BLANCO' ).
    out->write( |············· | ).

    INSERT VALUE #( ) INTO lt_tabla2 INDEX 2.
    out->write( lt_tabla2 ).

    out->write( | | ).
    out->write( '4. AÑADIR CON APPEND NUEVA LINEA A TABLA2' ).
    out->write( |············· | ).

    APPEND VALUE #( nombre = 'Juan'  edad = 28 telefono = '971876456' correo = 'juan@hotmail.com' ) TO lt_tabla2.
    out->write( lt_tabla2 ).

    out->write( | | ).
    out->write( '5. AÑADIR RANDOM INSERT DE FILAS DE TABLA 2 A TABLA 1' ).
    out->write( |············· | ).

    DATA(lv_registros) = lines( lt_tabla2 ).

*    DATA(lv_randommin) = cl_abap_random_int=>create(
*    seed = cl_abap_random=>seed( )
*    min  = 1
*    max  = lv_registros
*    )->get_next( ).
*
*    DATA(lv_randommax) = cl_abap_random_int=>create(
*    seed = cl_abap_random=>seed( )
*    min  = lv_randommin
*    max  = lv_registros
*    )->get_next( ).
*
*    out->write( |rango insertado { lv_randommin } - { lv_randommax }| ).
*    out->write( | | ).

"""OPCION2

    DATA(lv_random) = cl_abap_random_int=>create(
    seed = cl_abap_random=>seed( )
    min  = 1
    max  = lv_registros
    ).

    DATA(lv_randommin) = lv_random->get_next( ).
    DATA(lv_randommax) = lv_random->get_next( ).

    IF lv_randommin > lv_randommax.
        DATA(lv_aux) = lv_randommin.
        lv_randommin = lv_randommax.
        lv_randommax = lv_aux.
    ENDIF.

    INSERT LINES OF lt_tabla2 from lv_randommin to lv_randommax INTO lt_tabla1 INDEX 1.

    out->write( |rango insertado { lv_randommin } - { lv_randommax }| ).
    out->write( | | ).
    out->write( lt_tabla1 ).

  ENDMETHOD.

ENDCLASS.
