using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows;

namespace DeliveryCompanyApplication
{
    public class LoginCommand : ICommand
    {
        DatabaseEntities dbContext;

        public event EventHandler CanExecuteChanged;

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public void Execute(object parameter)
        {
            KONTA konto = (KONTA)parameter;
            dbContext = new DatabaseEntities();

            if (dbContext.KONTA.Any<KONTA>(account => account.NICK == konto.NICK &&
                account.HASŁO == konto.HASŁO && account.TYP_KONTA == konto.TYP_KONTA))
            {
                //DialogResult = true;
                //this.Close();
            }
            else
            {
                MessageBox.Show("Podany login, hasło, lub typ konta jest nieprawidłowy");
                return;
            }
        }
    }
}