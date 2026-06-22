@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS JOINS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZI_JOINS_AAD as select from /dmo/travel as VIAJE
    inner join /dmo/booking as reserva on reserva.travel_id = VIAJE.travel_id
    
{
    key VIAJE.travel_id as TravelID,    // a diferencia del union, aqui no hay que crear los campos que no concuerden.
    key reserva.booking_id as BookingID,
        VIAJE.agency_id as AgencyID,
        VIAJE.begin_date as BeginDate,
        VIAJE.end_date as EndDate,
        reserva.booking_date as BookingDate,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        VIAJE.total_price as TotalPrice,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        reserva.flight_price as BookingPrice,
        reserva.currency_code as CurrencyCode 
}
