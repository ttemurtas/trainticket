using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon.DAL
{
    class HelperBilet
    {
        public static (Bilet, bool) Add(Bilet b)
        {
            using (TrenEntities t = new TrenEntities())
            {
                t.Bilet.Add(b);
                if (t.SaveChanges()>0)
                {
                    return (b, true);
                }
                else
                {
                    return (b, false);
                }
            }
        }
    }
}
