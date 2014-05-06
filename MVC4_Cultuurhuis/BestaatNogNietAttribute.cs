using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVC4_Cultuurhuis
{
    public class BestaatNogNietAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value == null)
            {
                return true; 
            }
            if (!(value is string))
            {
                return false;
            }
            else
            {
                Services.CultuurService db = new Services.CultuurService();
                return !db.BestaatKlant((string)value);
            }
        }
    }
}