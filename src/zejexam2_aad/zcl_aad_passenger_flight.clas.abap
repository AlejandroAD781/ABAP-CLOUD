CLASS zcl_aad_passenger_flight DEFINITION
  PUBLIC
  INHERITING FROM zcl_aad_flight
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS: constructor IMPORTING
                           i_carrier_id    TYPE /dmo/carrier_id
                           i_connection_id TYPE /dmo/connection_id
                           i_plane_type    TYPE /dmo/plane_type_id
                         RAISING
                           zcx_C_ABAPD_NO_CONNECTION.

  PROTECTED SECTION.
  PRIVATE SECTION.
      DATA seat_max TYPE /dmo/plane_seats_max.

ENDCLASS.



CLASS zcl_aad_passenger_flight IMPLEMENTATION.
  METHOD constructor.

    super->constructor( i_carrier_id = i_carrier_id i_connection_id = i_connection_id i_plane_type = i_plane_type ).

   SELECT SINGLE MaximumSeats
      FROM zi_cabapd_passenger
      WHERE PlaneTypeiD = @i_plane_type
      INTO @seat_max.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_c_abapd_no_connection.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
