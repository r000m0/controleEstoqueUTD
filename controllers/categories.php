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
			$manager->insert_common("categorias", $_POST, null);
			header("location: ".$project_index."/admin.php?op=managerCategories");
		break;

		case 'edit':		
			unset($_POST['action']);
			$manager->update_common("categorias", $_POST, ['codCategoria'=>$_POST['codCategoria']],null);
			header("location: ".$project_index."/admin.php?op=managerCategories");
		break;

		case 'delete':
			$manager->delete_common("categorias", ['codCategoria'=>$_GET['id']],null);
			header("location: ".$project_index."/admin.php?op=managerCategories");
		break;
	}



?>