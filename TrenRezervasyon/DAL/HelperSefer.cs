using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;
using TrenRezervasyon.Models;

namespace TrenRezervasyon.DAL
{
    class HelperSefer
    {
        public static Sefer GetSeferByID(int id)
        {
            using (TrenEntities t = new TrenEntities())
            {
                return t.Sefer.Find(id);
            }
        }
        public static (Sefer, bool) Update(Sefer s)
        {
            using (TrenEntities t = new TrenEntities())
            {
                t.Entry(s).State = System.Data.Entity.EntityState.Modified;
                if (t.SaveChanges() > 0)
                {
                    return (s, true);
                }
                else
                {
                    return (s, false);
                }
            }
        }
        public static (Sefer, bool) Add(Sefer g)
        {
            using (TrenEntities s = new TrenEntities())
            {
                s.Sefer.Add(g);
                if (s.SaveChanges() > 0)
                {
                    return (g, true);
                }
                else
                {
                    return (g, false);
                }
            }
        }
        public static List<SeferModel> GetSeferModels(List<Sefer> seferler)
        {
            List<SeferModel> seferModels = new List<SeferModel>();
            foreach (var item in seferler)
            {
                SeferModel seferModel = new SeferModel()
                {
                    seferYonu = item.seferYonu,
                    durum = item.durum,
                    varisYonu = item.varisYonu,
                    seferTarihi = item.seferTarihi,
                    tren = HelperTren.GetTrenByID(item.TrenID),
                    SeferID = item.SeferID,
                    TrenID = item.TrenID

                };
                seferModels.Add(seferModel);

            }
            return seferModels;
        }

        public static List<Sefer> GetSeferList()
        {
            using (TrenEntities t = new TrenEntities())
            {
                return t.Sefer.ToList();
            }
        }
        
    }
}
