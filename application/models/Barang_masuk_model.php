<?php
class Barang_masuk_model extends CI_Model
{
	

	public function tampil_data()
    {
		$this->db->select('*');
    $this->db->from('barang_masuk');
    $this->db->join('barang', 'barang_masuk.id_barang = barang.id_barang');
		$this->db->join('pengajuan' , 'barang.id_barang = pengajuan.id_barang' );
		$this->db->join('admin_ruangan' , 'pengajuan.id_ruangan = admin_ruangan.id_ruangan' );

    $query = $this->db->get();
    return $query->result_array();
        
    }

	public function simpan()
    {
        $data = [

			"tgl_masuk" => $this->input->post('tgl_masuk'),
            "id_barang" => $this->input->post('id_barang'),
            "jumlah" => $this->input->post('jumlah'),
            "ruangan" => $this->input->post('ruangan'),
            
            
        ];
        $this->session->set_flashData('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Data Berhasil Ditambahkan</strong> 
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
        $this->db->insert('barang_masuk', $data);
    }

	public function get_barang_details($id_barang)
    {
        $query = $this->db->select('id_barang, kd_barang, nama_barang, kategori, satuan,stok, harga_satuan, id_harga_pengajuan')
                          ->from('barang')
                          ->where('id_barang', $id_barang)
                          ->get();
        
        return $query->row_array();
    }

    public function search_barang($term) {
      $term = is_null($term) ? '' : $term; // Default to empty string if null
      $term = $this->db->escape_like_str($term);

      if ($term === '') {
          $query = $this->db->get('barang_masuk'); // Fetch all records if search is empty
      } else {
          $this->db->like('nama_barang', $term);
          $this->db->or_like('kd_barang', $term);
          $query = $this->db->select('id_barang as id, kd_barang, CONCAT(kd_barang, " - ", nama_barang) as text, kategori, satuan, stok, harga_satuan, id_harga_pengajuan')
                            ->from('barang')
                            ->get();
      }
      
      return $query->result_array();
  }
  

	public function hapus($id)
    {
        $this->db->where('id_barang_masuk', $id);
        $this->db->delete('barang_masuk');
        $this->session->set_flashData('message', '<div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Data Berhasil Dihapus</strong> 
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
    }
	
}
