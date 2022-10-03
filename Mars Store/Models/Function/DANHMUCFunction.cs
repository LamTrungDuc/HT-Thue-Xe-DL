using Mars_Store.Models.Entities;
using Mars_Store.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.Models.Function
{
    public class DANHMUCFunction
    {
        public class DanhMucFunction
        {
            private MyDB context;
            public DanhMucFunction()
            {
                context = new MyDB();
            }
            public IQueryable<DANHMUC> DANHMUCs
            {
                get { return context.DANHMUCs; }
            }
            public int Insert(DANHMUC model)
            {
                DANHMUC dbEntry = context.DANHMUCs.Find(model.ID_DM);
                if (dbEntry != null)
                {
                    return 0;

                }
                context.DANHMUCs.Add(model);
                context.SaveChanges();
                return 1;
            }
            public int Update(DANHMUC model)
            {
                DANHMUC dbEntry = context.DANHMUCs.Find(model.ID_DM);
                if (dbEntry == null)
                {
                    return 0;
                }
                dbEntry.ID_DM = model.ID_DM;
                dbEntry.tendanhmuc = model.tendanhmuc;

                context.SaveChanges();
                return 1;
            }
            public int Delete(DANHMUC model)
            {
                DANHMUC dbEntry = context.DANHMUCs.Find(model.ID_DM);
                if (dbEntry == null)
                {
                    return 0;
                }
                context.DANHMUCs.Remove(dbEntry);
                context.SaveChanges();
                return 1;
            }
            public DANHMUC FindEntity(int ID_DM)
            {
                DANHMUC dbEntry = context.DANHMUCs.Find(ID_DM);
                return dbEntry;
            }
            public List<tblTinTucViewModel> DMTinTuc()
            {
                var model = (from a in context.NHOMTINs
                             join b in context.TINTUCs on a.ID_NHOM equals b.ID_NHOM
                             where (a.ID_NHOM != null)
                             select new tblTinTucViewModel
                             {
                                 //ID_NHOM = b.ID_NHOM,
                                 ID_TIN = b.ID_TIN,
                                 tennhomtin = a.tennhomtin,
                                 tentin = b.tentin,
                                 ImgTin = b.ImgTin,
                                 mota = b.mota,
                             });
                return model.ToList<tblTinTucViewModel>();
            }

        }
    }
}