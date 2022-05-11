using AuthorizationSrez.Entities;
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

namespace AuthorizationSrez
{
    /// <summary>
    /// Логика взаимодействия для wUser.xaml
    /// </summary>
    public partial class wUser : Window
    {
        Log _log;
        public wUser(Log log)
        {
            InitializeComponent();
            this.DataContext = log;
            _log = log;
            tbSurname.Text = log.Users.Surname;
            tbName.Text = log.Users.Name;
            tbMiddleName.Text = log.Users.MiddleName;
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow main = new MainWindow();
            this.Close();
            main.ShowDialog();
        }
    }
}
