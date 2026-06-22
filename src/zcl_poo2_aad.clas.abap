CLASS zcl_poo2_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    TYPES t_zejdbaad TYPE TABLE OF zejdbaad WITH KEY id.
    METHODS: cargarBBDD RETURNING VALUE(rv_resultado) TYPE t_zejdbaad,
             ingresarAlumno RETURNING VALUE(rv_resultado) TYPE t_zejdbaad,
             randompick RETURNING VALUE(rv_resultado) TYPE t_zejdbaad.
    DATA lv_nombre TYPE c LENGTH 50.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_poo2_aad IMPLEMENTATION.


  METHOD cargarBBDD.
    DELETE FROM zejdbaad.

    DATA ls_datos    TYPE zejdbaad.
    DATA lt_zejdbaad TYPE TABLE OF zejdbaad.

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

    MODIFY ZEJDBAAD FROM TABLE @lt_zejdbaad.

    rv_resultado = lt_zejdbaad.

  ENDMETHOD.

  METHOD ingresarAlumno.

    DATA lt_zejdbaad TYPE TABLE OF zejdbaad.
    DATA lv_maxlines TYPE int8.

    SELECT * FROM zejdbaad INTO TABLE @lt_zejdbaad.

    lv_maxlines = lines( lt_zejdbaad ) + 1.
    APPEND VALUE #( client = sy-mandt id = lv_maxlines nombre = lv_nombre ) TO lt_zejdbaad.
    MODIFY zejdbaad FROM TABLE @lt_zejdbaad.
    rv_resultado = lt_zejdbaad.


  ENDMETHOD.

  METHOD randompick.

    DATA lv_random   TYPE int8.
    DATA lt_zejdbaad TYPE TABLE OF zejdbaad.

    SELECT * FROM zejdbaad INTO TABLE @lt_zejdbaad.

    lv_random = cl_abap_random_int=>create(
                   seed = cl_abap_random=>seed( )
                   min  = 1
                   max  = lines( lt_zejdbaad )
                )->get_next( ).

    SELECT * FROM zejdbaad WHERE id = @lv_random INTO TABLE @lt_zejdbaad.

    rv_resultado = lt_zejdbaad.

  ENDMETHOD.

ENDCLASS.
