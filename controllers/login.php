<?php  
	
	ini_set("display_errors", 1);
	error_reporting(E_ALL | E_WARNING);


	// Incluindo os arquivos necessários
	include_once dirname(__DIR__).'/models/class/Connect.class.php';
	include_once dirname(__DIR__).'/models/class/Manager.class.php';

	// Recebendo os dados do formulário
	$email = $_POST['email'];
	$pass = $_POST['password'];

	// Instanciando o objeto do tipo Manager
	$manager = new Manager;

	// Testando o login
	$log = $manager->select_common("usuarios",null,['usuarioEmail'=>$email], " LIMIT 1");

	if(!$log){
		header("location: ../index.php?error=user_not_found");
	}elseif($log[0]['usuarioSenha'] != sha1($pass)){
		header("location: ../index.php?error=password_incorrect");
	}else{
		session_start();
		$_SESSION[md5("user_data")] = $log[0];
		header("location: ../index.php");
	}



?>