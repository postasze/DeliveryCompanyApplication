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
    
    public partial class ODBIORCY
    {
        public ODBIORCY()
        {
            this.PRZESYŁKI = new HashSet<PRZESYŁKI>();
        }
    
        public decimal ID_ODBIORCY { get; set; }
        public decimal ADRES_ZAMIESZKANIA { get; set; }
        public string PIERWSZE_IMIE { get; set; }
        public string DRUGIE_IMIE { get; set; }
        public string NAZWISKO { get; set; }
    
        public virtual ADRESY ADRESY { get; set; }
        public virtual ICollection<PRZESYŁKI> PRZESYŁKI { get; set; }
    }
}