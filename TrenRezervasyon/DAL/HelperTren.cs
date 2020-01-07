using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;
using TrenRezervasyon.Models;

namespace TrenRezervasyon.DAL
{
    class HelperTren
    {
        //public static List<TrenModel> GetTrenModels(List<Tren> trenler)
        //{
        //    List<TrenModel> urunModeller = new List<TrenModel>();
        //    foreach (var item in trenler)
        //    {
        //        TrenModel trenModel = new TrenModel()
        //        {
        //            sefer = item.Sefer.
        //            koltukSayisi = item.koltukSayisi,
        //            trenAdi = item.trenAdi,
        //            TrenID = item.TrenID,


        //        };
        //        urunModeller.Add(urunModel);

        //    }
        //    return urunModeller;
        //}
        public static (Tren,bool) Add(Tren tren)
        {
            using (TrenEntities t=new TrenEntities())
            {
                t.Tren.Add(tren);
                if (t.SaveChanges()>0)
                {
                    return (tren, true);
                }
                else
                {
                    return (tren, false);
                }
            }
        }
        public static List<Tren> GetListTrens()
        {
            using (TrenEntities t=new TrenEntities())
            {
                return t.Tren.ToList();
            }
        }
        public static Tren GetTrenByName(string name)
        {
            using (TrenEntities t = new TrenEntities())
            {
                Tren tren = t.Tren.Where(x => x.trenAdi.ToLower() == name).FirstOrDefault();
                return tren;
            }
        }
        public static Tren GetTrenByID(int ID)
        {
            using (TrenEntities t = new TrenEntities())
            {
                return t.Tren.Find(ID);
            }
        }
        public static int GetTrenIDByName(string name)
        {
            using (TrenEntities t = new TrenEntities())
            {
                Tren tren = t.Tren.Where(x => x.trenAdi.ToLower() == name).FirstOrDefault();
                return tren.TrenID;
            }
        }
        //public static string SearchTrenByName(string name)
        //{
        //    string a;
        //    using (TrenEntities c = new TrenEntities())
        //    {
        //        List<Tren> trenler = GetListTrens();
        //        foreach (var item in trenler)
        //        {
        //            if (item.trenAdi.Contains(name))
        //            {
        //                if (name==item.trenAdi)
        //                {

        //                }
        //            }
        //        }
        //        return trenler;
        //    }
        //}
        //public static bool VarMı(string text)
        //{
            
            
        //}

    }
}
