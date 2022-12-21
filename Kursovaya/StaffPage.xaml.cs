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

namespace Kursovaya
{
    /// <summary>
    /// Логика взаимодействия для StaffPage.xaml
    /// </summary>
    public partial class StaffPage : Page
    {
        
        public StaffPage()
        {
            InitializeComponent();
            LV.ItemsSource = KursovayaEntities.GetContext().Staffs.ToList();
        }

        private void CreateStaff_Click(object sender, RoutedEventArgs e)
        {
            ClassPage.MainFrame.Navigate(new CreateStaff(null));
        }

        private void UpdateStaff_Click(object sender, RoutedEventArgs e)
        {
            var _staff = (sender as Button).DataContext as Staff;
            ClassPage.MainFrame.Navigate(new CreateStaff(_staff));
        }

        private void DeleteStaff_Click(object sender, RoutedEventArgs e)
        {
            var _staff = (sender as Button).DataContext as Staff;
            KursovayaEntities.GetContext().Staffs.Remove(_staff);
            KursovayaEntities.GetContext().SaveChanges();
            (LV.ItemsSource as List<Staff>).Remove(_staff);
            LV.Items.Refresh();
            MessageBox.Show("Сотрудник удален!");
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                KursovayaEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                LV.ItemsSource = KursovayaEntities.GetContext().Staffs.ToList();
            }
        }
    }
}
