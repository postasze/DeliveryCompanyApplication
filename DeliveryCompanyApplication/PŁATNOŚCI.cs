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
    
    public partial class PŁATNOŚCI
    {
        public PŁATNOŚCI()
        {
            this.PRZESYŁKI = new HashSet<PRZESYŁKI>();
        }
    
        public decimal ID_PŁATNOŚCI { get; set; }
        public decimal TYP_PŁATNOŚCI { get; set; }
        public string OPIS_PŁATNOŚCI { get; set; }
    
        public virtual ICollection<PRZESYŁKI> PRZESYŁKI { get; set; }
        public virtual TYPY_PŁATNOŚCI TYPY_PŁATNOŚCI { get; set; }
    }
}
