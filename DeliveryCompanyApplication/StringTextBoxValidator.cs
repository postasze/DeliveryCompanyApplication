using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Globalization;
using System.Windows.Controls;

namespace DeliveryCompanyApplication
{
    class StringTextBoxValidator : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo cultureInfo)
        {
            string text = (string)value;
            if(text.Equals(""))
                return new ValidationResult(false, "Pole nie może być puste");
            else
                return ValidationResult.ValidResult;
        }
    }
}


