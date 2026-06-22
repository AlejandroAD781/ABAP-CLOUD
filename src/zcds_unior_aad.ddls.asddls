@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS UNION'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZCDS_UNIOR_AAD as select from /dmo/travel
{
    key travel_id as TravelID,
    cast( '' as abap.numc(4)) as BookingID
 }

union select from /dmo/booking
{
    key travel_id as TravelID,
        booking_id as BookingID
}
