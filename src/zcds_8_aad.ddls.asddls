@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS'
@Metadata.ignorePropagatedAnnotations: true

define view entity ZCDS_8_AAD as select from /dmo/customer
{
    key customer_id as CustomerID,
        case country_code
            when 'US' then concat( 'United States - ', concat_with_space( last_name, first_name, 2 ) )
            when 'DE' then 'Germany'
            when 'ES' then 'Spain'
            else 'codigo de pais distinto'
        end as Case1,
            
   $session.client as Cliente, //mandante
   $session.system_date as ClientField, //fecha actual del servidor
   $session.system_language as systemidioma, //idioma del sistema
   $session.user as UserField, // ID del usuario logeado
   $session.user_date as userData, // fecha local del usuario
   $session.user_timezone as userTz //zona horaria
      
}
