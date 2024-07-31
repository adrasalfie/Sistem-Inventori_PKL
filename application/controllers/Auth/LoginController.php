<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class LoginController extends CI_Controller {

    public function __construct()
    {
        parent::__construct();
        // Load Dependencies
        $this->load->model('User_model'); // Adjust this line based on your actual model
    }

    public function index()
    {
        $data['title'] = 'Login';

        $this->form_validation->set_rules('username', 'Username', 'trim|required|alpha_numeric_spaces');
        $this->form_validation->set_rules('password', 'Password', 'trim|required|alpha_numeric_spaces');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('login');
        } else {
            $username = htmlspecialchars($this->input->post('username', TRUE));
            $password = htmlspecialchars($this->input->post('password', TRUE));

            $this->cek_login($username, $password);
        }
    }

    private function cek_login($username, $password)
    {
        $user = $this->db->get_where('user', ['username' => $username])->row_array();
        $admin = $this->db->get_where('admin', ['username' => $username])->row_array();
        $admin_pengajuan = $this->db->get_where('admin_pengajuan', ['username' => $username])->row_array();
	

        if ($user) {
            if (password_verify($password, $user['password'])) {
                $session = ['username' => $user['username'] , 'jabatan' => $user['jabatan']];
                $this->session->set_userdata($session);
                $this->session->set_flashdata('msg', '<div class="alert alert-primary" role="alert">Login berhasil!</div>');
                return redirect('home/home_user');
            } else {
                $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Username atau Password salah!</div>');
                return redirect('Auth/LoginController');
            }
        } elseif ($admin) {
            if (password_verify($password, $admin['password'])) {
                $session = ['username' => $admin['username'] , ['jabatan' => $admin['jabatan']]];
                $this->session->set_userdata($session);
                $this->session->set_flashdata('msg', '<div class="alert alert-primary" role="alert">Login berhasil!</div>');
                return redirect('home');
            } else {
                $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Username atau Password salah!</div>');
                return redirect('Auth/LoginController');
            }
        } elseif ($admin_pengajuan) {
            if (password_verify($password, $admin_pengajuan['password'])) {
                $session = ['username' => $admin_pengajuan['username'] , 'jabatan' => $admin_pengajuan['jabatan'] , 'email' => $admin_pengajuan['email']];
                $this->session->set_userdata($session);
                $this->session->set_flashdata('msg', '<div class="alert alert-primary" role="alert">Login berhasil!</div>');
                return redirect('home/home_admin_pengajuan');
            } else {
                $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Username atau Password salah!</div>');
                return redirect('Auth/LoginController');
            }
        } else {
            $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Username atau Password salah!</div>');
            return redirect('Auth/LoginController');
        }
    }

    public function forgotPassword()
    {
        $username = htmlspecialchars($this->input->post('username', TRUE));
        $admin = $this->db->get_where('admin', ['username' => $username])->row_array();

        if ($admin) {
            $token = bin2hex(random_bytes(32));
            $this->db->set('reset_token', $token);
            $this->db->set('token_created_at', date('Y-m-d H:i:s'));
            $this->db->where('username', $username);
            $this->db->update('admin');

            $reset_link = base_url('Auth/LoginController/resetPassword/' . $token);
            $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Please click <a href="' . $reset_link . '">this link</a> to reset your password.</div>');
        } else {
            $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Username not found.</div>');
        }

        return redirect('Auth/LoginController');
    }

    public function resetPassword($token = NULL)
    {
        if (!$token) {
            show_404();
        }

        $admin = $this->db->get_where('admin', ['reset_token' => $token])->row_array();

        if (!$admin) {
            $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Invalid password reset token.</div>');
            return redirect('Auth/LoginController');
        }

        // Redirect to ChangePasswordController with token
        redirect('Auth/ChangePasswordController/index/' . $token);
    }


    public function update_password()
    {
        $token = $this->input->post('token');
        $password = $this->input->post('password');

        $this->form_validation->set_rules('password', 'Password', 'required|min_length[6]');

        if ($this->form_validation->run() == FALSE) {
            $this->load->view('reset_password_form', ['token' => $token]);
        } else {
            $admin = $this->db->get_where('admin', ['reset_token' => $token])->row_array();

            if (!$admin) {
                $this->session->set_flashdata('msg', '<div class="alert alert-danger" role="alert">Token reset password tidak valid.</div>');
                return redirect('Auth/LoginController');
            }

            $this->db->set('password', password_hash($password, PASSWORD_DEFAULT));
            $this->db->set('reset_token', NULL);
            $this->db->where('username', $admin['username']);
            $this->db->update('admin');

            $this->session->set_flashdata('msg', '<div class="alert alert-success" role="alert">Password berhasil direset. Silakan login dengan password baru Anda.</div>');
            return redirect('Auth/LoginController');
        }
    }
}
?>
