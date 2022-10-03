using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.Models.Function
{
    public class BINHLUANFunction
    {
        public class BinhLuanFunction
        {
            private MyDB context;
            public BinhLuanFunction()
            {
                context = new MyDB();
            }
            public IQueryable<BINHLUAN> BINHLUANs
            {
                get { return context.BINHLUANs; }
            }
            public int Insert(BINHLUAN model)
            {
                BINHLUAN dbEntry = context.BINHLUANs.Find(model.ID_BL);
                if (dbEntry != null)
                {
                    return 0;

                }
                context.BINHLUANs.Add(model);
                context.SaveChanges();
                return 1;
            }
            public int Update(BINHLUAN model)
            {
                BINHLUAN dbEntry = context.BINHLUANs.Find(model.ID_BL);
                if (dbEntry == null)
                {
                    return 0;
                }
                //dbEntry.ID_BL = model.ID_BL;
                dbEntry.ID_SP = model.ID_SP;
                dbEntry.ID_TK = model.ID_TK;
                dbEntry.ngaybinhluan = model.ngaybinhluan;
                dbEntry.noidung = model.noidung;
                context.SaveChanges();
                return 1;
            }
            public int Delete(BINHLUAN model)
            {
                BINHLUAN dbEntry = context.BINHLUANs.Find(model.ID_BL);
                if (dbEntry == null)
                {
                    return 0;
                }
                context.BINHLUANs.Remove(dbEntry);
                context.SaveChanges();
                return 1;
            }
            public BINHLUAN FindEntity(int ID_BL)
            {
                BINHLUAN dbEntry = context.BINHLUANs.Find(ID_BL);
                return dbEntry;
            }
        }
    }
}