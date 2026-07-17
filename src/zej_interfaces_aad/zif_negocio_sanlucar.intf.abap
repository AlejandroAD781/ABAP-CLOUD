INTERFACE zif_negocio_sanlucar
  PUBLIC .
  METHODS get_nombre returning value(rv_nombre) TYPE STRING.
  METHODS get_tipo returning value(rv_tipo) TYPE STRING.
  METHODS get_descripcion returning value(rv_descripcion) TYPE STRING.
  METHODS calcular_precio returning value(rv_precio) TYPE decfloat16.

ENDINTERFACE.
