using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon.DAL
{
    class HelperKullanici
    {
        public static Kullanici GetKullaniciByName(string name)
        {
            using (TrenEntities t = new TrenEntities())
            {
                Kullanici k = t.Kullanici.Where(x => x.kullaniciAdi.ToLower() == name).FirstOrDefault();
                return k;
            }
        }
        public static int GetKullaniciIDByName(string name)
        {
            using (TrenEntities t = new TrenEntities())
            {
                Kullanici k = t.Kullanici.Where(x => x.kullaniciAdi.ToLower() == name).FirstOrDefault();
                return k.KullaniciID;
            }
        }
        public static (Kullanici, bool) SignIn(string userName, string password)
        {
            using (TrenEntities t = new TrenEntities())
            {
                Kullanici kullanici = new Kullanici();

                kullanici = t.Kullanici.FirstOrDefault(x => x.kullaniciAdi == userName && x.kullaniciSifre == password);

                if (kullanici != null)
                {
                    return (kullanici, true);
                }
                else
                {
                    return (kullanici, false);
                }
            }
        }
        public static (Kullanici,bool) KayitOl(Kullanici k)
        {
            using (TrenEntities s = new TrenEntities())
            {
                s.Kullanici.Add(k);
                if (s.SaveChanges() > 0)
                {
                    return (k, true);
                }
                else
                {
                    return (k, false);
                }
            }
        }
        public static List<Kullanici> GetListKullanici()
        {
            using (TrenEntities t=new TrenEntities())
            {
                return t.Kullanici.ToList();
            }
        }
        public enum Cinsiyet
        {
            Bay, Bayan
        }
    }
}
