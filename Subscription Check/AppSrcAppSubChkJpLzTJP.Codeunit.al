/* -------------------------------------------------------------------------------------------------
December, 2021  Tectura Japan K.K. / Anada, Masamichi
    
    Using the tenant id in the URL, determin if the tenant has the subscription of our app or not
    This part needs to be replaced once our entitlement backend system is ready
    (for Japanese Localization (Japan))
------------------------------------------------------------------------------------------------- */
#if AppSource
codeunit 70658581 "AppSrc App Sub Chk Jp Lz TJP"
{
    procedure ThisTenantHasTheSubscription(URL: text; var CustomerName: Text): Boolean
    var
        AzureADTenant: Codeunit "Azure AD Tenant";
        TenantID: Text;
    begin
        // Get URL & Tenant ID
        URL := System.GetUrl(ClientType::Current);
        TenantID := AzureADTenant.GetAadTenantId();

        // Customers with Subscription
        if TenantID = '5b14fc65-f753-4d91-9ca7-3ea498e2ea74' then begin   // Aden & Anais
            CustomerName := 'Aden & Anais';
            exit(true);
        end;
        if TenantID = '4baae6df-37c8-4042-bd15-e1cac05e7b89' then begin   // CEM Japan
            CustomerName := 'CEM Japan';
            exit(true);
        end;
        if TenantID = '882ae837-24d2-4615-b890-53d996f9dfac' then begin   // Charon
            CustomerName := 'Charon';
            exit(true);
        end;
        if TenantID = 'f5751b6e-9708-4b6b-bf1e-8a39da0d9fec' then begin   // Deloitte
            CustomerName := 'Deloitte';
            exit(true);
        end;
        if TenantID = '02f46bae-888e-4621-bf46-d359c5122ff9' then begin   // Epicrew
            CustomerName := 'Epicrew';
            exit(true);
        end;
        if TenantID = '1fc0da18-a531-4384-b842-379f53b9a9b1' then begin   // Equis Japan
            CustomerName := 'Equis Japan';
            exit(true);
        end;
        if TenantID = 'b5463670-d098-4a0f-a5ab-f96a64ebb8bb' then begin   // IDEC Group
            CustomerName := 'IDEC Group';
            exit(true);
        end;
        if TenantID = '54177ace-c5cf-4783-90af-94dbc5db7ed0' then begin   // Jadeite Medicines
            CustomerName := 'Jadeite Medicines';
            exit(true);
        end;
        if TenantID = '633d5e81-cdcd-4fee-a44a-d66c6752ccdc' then begin   // Managesoft
            CustomerName := 'Managesoft';
            exit(true);
        end;
        if TenantID = 'efa9a9e1-c3d8-424e-acf5-574179cea8b1' then begin   // MOTEX
            CustomerName := 'MOTEX';
            exit(true);
        end;
        if TenantID = 'ac8510a3-82e6-4ece-affd-c8ca29ee1d4e' then begin   // Movora
            CustomerName := 'Movora';
            exit(true);
        end;
        if TenantID = '1de7aa6c-5376-47a8-a94f-fd790714fb1b' then begin   // Munters
            CustomerName := 'Munters';
            exit(true);
        end;
        if TenantID = '19491d82-bac7-419a-861b-7ed4a031972d' then begin   // Navtor
            CustomerName := 'Navtor';
            exit(true);
        end;
        if TenantID = '4863f5d6-4760-4589-be9c-42f82e075739' then begin   // PLDV
            CustomerName := 'PLDV';
            exit(true);
        end;
        if TenantID = 'ea5a318c-360b-45fa-a3b4-c77bd13d62d8' then begin   // Peninsula
            CustomerName := 'Peninsula';
            exit(true);
        end;
        if TenantID = 'f02a6b6d-b0fd-4413-b37b-bf91407c8597' then begin   // Seibu Denki
            CustomerName := 'Seibu Denki';
            exit(true);
        end;
        if TenantID = 'a7fcaca6-9af3-4dee-b5de-4dd9cc8c22eb' then begin   // StrategIT
            CustomerName := 'StrategIT';
            exit(true);
        end;
        if TenantID = '6ffacdd8-f58e-42c9-8b30-295938042506' then begin   // Vaxxinova
            CustomerName := 'Vaxxinova';
            exit(true);
        end;
        if TenantID = '0532e3ca-5510-49ca-a1ec-37a28a1a9c5a' then begin   // Vena Energy Japan
            CustomerName := 'Vena Energy Japan';
            exit(true);
        end;
        if TenantID = '3603b1a0-7e50-4e0d-b989-37bafba80c51' then begin   // Yoshiwada Hamamatsu
            CustomerName := 'Yoshiwada Hamamatsu';
            exit(true);
        end;

        // Tectura
        if TenantID = 'da4f5ab0-1664-4972-8bcf-1aca992c10b0' then begin   // Tectura Japan
            CustomerName := 'Tectura Japan';
            exit(true);
        end;
        if TenantID = '9450957c-4b5f-4bd5-b81b-6dda7395f766' then begin   // Tectura Japan 2
            CustomerName := 'Tectura Japan 2';
            exit(true);
        end;
        if TenantID = '4e7ca966-123e-4ce7-9833-3e858854b98f' then begin   // Tectura Hong Kong
            CustomerName := 'Tectura Hong Kong';
            exit(true);
        end;

        // Trial

        // Other
        if TenantID = '8d886251-212d-40d3-858b-1ace987f480a' then begin   // Anada SaaS
            CustomerName := 'Anada SaaS';
            exit(true);
        end;
        if URL.Contains('http://dbcsw1l:80/BC') = true then begin    // Anada Docker
            CustomerName := 'Anada Docker';
            exit(true);
        end;

        //if TenantID = 'xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' then begin   // xxxxxxxxxx
        //    CustomerName := 'xxxxxxxxxx';
        //    exit(true);
        //end;

        // Unknown
        CustomerName := 'Unknown';
        exit(false);
    end;
}
#endif

#if OnPremise
codeunit 99004 "AppSrc App Sub Chk Jp Lz TJP"
{
    procedure ThisTenantHasTheSubscription(URL: text; var CustomerName: Text): Boolean
    var
    begin
        // Get URL
        URL := System.GetUrl(ClientType::Current);

        // On-Premise Customer
        CustomerName := 'On-Premise Customer';
        exit(true);
    end;
}
#endif