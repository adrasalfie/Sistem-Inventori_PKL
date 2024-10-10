<?php
class Permintaan_barang_model extends CI_Model
{
	
	public function tampil_data()
    {
		$this->db->select('*');
    $this->db->from('permintaan');
    $this->db->join('barang', 'permintaan.id_barang = barang.id_barang');
	$this->db->join('user', 'permintaan.id_user = user.id_user'); // Menggunakan left join untuk memastikan semua data anak ditampilkan
    $this->db->join('admin_ruangan', 'permintaan.id_ruangan = admin_ruangan.id_ruangan');
    $query = $this->db->get();
    return $query->result_array();
        
    }

	public function get_grouped_by_date() {
        $this->db->select('tanggal, id_user, COUNT(*) as jumlah_permintaan');
        $this->db->group_by(array('tanggal', 'id_user'));
        $query = $this->db->get('permintaan');
        return $query->result_array();
    }

	public function get_by_date_and_user($tanggal, $id_user) {
        $this->db->select('*');
        $this->db->from('permintaan p');
        $this->db->join('barang b', 'p.id_barang = b.id_barang', 'left');
        $this->db->join('user u', 'p.id_user = u.id_user', 'left');
		$this->db->join('admin_ruangan r', 'p.id_ruangan = r.id_ruangan', 'left');
        $this->db->where('p.tanggal', $tanggal);
        $this->db->where('p.id_user', $id_user);
        $query = $this->db->get();
        return $query->result_array();
    }
	
	public function insert($data) {
		var_dump($data);
		$this->db->insert('permintaan', $data);

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

	public function get_user_requests($user_id) {
        $this->db->where('id_user', $user_id);
        return $this->db->get('permintaan')->result();
    }

	public function create_request($data) {
        $this->db->insert('permintaan', $data);
    }

	public function update_status($id_permintaan, $status , $jumlah) {
        $data = array(
            'status' => $status,
			'jumlah' => $jumlah
        );
        $this->db->where('id_permintaan', $id_permintaan);
        $this->db->update('permintaan', $data);
    }

	public function get_jumlah_permintaan($id_permintaan) {
        $this->db->select('jumlah');
        $this->db->where('id_permintaan', $id_permintaan);
        $query = $this->db->get('permintaan');
        if ($query->num_rows() > 0) {
            return $query->row()->jumlah;
        }
        return 0; // Jika tidak ditemukan data atau ada kesalahan lainnya
    }

    public function get_id_barang($id_permintaan) {
        $this->db->select('id_barang');
        $this->db->where('id_permintaan', $id_permintaan);
        $query = $this->db->get('permintaan');
        if ($query->num_rows() > 0) {
            return $query->row()->id_barang;
        }
        return null; // Jika tidak ditemukan data atau ada kesalahan lainnya
    }


	public function get($id = null)

    {
        $this->db->select('*');
        $this->db->where('status', 'Approved');
        $this->db->from('permintaan');
        if($id != null)
        {
            $this->db->where('id_permintaan',$id);
        }
        return $this->db->get();
    }
	
}
