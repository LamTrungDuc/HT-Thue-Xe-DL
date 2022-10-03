using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.fonts.Models.Function
{
    public class SPGIAMGIAFunction
    {
        private MyDB context;
        public SPGIAMGIAFunction()
        {
            context = new MyDB();
        }

        public IQueryable<SPGIAMGIA> SPGIAMGIAs
        {
            get { return context.SPGIAMGIAs; }
        }
        public SPGIAMGIA FindEntity(int Mahang)
        {
            SPGIAMGIA dbEntry = context.SPGIAMGIAs.Find(Mahang);
            return dbEntry;
        }

        public int Insert(SPGIAMGIA model)
        {
            SPGIAMGIA dbEntry = context.SPGIAMGIAs.Find(model.ID_KM);
            if (dbEntry != null)
            {
                return -1;

            }
            context.SPGIAMGIAs.Add(model);
            context.SaveChanges();
            return model.ID_SP;
        }
        public int Update(SPGIAMGIA model)
        {
            SPGIAMGIA dbEntry = context.SPGIAMGIAs.Find(model.ID_KM);
            if (dbEntry == null)
            {
                return -1;
            }
            dbEntry.ID_SP = model.ID_SP;
            dbEntry.soluong = model.soluong;
            //dbEntry.ID_SP = model.ID_SP;
            dbEntry.giaht = model.giaht;
            dbEntry.ngayban = model.ngayban;
            context.SaveChanges();
            return model.ID_KM;
        }
        public int Delete(SPGIAMGIA model)
        {
            SPGIAMGIA dbEntry = context.SPGIAMGIAs.Find(model.ID_KM);
            if (dbEntry != null)
            {
                context.SPGIAMGIAs.Remove(dbEntry);
                context.SaveChanges();
            }
            return model.ID_KM;
        }
    }
}