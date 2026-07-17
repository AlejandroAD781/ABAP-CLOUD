CLASS zcl_aad_flight DEFINITION
  PUBLIC
  CREATE PUBLIC .
  PUBLIC SECTION.

    DATA: carrier_id    TYPE /dmo/carrier_id READ-ONLY,
          connection_id TYPE /dmo/connection_id READ-ONLY,
          airport_from  TYPE /dmo/airport_from_id READ-ONLY,
          airport_to    TYPE /dmo/airport_to_id READ-ONLY.

    METHODS: constructor IMPORTING
                                   i_carrier_id    TYPE /dmo/carrier_id
                                   i_connection_id TYPE /dmo/connection_id
                                   i_plane_type    TYPE /dmo/plane_type_id
                         RAISING   zcx_c_abapd_no_connection.

  PROTECTED SECTION.

    DATA plane_type TYPE /dmo/plane_type_id.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_aad_flight IMPLEMENTATION.
  METHOD constructor.

    carrier_id = i_carrier_id.
    connection_id = i_connection_id.
    plane_type = i_plane_type.

    SELECT SINGLE airport_from_id, airport_to_id FROM /DMO/connection "Como solo se quiere guardar un registro se usa SINGLE.
    WHERE carrier_id = @i_carrier_id AND connection_id = @i_connection_id
    INTO ( @airport_from, @airport_to ).

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_c_abapd_no_connection.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
