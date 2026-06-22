CLASS zcl_ej_innerjoin DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ej_innerjoin IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.


"CATOLOGO COMPLETO DE AEROLINEA MONEDA EUR.
"MOSTRAR NOMBRE COMPLETO AEROLINEA, IDENTIFICADOR CONEXION, AIRPORT ORIGEN Y DESTINO, Y DISTANCIA CON UNIDAD.

SELECT car~name, con~connection_id, con~airport_from_id, con~airport_to_id, con~distance, con~distance_unit
  FROM /DMO/CARRIER AS car
  INNER JOIN /dmo/connection as con ON car~carrier_id = con~carrier_id
  WHERE car~currency_code = 'EUR'
  INTO TABLE @DATA(resultado).

  out->write( resultado ).

  ENDMETHOD.


ENDCLASS.
