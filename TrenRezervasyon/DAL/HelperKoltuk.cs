using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;
using TrenRezervasyon.Models;

namespace TrenRezervasyon.DAL
{
    class HelperKoltuk
    {
        //public static Koltuk GetKoltukByName(string name)
        //{
        //    using (TrenEntities t=new TrenEntities())
        //    {
        //        return t.Koltuk.Where();
        //    }
        //}
        public static Koltuk GetKoltukByID(int ID)
        {
            using (TrenEntities t = new TrenEntities())
            {
                return t.Koltuk.Find(ID);
            }
        }
        public static (Koltuk, bool) Update(Koltuk koltuk)
        {
            using (TrenEntities t = new TrenEntities())
            {
                t.Entry(koltuk).State = System.Data.Entity.EntityState.Modified;
                if (t.SaveChanges() > 0)
                {
                    return (koltuk, true);
                }
                else
                {
                    return (koltuk, false);
                }
            }
        }
        public static (Koltuk,bool) Add(Koltuk k)
        {
            using (TrenEntities t=new TrenEntities())
            {
                t.Koltuk.Add(k);
                if (t.SaveChanges()>0)
                {
                    return (k, true);
                }
                else
                {
                    return (k, false);
                }
            }
        }
        public static List<Koltuk> GetListKoltuk()
        {
            using (TrenEntities t=new TrenEntities())
            {
                return t.Koltuk.ToList();
            }
        }
        //public static List<Koltuk> koltuks()
        //{
        //    List<Koltuk> TümKoltuklar = new List<Koltuk>();
        //    List<Koltuk> koltuklar = new List<Koltuk>();
        //    foreach (var item in TümKoltuklar)
        //    {
        //        if (item.TrenID == t.TrenID)
        //        {
        //            koltuklar.Add(item);
        //        }
        //    }
        //}
        public static List<KoltukModel> GetKoltukModels(List<Koltuk> koltuks)
        {
            List<KoltukModel> koltukModeller = new List<KoltukModel>();
            foreach (var item in koltuks)
            {
                KoltukModel koltukModel = new KoltukModel()
                {
                    durum = item.durum,
                    KoltukID = item.KoltukID,
                    TrenID = item.TrenID
                };
                koltukModeller.Add(koltukModel);
            }
            return koltukModeller;
        }
    }
}
