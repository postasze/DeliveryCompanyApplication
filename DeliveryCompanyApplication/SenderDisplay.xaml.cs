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
    /// Interaction logic for SenderDisplay.xaml
    /// </summary>
    public partial class SenderDisplay : Window
    {
        public SenderDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table NADAWCY. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.NADAWCYTableAdapter dataSet1NADAWCYTableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.NADAWCYTableAdapter();
            dataSet1NADAWCYTableAdapter.Fill(dataSet1.NADAWCY);
            System.Windows.Data.CollectionViewSource nADAWCYViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("nADAWCYViewSource")));
            nADAWCYViewSource.View.MoveCurrentToFirst();
        }
    }
}
