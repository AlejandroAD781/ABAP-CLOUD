@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Asociacion normal'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_asociaion_aad
  as select from /dmo/travel as Travel

  association [1..1] to /dmo/customer as _Customer on _Customer.customer_id = $projection.CustomerID // tb se puede poner  = Travel.CustomerID
  association [1..1] to /dmo/agency   as _Agency   on _Agency.agency_id = $projection.AgencyID
  association [0..*] to /dmo/booking  as _Booking  on _Booking.travel_id = $projection.TravelID
    // saldrán 3 tablas y que tienen aplicadas las 3 condiciones cuttomer agency y travel iguales.
{
  key Travel.travel_id                                                  as TravelID,
      Travel.customer_id                                                as CustomerID,
      agency_id                                                         as AgencyID,
      concat_with_space( _Customer.first_name, _Customer.last_name, 2 ) as CustomerName,
      _Agency,
      _Booking

}
