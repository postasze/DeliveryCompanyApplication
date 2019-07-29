using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Controls;

namespace DeliveryCompanyApplication
{
    class mailValidator : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            DatabaseEntities dbContext = new DatabaseEntities();
            string text = (string)value;
            if (text.Equals(""))
                return new ValidationResult(false, "Pole nie może być puste");

            int mailQuantity = dbContext.KONTA.Count(login => login.MAIL == text);

            if (mailQuantity > 0)
                return new ValidationResult(false, "Podany adres e-mail istnieje już w bazie");

            return ValidationResult.ValidResult;
        }
    }
}


