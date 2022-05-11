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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace AuthorizationSrez
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Image_MouseEnter(object sender, MouseEventArgs e)
        {
            tbPassword.Text = pbPassword.Password;
            pbPassword.Visibility = Visibility.Hidden;
            tbPassword.Visibility = Visibility.Visible;
        }

        private void Image_MouseLeave(object sender, MouseEventArgs e)
        {
            tbPassword.Visibility = Visibility.Hidden;
            pbPassword.Visibility = Visibility.Visible;
        }

        private void btnEnter_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var currentUser = ConnectDB.db.Log.Where(c=>c.Login == tbLogin.Text && c.Password == pbPassword.Password).ToList().FirstOrDefault();
                if (currentUser != null)
                {
                    wUser user = new wUser(currentUser);
                    this.Close();
                    user.ShowDialog();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("Введен неверно логин или прароль!");
            }
        }

        private void btnBackUp_Click(object sender, RoutedEventArgs e)
        {
            wBackUp backUp = new wBackUp();
            backUp.ShowDialog();
        }

        private void btnReg_Click(object sender, RoutedEventArgs e)
        {
            wRegistration reg = new wRegistration();
            this.Close();
            reg.ShowDialog();
        }
    }
}
