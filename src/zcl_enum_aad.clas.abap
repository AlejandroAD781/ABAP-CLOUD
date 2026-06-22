CLASS zcl_enum_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_enum_aad IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "" DECLARACION ENUM
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*
*  TYPES: BEGIN OF ENUM ty_color,
*        rojo,
*        verde,
*        azul,
*        END OF ENUM ty_color. "NO PERMITE PONER OTROS VALORES
*
*  DATA lv_color TYPE ty_color.
*  lv_color = rojo. "no pasa nada si no se pone comillas
*  "lv_color = amarillo. "da fallo
*
*  TYPES: BEGIN OF ENUM ty_vuelos,
*         nacional,
*         internacional,
*         charter,
*         END OF ENUM ty_vuelos.
*
*  DATA lv_vuelo TYPE ty_vuelos.
*  lv_vuelo = internacional.
*
*  CASE lv_vuelo.
*  WHEN nacional.
*    out->write( 'Vuelo mismo pais' ).
*  WHEN internacional.
*      out->write( 'Vuelo entre paises' ).
*  WHEN charter.
*      out->write( 'Vuelo privado' ).
*  ENDCASE.
*
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"EJERCICIO BBDD
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

DATA ls_datos    TYPE zejdbaad.
DATA lt_zejdbaad TYPE TABLE OF zejdbaad.
*DATA lv_random   TYPE int8.
DATA lv_maxlines TYPE int8. "Añadir manualmente datos.
DATA lv_nombre TYPE c length 50.

lt_zejdbaad = VALUE #(
  ( client = sy-mandt id = 0 nombre = 'Sergio'  )
  ( client = sy-mandt id = 0 nombre = 'Karen'  )
  ( client = sy-mandt id = 0 nombre = 'Alejandro'  )
  ( client = sy-mandt id = 0 nombre = 'Lidia'  )
  ( client = sy-mandt id = 0 nombre = 'Jesus' )
  ( client = sy-mandt id = 0 nombre = 'Samuel'  )
  ( client = sy-mandt id = 0 nombre = 'Sarah'  )
  ( client = sy-mandt id = 0 nombre = 'Jose Antonio'  )
  ( client = sy-mandt id = 0 nombre = 'Luir'  )
  ( client = sy-mandt id = 0 nombre = 'Maria Dolores'  )
  ( client = sy-mandt id = 0 nombre = 'Rebeca'  )
  ( client = sy-mandt id = 0 nombre = 'Miguel'  )
  ( client = sy-mandt id = 0 nombre = 'Antonio'  )
  ( client = sy-mandt id = 0 nombre = 'David'  )
  ( client = sy-mandt id = 0 nombre = 'Adrian'  )
  ( client = sy-mandt id = 0 nombre = 'Rafael'  )  ).

LOOP AT lt_zejdbaad INTO ls_datos.
  ls_datos-id = CONV int8( sy-tabix ).
  MODIFY lt_zejdbaad FROM ls_datos INDEX sy-tabix.
ENDLOOP.

"AÑADIR MANUALMENTE DATOS
lv_maxlines = lines( lt_zejdbaad ) + 1.
lv_nombre = 'Adrian'. "AÑADIR EL NOMBRE A COMPROBAR


"IF lt_zejdbaad[ 1 ]-nombre = lv_nombre OR lt_zejdbaad[ 2 ]-nombre = lv_nombre...
IF line_exists( lt_zejdbaad[ nombre = lv_nombre ] ). "line_exists FUNCION PARA VER DIRECTAMENTE SI ALGO EXISTE O NO.
  out->write( 'INDICAR OTRO NOMBRE NO REPETIDO' ).
ELSE.
  lv_maxlines = lines( lt_zejdbaad ) + 1.
  APPEND VALUE #( client = sy-mandt id = lv_maxlines nombre = lv_nombre ) TO lt_zejdbaad.
  out->write( 'EJERCICIO 1. tabla generada' ).
  MODIFY zejdbaad FROM TABLE @lt_zejdbaad.
  out->write( lt_zejdbaad ).
ENDIF.



""
"otra forma
""
*    SELECT SINGLE FROM ztb_alumnos
*      FIELDS @abap_true  "si hay filas devuelveme una "x"
*      WHERE nombre = @lv_nuevo_nombre
*      INTO @DATA(lv_existe).
*
*    IF lv_existe = abap_true.
*      " Ya hay alguien con ese nombre → NO insertar, avisar al usuario
*
*
*    ELSE.
*     SELECT COUNT(*) FROM ztb_alumnos INTO @DATA(lv_count2).
*          lv_id = lv_count2 + 1.
*          INSERT ztb_alumnos FROM @( VALUE #( id     = lv_id
*                                              nombre = lv_nuevo_nombre ) ).
*    ENDIF.

""

*MODIFY zejdbaad FROM TABLE @lt_zejdbaad.
*
*lv_random = cl_abap_random_int=>create(
*               seed = cl_abap_random=>seed( )
*               min  = 1
*               max  = lines( lt_zejdbaad )
*            )->get_next( ).
*
*SELECT * FROM zejdbaad WHERE id = @lv_random INTO TABLE @lt_zejdbaad.
*
*out->write( '-funcion random tabla-' ).
*out->write( lt_zejdbaad ).


  ENDMETHOD.
ENDCLASS.
