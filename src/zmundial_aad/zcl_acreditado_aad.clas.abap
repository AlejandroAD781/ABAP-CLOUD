CLASS zcl_acreditado_aad DEFINITION
  PUBLIC
  CREATE PUBLIC .

  PUBLIC SECTION.
    DATA: nombre    TYPE string,
          pais      TYPE string,
          caducidad TYPE d.

   methods: get_acreditacion exporting o_acreditaciones type i,
            constructor IMPORTING
            i_nombre TYPE string
            i_pais TYPE string
            i_caducidad type d
            i_acreditaciones TYPE i,
            describir_pase RETURNING VALUE(rv_resultado) type STRING.
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:  acreditaciones TYPE i.
ENDCLASS.


CLASS zcl_acreditado_aad IMPLEMENTATION.
  METHOD constructor.
    nombre = i_nombre.
    pais = i_pais.
    caducidad = i_caducidad.
    acreditaciones = i_acreditaciones.
  ENDMETHOD.

  METHOD get_acreditacion.
       o_acreditaciones = acreditaciones.
  ENDMETHOD.

  METHOD describir_pase.
    rv_resultado = |Descripcion pase: Nombre:{ nombre } Pais:{ pais } Caducidad:{ caducidad } Acreditaciones:{ acreditaciones }|. "Esto no es necesario si siempre se sobreescribe.
  ENDMETHOD.

ENDCLASS.
