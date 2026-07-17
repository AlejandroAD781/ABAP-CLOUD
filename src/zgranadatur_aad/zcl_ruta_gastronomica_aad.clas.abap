CLASS zcl_ruta_gastronomica_aad DEFINITION
  PUBLIC
  INHERITING FROM zcl_experiencia_aad
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  data: num_tapas TYPE i,
        nocturno TYPE abap_bool.

  METHODS: constructor IMPORTING
     i_nombre   TYPE string
                    i_precio   TYPE zdecimal2_25
                    i_duracion TYPE i
                    i_num_part TYPE i
                    i_num_tapas TYPE i
        i_nocturno TYPE abap_bool,

        calcular_precio REDEFINITION. "MODIFICA EL MÉTODO ORIGINAL DEL PADRE.



  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ruta_gastronomica_aad IMPLEMENTATION.
  METHOD constructor.
    super->constructor( i_nombre = i_nombre i_precio = i_precio i_duracion = i_duracion i_num_part = i_num_part ).
    num_tapas = i_num_tapas.
    nocturno = i_nocturno.
  ENDMETHOD.

  METHOD calcular_precio.
  DATA lv_precio_base type zdecimal2_25.
  get_precio_base(  IMPORTING o_precio = lv_precio_base ). "Como el precio es privado hemos tenido que hacer lo del precio base.


    IF num_part > 5.
      rv_total = lv_precio_base * num_part * '0.8'.
    ELSE.
      rv_total = lv_precio_base * num_part.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
