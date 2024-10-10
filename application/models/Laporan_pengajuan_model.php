<?php
class Laporan_pengajuan_model extends CI_Model{

    

	public function get_approved_pengajuan($tgl_mulai, $tgl_akhir)
    {
        $this->db->select('pengajuan.tanggal, barang.kd_barang, barang.nama_barang, barang.kategori, barang.satuan, barang.harga_satuan, pengajuan.jumlah, pengajuan.total_harga , pengajuan.status , harga_pengajuan.harga_pengajuan');
        $this->db->from('pengajuan');
        $this->db->join('barang', 'pengajuan.id_barang = barang.id_barang');
        $this->db->join('harga_pengajuan', 'barang.id_barang = harga_pengajuan.id_barang');
        $this->db->where('pengajuan.status', 'Approved');
        $this->db->where('pengajuan.tanggal >=', $tgl_mulai);
        $this->db->where('pengajuan.tanggal <=', $tgl_akhir);
        return $this->db->get()->result_array();
    }
}
