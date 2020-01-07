using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TrenRezervasyon.DAL;
using TrenRezervasyon.Entitiy;

namespace TrenRezervasyon
{
    public partial class AdminForm : Form
    {

        public AdminForm()
        {
            InitializeComponent();
            TrenleriDoldur();
            GuzergahDoldur();
            RezervasyonDoldur();
            dateTimePicker1.Format = DateTimePickerFormat.Custom;
            dateTimePicker1.CustomFormat = "dd:MM:yyyy hh:mm:ss";
            dateTimePicker1.MinDate = DateTime.Now;
        }
        public void RezervasyonDoldur()
        {
            List<Koltuk> koltuks = HelperKoltuk.GetListKoltuk();
            dataGridView1.Rows.Clear();
            foreach (var item in koltuks)
            {
                if (item.durum==false)
                {
                    dataGridView1.Rows.Add($"{item.KoltukID}", $"{item.adi}", $"{item.soyadi}", $"{item.tcno}", $"{item.telefon}");
                }
            }

        }

        private void AdminForm_Load(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            comboBox3.Items.Clear();
            if (comboBox2.SelectedIndex == 1)
            {
                comboBox3.Items.Add("İSTANBUL");
            }
            else
            {
                comboBox3.Items.Add("ANKARA");
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            this.Hide();
            Form1 f = new Form1();
            f.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Sefer g = new Sefer();
            g.seferTarihi = dateTimePicker1.Value;
            g.seferYonu = comboBox2.Text;
            g.varisYonu = comboBox3.Text;
            g.TrenID = HelperTren.GetTrenIDByName(comboBox1.Text);
            g.durum = true;

            var f1 = HelperTren.GetTrenByName(comboBox1.Text);

            var f = HelperSefer.Add(g);
            if (f.Item2)
            {
                MessageBox.Show("Seferiniz Başarı İle Eklenmiştir!");
            }
            else
            {
                MessageBox.Show("Eklenmede Hata Oluştu!");
            }
            for (int i = 0; i < f1.koltukSayisi; i++)
            {
                Koltuk k = new Koltuk();
                k.TrenID = f1.TrenID;
                k.durum = true;
                HelperKoltuk.Add(k);
            }
            GuzergahDoldur();
        }
        public void TrenleriDoldur()
        {
            List<Tren> trenler = HelperTren.GetListTrens();

            comboBox1.Items.Clear();

            foreach (var item in trenler)
            {
                comboBox1.Items.Add(item.trenAdi);
            }
        }
        public void GuzergahDoldur()
        {
            List<Sefer> guzergahs = HelperSefer.GetSeferList();

            dataGridView2.Rows.Clear();

            foreach (var item in guzergahs)
            {
                if (item.durum)
                {
                    dataGridView2.Rows.Add($"{item.SeferID}", $"{item.seferYonu}", $"{item.varisYonu}", $"{item.seferTarihi}");

                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var f = MessageBox.Show("Bu seferi silmek istediginize emin misiniz?", "Bilgilendirme", MessageBoxButtons.YesNo, MessageBoxIcon.Information);
            if (f == DialogResult.Yes)
            {
                Sefer g = HelperSefer.GetSeferByID(Convert.ToInt32(dataGridView2.Rows[dataGridView2.CurrentRow.Index].Cells[0].Value));
                g.durum = false;
                var t = HelperSefer.Update(g);
                if (t.Item2)
                {
                    MessageBox.Show("Sefer Kaldırıldı.");
                }
                else
                {
                    MessageBox.Show("Sefer Kaldırılamadı! Bir sorunla karşılaşıldı.");

                }
                GuzergahDoldur();
            }
            else
            {
                MessageBox.Show("Silme işlemi iptal edildi");
            }
            GuzergahDoldur();
            
        }

        private void button4_Click(object sender, EventArgs e)
        {
            List<Tren> trenler = HelperTren.GetListTrens();
            foreach (var item in trenler)
            {
                if (item.trenAdi.ToLower().Contains(textBox1.Text.ToLower()))
                {
                    if (item.trenAdi == textBox1.Text)
                    {
                        MessageBox.Show("Böyle bir tren adı bulunmakta! Başka bir tren giriniz!");
                        this.Close();
                    }
                }
            }
            Tren t = new Tren();
            t.trenAdi = textBox1.Text;
            t.koltukSayisi = 100;
            var f = HelperTren.Add(t);
            if (f.Item2)
            {
                MessageBox.Show("Treniniz Eklenmiştir");
            }
            else
            {
                MessageBox.Show("Eklenmede Hata Oluştu");
            }
            TrenleriDoldur();
        }
    }
}
