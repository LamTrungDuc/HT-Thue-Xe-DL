using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.fonts.Models.Function
{
    public class CTDONHANGFunction
    {
        public class CTDonHangFunction
        {
            private MyDB context;
            public CTDonHangFunction()
            {
                context = new MyDB();
            }
            public IQueryable<CTDONHANG> CTDONHANGs
            {
                get { return context.CTDONHANGs; }
            }
            public int Insert(CTDONHANG model)
            {
                CTDONHANG dbEntry = context.CTDONHANGs.Find(model.ID_CTDH);
                if (dbEntry != null)
                {
                    return 0;

                }
                context.CTDONHANGs.Add(model);
                context.SaveChanges();
                return 1;
            }
            public int Update(CTDONHANG model)
            {
                CTDONHANG dbEntry = context.CTDONHANGs.Find(model.ID_CTDH);
                if (dbEntry == null)
                {
                    return 0;
                }
                dbEntry.ID_DH = model.ID_DH;
                dbEntry.ID_SP = model.ID_SP;
                dbEntry.soluong = model.soluong;
                dbEntry.dongia = model.dongia;
                context.SaveChanges();
                return 1;
            }
            public int Delete(CTDONHANG model)
            {
                CTDONHANG dbEntry = context.CTDONHANGs.Find(model.ID_CTDH);
                if (dbEntry == null)
                {
                    return 0;
                }
                context.CTDONHANGs.Remove(dbEntry);
                context.SaveChanges();
                return 1;
            }
            public CTDONHANG FindEntity(int ID_CTDH)
            {
                CTDONHANG dbEntry = context.CTDONHANGs.Find(ID_CTDH);
                return dbEntry;
            }
        }
    }
}