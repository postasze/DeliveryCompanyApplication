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
    
    public partial class KURIERZY_POJAZDY
    {
        public decimal ID_KURIERA { get; set; }
        public decimal ID_POJAZDU { get; set; }
        public System.DateTime DATA_UŻYCIA { get; set; }
    
        public virtual PRACOWNICY PRACOWNICY { get; set; }
        public virtual POJAZDY_KURIERSKIE POJAZDY_KURIERSKIE { get; set; }
    }
}
