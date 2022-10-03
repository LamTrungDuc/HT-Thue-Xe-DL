using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.fonts.Models.Function
{
    public class TINTUCFunction
    {
        public class TinTucFunction
        {
            private MyDB context;
            public TinTucFunction()
            {
                context = new MyDB();
            }
            public IQueryable<TINTUC> TINTUCs
            {
                get { return context.TINTUCs; }
            }
            public int Insert(TINTUC model)
            {
                TINTUC dbEntry = context.TINTUCs.Find(model.ID_TIN);
                if (dbEntry != null)
                {
                    return 0;

                }
                context.TINTUCs.Add(model);
                context.SaveChanges();
                return 1;
            }
            public int Update(TINTUC model)
            {
                TINTUC dbEntry = context.TINTUCs.Find(model.ID_TIN);
                if (dbEntry == null)
                {
                    return 0;
                }
                dbEntry.tentin = model.tentin;
                dbEntry.ImgTin = model.ImgTin;
                dbEntry.mota = model.mota;
                context.SaveChanges();
                return 1;
            }
            public int Delete(TINTUC model)
            {
                TINTUC dbEntry = context.TINTUCs.Find(model.ID_TIN);
                if (dbEntry == null)
                {
                    return 0;
                }
                context.TINTUCs.Remove(dbEntry);
                context.SaveChanges();
                return 1;
            }
            public TINTUC FindEntity(int ID_TIN)
            {
                TINTUC dbEntry = context.TINTUCs.Find(ID_TIN);
                return dbEntry;
            }
        }
    }
}