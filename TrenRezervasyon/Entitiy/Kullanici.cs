//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TrenRezervasyon.Entitiy
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kullanici
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Kullanici()
        {
            this.Koltuk = new HashSet<Koltuk>();
        }
    
        public int KullaniciID { get; set; }
        public string kullaniciAdi { get; set; }
        public string kullaniciSifre { get; set; }
        public bool kullaniciTip { get; set; }
        public string adi { get; set; }
        public string soyadi { get; set; }
        public string adres { get; set; }
        public string telefon { get; set; }
        public string tckimlikno { get; set; }
        public bool cinsiyet { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Koltuk> Koltuk { get; set; }
    }
}
