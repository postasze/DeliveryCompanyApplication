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
    /// Interaction logic for AccountDisplay.xaml
    /// </summary>
    public partial class AccountDisplay : Window
    {
        public AccountDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table KONTA. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.KONTATableAdapter dataSet1KONTATableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.KONTATableAdapter();
            dataSet1KONTATableAdapter.Fill(dataSet1.KONTA);
            System.Windows.Data.CollectionViewSource kONTAViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("kONTAViewSource")));
            kONTAViewSource.View.MoveCurrentToFirst();
        }
    }
}
