CLASS zcl_periodista_aad DEFINITION
  PUBLIC
  INHERITING FROM zcl_acreditado_aad
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA: prensa TYPE string,
        acceso TYPE abap_bool.

        METHODS: constructor importing
                i_nombre TYPE string
            i_pais TYPE string
            i_caducidad type d
            i_acreditaciones TYPE i
            i_prensa TYPE string
            i_acceso TYPE abap_bool,

            describir_pase REDEFINITION.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_periodista_aad IMPLEMENTATION.

  METHOD constructor.
    super->constructor( i_nombre = i_nombre i_pais = i_pais i_caducidad = i_caducidad i_acreditaciones = i_acreditaciones ).
    prensa = i_prensa.
    acceso = i_acceso.
  ENDMETHOD.

  METHOD describir_pase.
    DATA lv_acreditaciones TYPE i.
    get_acreditacion(  IMPORTING o_acreditaciones = lv_acreditaciones ).
        rv_resultado = |Descripcion pase: Nombre:{ nombre } Pais:{ pais } Caducidad:{ caducidad } Acreditaciones:{ lv_acreditaciones } Prensa:{ prensa }|.
  ENDMETHOD.

ENDCLASS.
