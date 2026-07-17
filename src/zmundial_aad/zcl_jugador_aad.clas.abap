CLASS zcl_jugador_aad DEFINITION
  PUBLIC
  INHERITING FROM zcl_acreditado_aad
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  DATA: dorsal type i,
        posicion TYPE string,
        convocado TYPE abap_bool.

  METHODS: CONSTRUCTOR IMPORTING
            i_nombre TYPE string
            i_pais TYPE string
            i_caducidad type d
            i_acreditaciones TYPE i
            i_dorsal TYPE i
            i_posicion TYPE string
            i_convocado TYPE abap_bool,

            describir_pase REDEFINITION.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jugador_aad IMPLEMENTATION.

  METHOD constructor.

    super->constructor( i_nombre = i_nombre i_pais = i_pais i_caducidad = i_caducidad i_acreditaciones = i_acreditaciones ).
    dorsal = i_dorsal.
    posicion = i_posicion.
    convocado = i_convocado.

  ENDMETHOD.

  METHOD describir_pase.
  DATA lv_acreditaciones TYPE i.
  get_acreditacion(  IMPORTING o_acreditaciones = lv_acreditaciones ).
        rv_resultado = |Descripcion pase: Nombre:{ nombre } Pais:{ pais } Caducidad:{ caducidad } Acreditaciones:{ lv_acreditaciones } Posición:{ posicion } Dorsal:{ Dorsal }|.
  ENDMETHOD.

ENDCLASS.
