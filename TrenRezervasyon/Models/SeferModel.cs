using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon.Models
{
    class SeferModel
    {
        public int SeferID { get; set; }
        public System.DateTime seferTarihi { get; set; }
        public string seferYonu { get; set; }
        public string varisYonu { get; set; }
        public int TrenID { get; set; }
        public bool durum { get; set; }


        public Tren tren = new Tren();
    }
}
