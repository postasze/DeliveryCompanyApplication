using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeliveryCompanyApplication
{

    class AddressComparer : IEqualityComparer<ADRESY>
    {
        public bool Equals(ADRESY adres1, ADRESY adres2)
        {
            return adres1.ULICA == adres2.ULICA && adres1.NUMER_DOMU == adres2.NUMER_DOMU &&
                adres1.NUMER_MIESZKANIA == adres2.NUMER_MIESZKANIA && adres1.KOD_POCZTOWY == adres2.KOD_POCZTOWY &&
                adres1.MIASTO == adres2.MIASTO && adres1.WOJEWÓDZTWO == adres2.WOJEWÓDZTWO && adres1.PAŃSTWO == adres2.PAŃSTWO;
        }
    
        public int GetHashCode(ADRESY adres)
        {
            int hCode = Decimal.ToInt32(adres.ID_ADRESU * adres.NUMER_DOMU * adres.NUMER_MIESZKANIA
                * adres.MIASTO * adres.WOJEWÓDZTWO * adres.PAŃSTWO) * adres.ULICA.GetHashCode() *
                adres.KOD_POCZTOWY.GetHashCode();
            return hCode.GetHashCode();
        }

    }
}
