using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.Models.Function
{
    public class KHOANGGIAFunction
    {
        private MyDB context;
        public KHOANGGIAFunction()
        {
            context = new MyDB();
        }

        public IQueryable<KHOANGGIA> KHOANGGIAs
        {
            get { return context.KHOANGGIAs; }
        }
        public KHOANGGIA FindEntity(int IDKG)
        {
            KHOANGGIA dbEntry = context.KHOANGGIAs.Find(IDKG);
            return dbEntry;
        }

        public int Insert(KHOANGGIA model)
        {
            KHOANGGIA dbEntry = context.KHOANGGIAs.Find(model.IDKG);
            if (dbEntry != null)
            {
                return -1;

            }
            context.KHOANGGIAs.Add(model);
            context.SaveChanges();
            return model.IDKG;
        }
        public int Update(KHOANGGIA model)
        {
            KHOANGGIA dbEntry = context.KHOANGGIAs.Find(model.IDKG);
            if (dbEntry == null)
            {
                return -1;
            }
            dbEntry.IDKG = model.IDKG;
            dbEntry.cantren = model.cantren;
            dbEntry.canduoi = model.canduoi;

            context.SaveChanges();
            return model.IDKG;
        }
        public int Delete(KHOANGGIA model)
        {
            KHOANGGIA dbEntry = context.KHOANGGIAs.Find(model.IDKG);
            if (dbEntry != null)
            {
                context.KHOANGGIAs.Remove(dbEntry);
                context.SaveChanges();
            }
            return model.IDKG;
        }
    }
}