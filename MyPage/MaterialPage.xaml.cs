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

namespace Material.MyPage
{
    /// <summary>
    /// Логика взаимодействия для MaterialPage.xaml
    /// </summary>
    public partial class MaterialPage : Page
    {
        int _currentPage = 1;
        int _countInPage = 5;
        int _maxPage;
        public MaterialPage()
        {
            InitializeComponent();
            RefreshData();
            TbPerv.TextDecorations = TextDecorations.Underline;
            CBCort.Items.Insert(0, "Сортировка");
            CBCort.Items.Insert(1, "a-z");
            CBCort.Items.Insert(2, "z-a");
            var materialType = MyClass.ConnectDB.materialAgentEntities.MaterialType.ToList();
            materialType.Insert(0, new Model.MaterialType{
               Title = "Фильтрация" }
            );
            CBFilt.ItemsSource = materialType;
            CBCort.SelectedIndex = 0;
            CBFilt.SelectedIndex = 0;
            
        }
        private void RefreshData()
        {
            List<Model.Material> listmaterial = MyClass.ConnectDB.materialAgentEntities.Material.ToList();
            if (CBCort.SelectedIndex > 0 )
            {
                if(CBCort.SelectedIndex == 2)
                {
                    listmaterial.Reverse();
                }
                else
                {
                    listmaterial.Sort();
                }
            }
            if (CBFilt.SelectedIndex > 0)
            {
                listmaterial = listmaterial.Where(p => p.MaterialTypeID == CBFilt.SelectedIndex).ToList();
            }
           
            listmaterial = listmaterial.Where(p => p.Title.ToLower().Contains(TBPois.Text.ToLower())).ToList();

            TBNaim.Text = listmaterial.Count + " наименований";
            double sum = (int)Math.Ceiling( listmaterial.Sum(x => x.Price * Convert.ToDouble(x.CountInStock)));
            TBSumm.Text = $"Запасов на сумму: {sum} руб.";

            _maxPage = (int)Math.Ceiling(listmaterial.Count*1.0 / _countInPage);
            listmaterial = listmaterial.Skip((_currentPage - 1) * _countInPage).Take(_countInPage).ToList();


            if (_currentPage > 1 && _currentPage < _maxPage-1)
            {
                TbPerv.Text = (_currentPage - 1).ToString();
                TbBtoro.Text = (_currentPage).ToString();
                TbTreti.Text = (_currentPage + 1).ToString();
                TbChet.Text = (_currentPage + 2).ToString();
                TbBtoro.TextDecorations = TextDecorations.Underline;
            }
            LV.ItemsSource = listmaterial.ToList();
        }

        private void CbrosUnderline()
        {
            TbPerv.TextDecorations = null;
            TbBtoro.TextDecorations = null;
            TbTreti.TextDecorations = null;
            TbChet.TextDecorations = null;
        }

        private void TbNazad_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (_currentPage > 1)
            {
                _currentPage--;
                RefreshData(); 
            }
        }

        private void TbVpered_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (_currentPage < _maxPage)
            {
                _currentPage++;
                RefreshData();
            }
        }

        private void TbPerv_MouseDown(object sender, MouseButtonEventArgs e)
        {
            CbrosUnderline();
            _currentPage = Convert.ToInt32(TbPerv.Text);
            RefreshData();
            if (_currentPage == 1)
            {
                TbPerv.TextDecorations = TextDecorations.Underline;
            }
        }

        private void TbBtoro_MouseDown(object sender, MouseButtonEventArgs e)
        {
            CbrosUnderline();
            _currentPage = Convert.ToInt32(TbBtoro.Text);
            RefreshData();
        }

        private void TbTreti_MouseDown(object sender, MouseButtonEventArgs e)
        {
            CbrosUnderline();
            _currentPage = Convert.ToInt32(TbTreti.Text);
            RefreshData();
            if (_currentPage == _maxPage-1)
            {
                TbTreti.TextDecorations = TextDecorations.Underline;
            }
        }

        private void TbChet_MouseDown(object sender, MouseButtonEventArgs e)
        {
            CbrosUnderline();
            _currentPage = Convert.ToInt32(TbChet.Text);
            RefreshData();
            if(_currentPage == _maxPage)
            {
                TbChet.TextDecorations = TextDecorations.Underline;
            }
        }

        private void CBCort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            RefreshData();
            
        }

        private void TBPois_TextChanged(object sender, TextChangedEventArgs e)
        {
            RefreshData();
        }

        private void Red_Click(object sender, RoutedEventArgs e)
        {
            MyClass.Manager.navFamer.Navigate(new MyPage.AddRedacMaterialPage((sender as Button).DataContext as Model.Material));
        }

        private void Ydal_Click(object sender, RoutedEventArgs e)
        {
            var delet = (sender as Button).DataContext as Model.Material;
            var supp = MyClass.ConnectDB.materialAgentEntities.Supplier.ToList();
            var material = MyClass.ConnectDB.materialAgentEntities.Material.ToList();
            if(MessageBox.Show($"Delete {delet.Title}", "Warning", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                MyClass.ConnectDB.materialAgentEntities.Material.Remove(delet);
                Model.Material gfd = new Model.Material();

                supp = supp.Where(p => p.ID == delet.ID).ToList();
                MyClass.ConnectDB.materialAgentEntities.Supplier.Remove(supp.FirstOrDefault());

                MyClass.ConnectDB.materialAgentEntities.SaveChanges();
                MessageBox.Show("Delete sucsecc");
                MyClass.ConnectDB.materialAgentEntities.ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                RefreshData();
            }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MyClass.Manager.navFamer.Navigate(new MyPage.AddRedacMaterialPage(null));
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            RefreshData();
        }
    }
}
