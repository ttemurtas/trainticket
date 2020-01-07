using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon.Models
{
    class TrenModel
    {
        public int TrenID { get; set; }
        public string trenAdi { get; set; }
        public int koltukSayisi { get; set; }

        public Koltuk Koltuk = new Koltuk();
        public Sefer sefer = new Sefer();
    }
}
