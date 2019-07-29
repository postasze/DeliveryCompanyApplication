using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace DeliveryCompanyApplication
{
    /// <summary>
    /// Interaction logic for LogInWindow.xaml
    /// </summary>
    public partial class LogInWindow : Window
    {
        DatabaseEntities dbContext;

        public int accountType
        {
            get;
            set;
        }

        public String login
        {
            get;
            set;
        }

        public String inputPassword
        {
            get;
            set;
        }

        public LogInWindow(int accountType)
        {
            InitializeComponent();
            this.accountType = accountType;
            this.DataContext = this;
        }

        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            dbContext = new DatabaseEntities();
            inputPassword = PasswordBox.Password;

            if(dbContext.KONTA.Any<KONTA>(account => account.NICK == this.login &&
                account.HASŁO == this.inputPassword && account.TYP_KONTA == this.accountType))
            {
                DialogResult = true;
                this.Close();                
            }
            else
            {
                MessageBox.Show("Podany login, hasło, lub typ konta jest nieprawidłowy");
                return;
            }
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
