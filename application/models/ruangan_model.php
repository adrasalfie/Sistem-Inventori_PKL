<?php
class ruangan_model extends CI_Model
{
	public function get_ruangan()
	{
		return $this->db->get('admin_ruangan')->result_array();
	}
}
