using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon.Models
{
    class KoltukModel
    {
        public int KoltukID { get; set; }
        public int TrenID { get; set; }
        public bool durum { get; set; }
        public string adi { get; set; }
        public string soyadi { get; set; }
        public string tcno { get; set; }
        public string telefon { get; set; }
        public string adres { get; set; }
        public Nullable<int> KullaniciID { get; set; }

        public Kullanici Kullanici = new Kullanici();
        public Tren Tren = new Tren();
    }
}
