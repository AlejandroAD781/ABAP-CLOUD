CLASS zcl_path_expression_02_aad DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_path_expression_02_aad IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  SELECT Booking~travelID, Booking~carrierID, \_Travel-AgencyId, \_Travel\_Agency-name, \_Travel\_Customer-customer_id, concat_with_space( \_Travel\_Customer-first_name, \_Travel\_Customer-last_name, 1 ) as CustomerName
  from zi_cds4_aad as Booking
  WHERE \_Travel\_Customer-last_name LIKE 'M%' "AND \_Travel\_customer-city = \_Travel\_Agency-city esto no se puede hacer parece
  ORDER by \_Travel\_Customer-last_name, Booking~travelID descending
  into table @data(lt_view)
  up to 20 rows.


if sy-subrc = 0.
    out->write( lt_view ).
endif.


  ENDMETHOD.
ENDCLASS.
