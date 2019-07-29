using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DeliveryCompanyApplication
{
    class AccountComparer : IEqualityComparer<KONTA>
    {
        public bool Equals(KONTA konto1, KONTA konto2)
        {
            return konto1.NICK == konto2.NICK && konto1.HASŁO == konto2.HASŁO &&
                konto1.TYP_KONTA == konto2.TYP_KONTA;
        }

        public int GetHashCode(KONTA konto)
        {
            int hCode = Decimal.ToInt32(konto.TYP_KONTA) * 
                konto.NICK.GetHashCode() * konto.HASŁO.GetHashCode();
            return hCode.GetHashCode();
        }

    }
}
