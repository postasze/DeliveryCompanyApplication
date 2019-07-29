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
    /// Interaction logic for AddressDisplay.xaml
    /// </summary>
    public partial class AddressDisplay : Window
    {
        public AddressDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table ADRESY. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.ADRESYTableAdapter dataSet1ADRESYTableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.ADRESYTableAdapter();
            dataSet1ADRESYTableAdapter.Fill(dataSet1.ADRESY);
            System.Windows.Data.CollectionViewSource aDRESYViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("aDRESYViewSource")));
            aDRESYViewSource.View.MoveCurrentToFirst();
        }
    }
}
