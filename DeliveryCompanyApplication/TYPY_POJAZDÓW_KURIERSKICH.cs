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
    
    public partial class TYPY_POJAZDÓW_KURIERSKICH
    {
        public TYPY_POJAZDÓW_KURIERSKICH()
        {
            this.POJAZDY_KURIERSKIE = new HashSet<POJAZDY_KURIERSKIE>();
        }
    
        public decimal ID_TYPU { get; set; }
        public string TYP_POJAZDU { get; set; }
    
        public virtual ICollection<POJAZDY_KURIERSKIE> POJAZDY_KURIERSKIE { get; set; }
    }
}
