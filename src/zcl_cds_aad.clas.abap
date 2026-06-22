CLASS zcl_cds_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_cds_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT Booking~travelID, Booking~bookingID, \_Travel-AgencyId, \_Travel\_Agency-name as AgencyName, concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 2 ) as Customer_id
  from zi_cds4_aad as Booking
  WHERE booking~CarrierID = 'AA'
  into table @data(lt_view)
  up to 5 rows.

if sy-subrc = 0.
    out->write( lt_view ).
endif.

  ENDMETHOD.
ENDCLASS.
