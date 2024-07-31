<?php
class Pengajuan_barang_model extends CI_Model
{

	public function insert($data)
	{
		// Insert data into the 'pengajuan' table
		var_dump($data);
		$this->db->insert('pengajuan', $data);

		$error = $this->db->error();
		if (!empty($error['code'])) {
			// Display error message as JSON
			echo json_encode([
				'status' => 'error',
				'message' => $error['message']
			]);
		} else {
			// Display success message as JSON
			echo json_encode([
				'status' => 'success',
				'message' => 'Data inserted successfully'
			]);
		}
	}


	public function tampil_data()
	{
		$this->db->select('*');
		$this->db->from('pengajuan');
		$this->db->join('barang', 'pengajuan.id_barang = barang.id_barang');
		$this->db->join('admin_ruangan', 'pengajuan.id_ruangan = admin_ruangan.id_ruangan');

		// $this->db->join('user', 'pengajuan.id_user = user.id_user');
		$query = $this->db->get();
		return $query->result_array();
	}



	public function update_pengajuan($id_pengajuan, $data)
	{
		$this->db->where('id_pengajuan', $id_pengajuan);
		return $this->db->update('pengajuan', $data);
	}

	public function insert_barang_masuk($data_barang_masuk)
	{

		$this->db->insert('barang_masuk', $data_barang_masuk);

		$this->db->set('stok', 'stok + ' . $data_barang_masuk['jumlah'], FALSE);
		$this->db->where('id_barang', $data_barang_masuk['id_barang']);
		return $this->db->update('barang');
	}




	public function get_grouped_by_date()
	{
		$this->db->select('tanggal, id_user, COUNT(*) as jumlah_pengajuan');
		$this->db->group_by(array('tanggal', 'id_user'));
		$query = $this->db->get('pengajuan');
		return $query->result_array();
	}

	public function get_by_date_and_user($tanggal, $id_user)
	{
		$this->db->select('p.tanggal, b.kd_barang, b.nama_barang, b.kategori, b.satuan, p.jumlah, p.total_harga, r. id_ruangan, p.status , r.ruangan' );
		$this->db->from('pengajuan p');
		$this->db->join('barang b', 'p.id_barang = b.id_barang', 'left');
		$this->db->join('user u', 'p.id_user = u.id_user', 'left');
		$this->db->join('admin_ruangan r', 'p.id_ruangan = r.id_ruangan', 'left');
		$this->db->where('p.tanggal', $tanggal);
		$this->db->where('p.id_user', $id_user);
		$query = $this->db->get();
		return $query->result_array();
	}

	public function get_user_requests($user_id)
	{
		$this->db->where('id_user', $user_id);
		return $this->db->get('pengajuan')->result();
	}

	public function create_request($data)
	{
		$this->db->insert('pengajuan', $data);
	}

	public function update_status($id_pengajuan, $status)
	{
		$data = array(
			'status' => $status
		);
		$this->db->where('id_pengajuan', $id_pengajuan);
		$this->db->update('pengajuan', $data);
	}

	public function get_jumlah_pengajuan($id_pengajuan)
	{
		$this->db->select('jumlah');
		$this->db->where('id_pengajuan', $id_pengajuan);
		$query = $this->db->get('pengajuan');
		if ($query->num_rows() > 0) {
			return $query->row()->jumlah;
		}
		return 0;
	}

	public function get_id_barang($id_pengajuan)
	{
		$this->db->select('id_barang');
		$this->db->where('id_pengajuan', $id_pengajuan);
		$query = $this->db->get('pengajuan');
		if ($query->num_rows() > 0) {
			return $query->row()->id_barang;
		}
		return null;
	}


	public function get_approved_total()
	{
		$this->db->select_sum('total_harga');
		$this->db->where('status', 'Approved');
		$query = $this->db->get('pengajuan');
		return $query->row()->total_harga;
	}

	public function get($id = null)

	{
		$this->db->select('*');
		$this->db->where('status', 'Approved');
		$this->db->from('pengajuan');
		if ($id != null) {
			$this->db->where('id_pengajuan', $id);
		}
		return $this->db->get();
	}

	public function get_total_per_month()
	{
		$this->db->select('MONTH(tanggal) as month, SUM(total_harga) as total');
		$this->db->where('status', 'Approved');
		$this->db->group_by('MONTH(tanggal)');
		$this->db->where('YEAR(tanggal)', date('Y')); // Data untuk tahun ini
		$query = $this->db->get('pengajuan');
		return $query->result_array();
	}
}
