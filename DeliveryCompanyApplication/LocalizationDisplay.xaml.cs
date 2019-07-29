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
    /// Interaction logic for LocalizationDisplay.xaml
    /// </summary>
    public partial class LocalizationDisplay : Window
    {
        public LocalizationDisplay()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {

            DeliveryCompanyApplication.DataSet1 dataSet1 = ((DeliveryCompanyApplication.DataSet1)(this.FindResource("dataSet1")));
            // Load data into the table LOKALIZACJE. You can modify this code as needed.
            DeliveryCompanyApplication.DataSet1TableAdapters.LOKALIZACJETableAdapter dataSet1LOKALIZACJETableAdapter = new DeliveryCompanyApplication.DataSet1TableAdapters.LOKALIZACJETableAdapter();
            dataSet1LOKALIZACJETableAdapter.Fill(dataSet1.LOKALIZACJE);
            System.Windows.Data.CollectionViewSource lOKALIZACJEViewSource = ((System.Windows.Data.CollectionViewSource)(this.FindResource("lOKALIZACJEViewSource")));
            lOKALIZACJEViewSource.View.MoveCurrentToFirst();
        }
    }
}
