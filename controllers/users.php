<?php  

	ini_set("display_errors", 1);

	// Incluindo os arquivos necessários
	include_once dirname(__DIR__).'/models/config.php';
	include_once dirname(__DIR__).'/models/class/Connect.class.php';
	include_once dirname(__DIR__).'/models/class/Manager.class.php';

	$manager = new Manager;

	if(isset($_GET['action']) && $_GET['action'] == "delete"){
		$_POST['action'] = "delete";
	}


	switch ($_POST['action']) {
		
		case 'add':
			unset($_POST['action']);
			$_POST['usuarioSenha'] = sha1($_POST['usuarioSenha']);
			$manager->insert_common("usuarios", $_POST, null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;

		case 'edit':
			unset($_POST['action']);
			if($_POST['usuarioSenha'] == ""){
				unset($_POST['usuarioSenha']);
			}else{
				$_POST['usuarioSenha'] = sha1($_POST['usuarioSenha']);
			}		

			$manager->update_common("usuarios", $_POST, ['idUsuario'=>$_POST['idUsuario']],null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;

		case 'delete':
			$manager->delete_common("usuarios", ['idUsuario'=>$_GET['id']],null);
			header("location: ".$project_index."/admin.php?op=manager-users");
		break;
	}



?>