using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Controls;

namespace DeliveryCompanyApplication
{
    class PostalCodeValidator : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            DatabaseEntities dbContext = new DatabaseEntities();
            string text = (string)value;
            int postalCode;

            if (text.Equals(""))
                return new ValidationResult(false, "Podaj kod pocztowy w formacie 00-000");

            if(text.Length > 6)
                return new ValidationResult(false, "Podaj kod pocztowy w formacie 00-000");

            if(text[2] != '-')
                return new ValidationResult(false, "Podaj kod pocztowy w formacie 00-000");

            if (int.TryParse(text.Substring(0, 2), out postalCode) == false)
                return new ValidationResult(false, "Podaj kod pocztowy w formacie 00-000");

            if (int.TryParse(text.Substring(3, 3), out postalCode) == false)
                return new ValidationResult(false, "Podaj kod pocztowy w formacie 00-000");
            
            return ValidationResult.ValidResult;
        }
    }
}
