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
    /// Логика взаимодействия для AddRedacMaterialPage.xaml
    /// </summary>
    public partial class AddRedacMaterialPage : Page
    {
        private Model.Material _currentMaterial = new Model.Material();
        public AddRedacMaterialPage(Model.Material selectedMaterial)
        {
            InitializeComponent();
            if(selectedMaterial != null)
            {
                _currentMaterial = selectedMaterial;
            }
            var unit = MyClass.ConnectDB.materialAgentEntities.Unit.ToList();
            var type = MyClass.ConnectDB.materialAgentEntities.MaterialType.ToList();
            unit.Insert(0, new Model.Unit{
                Title = "Не выбран"
            });
            type.Insert(0, new Model.MaterialType
            {
                Title = "Не выбран"
            });

            CBUnit.ItemsSource = unit;
            CBUnit.SelectedIndex = 0;
            CBType.ItemsSource = type;
            CBType.SelectedIndex = 0;

            DataContext = _currentMaterial;
        }

        private void BTSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentMaterial.Title))
                errors.AppendLine("Title");
            if (_currentMaterial.CountInPack <= 0)
                errors.AppendLine("CountInPakc");
            if (CBUnit.SelectedIndex == 0)
                errors.AppendLine("Unit");
            if (_currentMaterial.MinCount <= 0)
                errors.AppendLine("MinCount");
            if (_currentMaterial.Cost <= 0)
                errors.AppendLine("Cost");
            if (CBType.SelectedIndex == 0)
                errors.AppendLine("Type");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            Model.Unit selectedUnit = (CBUnit.SelectedItem) as Model.Unit;
            Model.MaterialType selectedType = (CBType.SelectedItem) as Model.MaterialType;

            _currentMaterial.UnitID = selectedUnit.ID;
            _currentMaterial.MaterialTypeID = selectedType.ID;

            try
            {
                if (_currentMaterial.ID == 0)
                    MyClass.ConnectDB.materialAgentEntities.Material.Add(_currentMaterial);

                MyClass.ConnectDB.materialAgentEntities.SaveChanges();
                MessageBox.Show("save");
                MyClass.Manager.navFamer.GoBack();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
