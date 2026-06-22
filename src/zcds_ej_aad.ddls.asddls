@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS'
@Metadata.ignorePropagatedAnnotations: true
//define view entity ZCDS_EJ_AAD as select from zdb_tabla_aad
//{
//    
//    nombre as Nombre,          
////    case correo
////            when 'pepa@com' then 'pepa@experis.com'
////            else 'no es un alumno'
////        end as NuevosCorreos
//    correo as Correo,
//    cast( 0 as abap.int4 ) as ID
//    
//    }
//
// 
//union select from ztb_alumnos  
//{     
//   nombre as Nombre,
//   cast( '' as abap.char(20)) as Correo,
//   id as ID
//                  
//}

define view entity ZCDS_EJ_AAD as select from /dmo/travel as VIAJE
    inner join /dmo/booking as reserva on reserva.travel_id = VIAJE.travel_id
    
{
    key VIAJE.travel_id as TravelID,
    key reserva.booking_id as BookingID,
        reserva.flight_date as FlightDate,
        @Semantics.amount.currencyCode: 'CurrencyCode'
        reserva.flight_price as BookingPrice,
        reserva.currency_code as CurrencyCode,
        VIAJE.agency_id as AgencyID,
        @Semantics.amount.currencyCode: 'CurrencyCode' //todo lo que tenga tipo curr, lleva previo semantics
        VIAJE.booking_fee as BookingFee
        
        
}
