//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DeliveryCompanyApplication
{
    using System;
    using System.Collections.Generic;
    
    public partial class POJAZDY_KURIERSKIE
    {
        public POJAZDY_KURIERSKIE()
        {
            this.KURIERZY_POJAZDY = new HashSet<KURIERZY_POJAZDY>();
        }
    
        public decimal ID_POJAZDU { get; set; }
        public decimal ID_LOKALIZACJI { get; set; }
        public decimal TYP_POJAZDU { get; set; }
        public string NUMER_REJESTRACYJNY { get; set; }
        public string MARKA_POJAZDU { get; set; }
        public System.DateTime DATA_NASTĘPNEGO_PRZEGLĄDU { get; set; }
    
        public virtual ICollection<KURIERZY_POJAZDY> KURIERZY_POJAZDY { get; set; }
        public virtual LOKALIZACJE LOKALIZACJE { get; set; }
        public virtual TYPY_POJAZDÓW_KURIERSKICH TYPY_POJAZDÓW_KURIERSKICH { get; set; }
    }
}
