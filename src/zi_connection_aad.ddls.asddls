@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ejercicio cds2'
@Metadata.ignorePropagatedAnnotations: true
define view entity zi_connection_aad
  as select from /dmo/connection as Connection
  association [1..1] to /dmo/carrier as _Carrier            on  _Carrier.carrier_id = $projection.CarrierID
  association [1..1] to /dmo/airport as _DepartureAirport   on  _DepartureAirport.airport_id = $projection.AirportFromID
  association [0..*] to /dmo/flight  as _Flight             on  _Flight.connection_id = $projection.ConnectionID
                                                            and _Flight.carrier_id    = $projection.CarrierID
  association [1..1] to /dmo/airport as _DestinationAirport on  _DestinationAirport.airport_id = $projection.AirportToID

{
  key connection_id    as ConnectionID,
  key carrier_id       as CarrierID,
      airport_from_id  as AirportFromID,
      airport_to_id    as AirportToID,
      departure_time   as DepartureTime,
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance         as Distance,
      distance_unit as DistanceUnit,
      _Carrier,
      _DepartureAirport,
      _DestinationAirport,
      _Flight
}
