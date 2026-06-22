@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS EJERCICIO'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_CDS_BOOKING_AAD as select from /dmo/booking
association [1..1] to /dmo/carrier as _Carrier on _Carrier.carrier_id = $projection.CarrierID

{
    key booking_id as BookingID,
    carrier_id as CarrierID,
    flight_date as FlightDate,
    concat_with_space( _Carrier.carrier_id, _Carrier.name, 2 ) as CarrierInfo  
    
}
