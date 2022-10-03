using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.fonts.Models.Function
{
    public class TAIKHOANFunction
    {
        public class TaiKhoanFunction
        {
            private MyDB context;
            public TaiKhoanFunction()
            {
                context = new MyDB();
            }
            public IQueryable<TAIKHOAN> TAIKHOANs
            {
                get { return context.TAIKHOANs; }
            }
            public int Insert(TAIKHOAN model)
            {
                TAIKHOAN dbEntry = context.TAIKHOANs.Find(model.ID_TK);
                if (dbEntry != null)
                {
                    return 0;

                }
                context.TAIKHOANs.Add(model);
                context.SaveChanges();
                return 1;
            }
            public int Update(TAIKHOAN model)
            {
                TAIKHOAN dbEntry = context.TAIKHOANs.Find(model.ID_TK);
                if (dbEntry == null)
                {
                    return 0;
                }
                dbEntry.username = model.username;
                dbEntry.password = model.password;
                dbEntry.tentk = model.tentk;
                dbEntry.phone = model.phone;
                dbEntry.mail= model.mail;
                dbEntry.diachi = model.diachi;
                context.SaveChanges();
                return 1;
            }
            public int Delete(TAIKHOAN model)
            {
                TAIKHOAN dbEntry = context.TAIKHOANs.Find(model.ID_TK);
                if (dbEntry == null)
                {
                    return 0;
                }
                context.TAIKHOANs.Remove(dbEntry);
                context.SaveChanges();
                return 1;
            }
            public TAIKHOAN FindEntity(int ID_TK)
            {
                TAIKHOAN dbEntry = context.TAIKHOANs.Find(ID_TK);
                return dbEntry;
            }
        }
    }
}