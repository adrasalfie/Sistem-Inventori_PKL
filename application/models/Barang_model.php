<?php
class Barang_model extends CI_Model
{
	// public function tampil_data()
	// {
	// 	return $this->db->get('barang')->result_array();

	// }

	public function tampil_data()
	{
		$this->db->select('barang.*, harga_pengajuan.harga_pengajuan');
		$this->db->from('barang');
		$this->db->join('harga_pengajuan', 'barang.id_barang = harga_pengajuan.id_barang', 'left');
		$query = $this->db->get();
		return $query->result_array();
	}

	public function get_all_barang()
	{
		$this->db->select('barang.*, harga_pengajuan.harga_pengajuan AS harga_pengajuan_harga');
		$this->db->from('barang');
		$this->db->join('harga_pengajuan', 'barang.id_barang = harga_pengajuan.id_barang'); // Assuming the join key is 'id_harga_pengajuan'
		$query = $this->db->get();

		if ($query === false) {
			log_message('error', 'SQL Query: ' . $this->db->last_query());
			log_message('error', 'Error Message: ' . print_r($this->db->error(), true));
			return false;
		}

		return $query->result();
	}


	public function get_all_permintaan()
	{
		$this->db->select('tanggal, kd_barang, nama_barang, kategori, satuan, jumlah, ruangan');
		return $this->db->get('permintaan')->result_array();
	}

	public function insert_barang($data)
	{
		$this->db->insert('barang', $data);
	}
	public function simpan()
	{
		$data = [

			"kd_barang" => $this->input->post('kd_barang'),
			"nama_barang" => $this->input->post('nama_barang'),
			"kategori" => $this->input->post('kategori'),
			"satuan" => $this->input->post('satuan'),
			"stok" => $this->input->post('stok'),
			"harga_satuan" => $this->input->post('harga_satuan'),
			"id_harga_pengajuan" => $this->input->post('id_harga_pengajuan'),

		];
		$this->session->set_flashData('message', '<div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Data Berhasil Ditambahkan</strong> 
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
		$this->db->insert('barang', $data);
	}

	public function hapus($id)
	{
		$this->db->where('id_barang', $id);
		$this->db->delete('barang');
		$this->session->set_flashData('message', '<div class="alert alert-warning alert-dismissible fade show" role="alert">
        <strong>Data Berhasil Dihapus</strong> 
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>');
	}

	public function ubah()
	{


		$data = [
			"kd_barang" => $this->input->post('kd_barang'),
			"nama_barang" => $this->input->post('nama_barang'),
			"kategori" => $this->input->post('kategori'),
			"satuan" => $this->input->post('satuan'),
			"stok" => $this->input->post('stok'),
			"harga_satuan" => $this->input->post('harga_satuan'),
		];
	
		// Memulai transaksi
		$this->db->trans_start();
	
		// Melakukan update
		$this->db->where('id_barang', $this->input->post('id'));
		$this->db->update('barang', $data);
	
		// Menyelesaikan transaksi
		$this->db->trans_complete();
	
		if ($this->db->trans_status() === FALSE) {
			// Jika transaksi gagal, ambil pesan kesalahan
			$error = $this->db->error();
	
			// Tampilkan pesan kesalahan menggunakan flashdata
			$this->session->set_flashdata('message', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
				<strong>Data Gagal Diupdate</strong> Error: ' . $error['message'] . '
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>');
		} else {
			// Jika transaksi berhasil, tampilkan pesan sukses
			$this->session->set_flashdata('message', '<div class="alert alert-primary alert-dismissible fade show" role="alert">
				<strong>Data Berhasil Diupdate</strong> 
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
				<span aria-hidden="true">&times;</span>
				</button>
			</div>');
		}
	
		// Redirect kembali ke halaman yang sesuai
		redirect('barang'); // Ganti dengan URL yang sesuai
	}

	public function get_id($id)
	{
		return $this->db->get_where('barang', ['id_barang' => $id])->row_array();
	}

	public function kurangi_stok_barang($id_barang, $jumlah)
	{
		$this->db->set('stok', 'stok - ' . $jumlah, FALSE);
		$this->db->where('id_barang', $id_barang);
		$this->db->update('barang');
	}

	public function tambah_stok_barang($id_barang, $jumlah)
	{
		$this->db->set('stok', 'stok + ' . $jumlah, FALSE);
		$this->db->where('id_barang', $id_barang);
		$this->db->update('barang');
	}


	public function get($id = null)
	{
		$this->db->select('*');
		$this->db->from('barang');
		if ($id != null) {
			$this->db->where('id_barang', $id);
		}
		return $this->db->get();
	}


	public function get_harga_pengajuan($id_barang)
	{
		$this->db->where('id_barang', $id_barang);
		$query = $this->db->get('id_harga_pengajuan');
		if ($query->num_rows() > 0) {
			return $query->row()->id_harga_pengajuan;
		}
		return 0;
	}

	public function update_harga_pengajuan($harga_pengajuan_input)
	{


		$query = $this->db->get('barang')->result();
		if (sizeof($query) > 0) {

			foreach ($query as $barang) {
				// Calculate the new harga_pengajuan
				$harga_satuan = $barang->harga_satuan;
				$harga_pengajuan = $harga_satuan * ($harga_pengajuan_input / 100) + $harga_satuan;

				$data = [
					'harga_pengajuan' => $harga_pengajuan
				];

				$this->db->where('id_barang', $barang->id_barang);
				$test = $this->db->get('harga_pengajuan')->result();

				if (sizeof($test) > 0) {
					$this->db->where('id_barang', $barang->id_barang);
					$this->db->update('harga_pengajuan', $data);
				} else {
					$this->db->insert('harga_pengajuan', $data);
				}
			}
		} else {
			log_message('error', 'Error fetching barang data');
		}
	}
}
