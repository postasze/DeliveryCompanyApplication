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
    
    public partial class WOJEWÓDZTWA
    {
        public WOJEWÓDZTWA()
        {
            this.ADRESY = new HashSet<ADRESY>();
            this.MIASTA = new HashSet<MIASTA>();
        }
    
        public decimal ID_WOJEWÓDZTWA { get; set; }
        public decimal PAŃSTWO { get; set; }
        public string WOJEWÓDZTWO { get; set; }
    
        public virtual ICollection<ADRESY> ADRESY { get; set; }
        public virtual ICollection<MIASTA> MIASTA { get; set; }
        public virtual PAŃSTWA PAŃSTWA { get; set; }
    }
}
