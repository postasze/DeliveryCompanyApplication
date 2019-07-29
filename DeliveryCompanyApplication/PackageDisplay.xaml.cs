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
    /// Interaction logic for PackageDisplay.xaml
    /// </summary>
    public partial class PackageDisplay : Window
    {
        public PackageDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table PACZKI. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.PACZKITableAdapter dataSet1PACZKITableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.PACZKITableAdapter();
            dataSet1PACZKITableAdapter.Fill(dataSet1.PACZKI);
            System.Windows.Data.CollectionViewSource pACZKIViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("pACZKIViewSource")));
            pACZKIViewSource.View.MoveCurrentToFirst();
        }
    }
}
