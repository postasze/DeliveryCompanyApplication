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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace DeliveryCompanyApplication
{
    /// <summary>
    /// Interaction logic for IntroWindow.xaml
    /// </summary>
    public partial class IntroWindow : Window
    {
        public IntroWindow()
        {
            InitializeComponent();
            DatabaseEntities dbContext = new DatabaseEntities();
            //dbContext.Database.ExecuteSqlCommand("delete from Pracownicy where id_pracownika = 101");
            //dbContext.Database.ExecuteSqlCommand("delete from Adresy where id_adresu = 101");
            //dbContext.Database.ExecuteSqlCommand("delete from Konta where id_konta = 201");
        }


        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
        }


        private void RegistrationButtonClicked(object sender, RoutedEventArgs e)
        {
            RegistrationWindow registrationWindow = new RegistrationWindow();
            registrationWindow.ShowDialog();
        }

        private void LogInButtonClicked(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow(3);
            logInWindow.ShowDialog();
            if (logInWindow.DialogResult.HasValue && logInWindow.DialogResult.Value == true)
            {
                
            }
        }

        private void LogInButton2Clicked(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow(2);
            logInWindow.ShowDialog();
            if (logInWindow.DialogResult.HasValue && logInWindow.DialogResult.Value == true)
            {

            }
        }

        private void LogInButton3Clicked(object sender, RoutedEventArgs e)
        {
            LogInWindow logInWindow = new LogInWindow(1);
            logInWindow.ShowDialog();
            if (logInWindow.DialogResult.HasValue && logInWindow.DialogResult.Value == true)
            {
                AdministatorMDIPanel administratorMDIPanel = new AdministatorMDIPanel();
                administratorMDIPanel.Show();
            }
        }

        private void DeliveryTrackingButtonClicked(object sender, RoutedEventArgs e)
        {
            DeliveryTrackingWindow deliveryTrackingWindow = new DeliveryTrackingWindow();
            deliveryTrackingWindow.ShowDialog();
        }
    }
}
