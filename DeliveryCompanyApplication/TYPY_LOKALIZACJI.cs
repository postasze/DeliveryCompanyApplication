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
    
    public partial class TYPY_LOKALIZACJI
    {
        public TYPY_LOKALIZACJI()
        {
            this.LOKALIZACJE = new HashSet<LOKALIZACJE>();
        }
    
        public decimal ID_TYPU { get; set; }
        public string TYP_LOKALIZACJI { get; set; }
    
        public virtual ICollection<LOKALIZACJE> LOKALIZACJE { get; set; }
    }
}
