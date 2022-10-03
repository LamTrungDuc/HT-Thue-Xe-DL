using Mars_Store.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mars_Store.Models.Function
{
    public class AccountModel
    {
        private MyDB context;
        public AccountModel()
        {
            context = new MyDB();
        }

        public Account Login(string username, string pass)
        {
            var model = (from a in context.QUYENs
                         join b in context.PHANQUYENs
                         on a.TENQUYEN equals b.TENQUYEN
                         where (a.TENQUYEN != null && b.TENQUYEN.Equals(username))
                         select a.TENQUYEN);
            var result = (from a in context.TAIKHOANs
                          where (a.username.Equals(username) && a.password.Equals(pass))
                          select new Account
                          {
                              ID_TK = a.ID_TK,
                              UserName = a.username,
                              Password = a.password,
                              Quyen = model.ToList()
                          }).FirstOrDefault();
            Account t = result;
            return result;
        }


        public Account Find(string username)
        {
            var model = (from a in context.QUYENs
                         join b in context.PHANQUYENs
                         on a.TENQUYEN equals b.TENQUYEN
                         where (a.TENQUYEN != null && b.TENQUYEN.Equals(username))
                         select a.TENQUYEN);
            var result = (from a in context.TAIKHOANs
                          where (a.username.Equals(username))
                          select new Account
                          {
                              ID_TK = a.ID_TK,
                              UserName = a.username,
                              Password = a.password,
                              Quyen = model.ToList()
                          }).FirstOrDefault();
            return result;
        }
    }
}