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
    
    public partial class TYPY_KONT
    {
        public TYPY_KONT()
        {
            this.KONTA = new HashSet<KONTA>();
        }
    
        public decimal ID_TYPU { get; set; }
        public string TYP_KONTA { get; set; }
    
        public virtual ICollection<KONTA> KONTA { get; set; }
    }
}
