<?php  

	function validate_options(){

		if(!isset($_GET['op'])){
			return false;
		}

		// Incluindo os arquivos necessários
		include_once dirname(__DIR__).'/models/class/Connect.class.php';
		include_once dirname(__DIR__).'/models/class/Manager.class.php';

		switch($_GET['op']){

			case 'manager-users':
				$manager = new Manager;
				$users = $manager->select_common("usuarios", null,null,null);
				include_once $GLOBALS['project_path'].'/views/users/manager-users.html';
			break;

			case 'insert-user':
				include_once $GLOBALS['project_path'].'/views/users/insert-user.html';
			break;

			case 'edit-user':
				$manager = new Manager;
				$user = $manager->select_common("usuarios", null,['idUsuario'=>$_GET['id']],null);		
				include_once $GLOBALS['project_path'].'/views/users/edit-user.html';
			break;

			case 'insertCategories':
				include_once $GLOBALS['project_path'].'views/categories/insertCategories.html';
			break;

			case'managerCategories':
				$manager = new Manager;
				$category = $manager->select_common("categorias",null,null,null);
				include_once $GLOBALS['project_path'].'views/categories/managerCategories.html';
			break;

			case'editCategories':
				$manager = new Manager;
				$category = $manager->select_common("categorias",null,['codCategoria'=>$_GET['id']],null);
				include_once $GLOBALS['project_path'].'views/categories/editCategories.html';
			break;
			
			case 'insertCities':
				include_once $GLOBALS['project_path'].'views/cities/insertCities.html';
			break;

			case'managerCities':
				$manager = new Manager;
				$cities = $manager->select_common("cidades",null,null,null);
				include_once $GLOBALS['project_path'].'views/cities/managerCities.html';
			break;

			case'editCities':
				$manager = new Manager;
				$cities = $manager->select_common("cidades",null,['codCidade'=>$_GET['id']],null);
				include_once $GLOBALS['project_path'].'views/cities/editCities.html';
			break;

			case'insertProducts':
				include_once $GLOBALS['project_path'].'views/products/insertProducts.html';
			break;

			case 'managerProducts':
				$manager = new Manager;
				$product = $manager->select_common("produtos",null,null,null);
				include_once $GLOBALS['project_path'].'views/products/managerProducts.html';
			break;

			case 'editProducts':
				$manager = new Manager;
				$product = $manager->select_common("produtos",null,['codProduto'=>$_GET['id']],null);
				include_once $GLOBALS['project_path'].'views/products/editProducts.html';
			break;

			case 'insertSuppliers':
				include_once $GLOBALS['project_path']."views/suppliers/insertSuppliers.html";
			break;

			case 'managerSuppliers':
				$manager = new Manager();
				$supply = $manager->select_common('fornecedores',null,null,null);
				include_once $GLOBALS['project_path']."views/suppliers/managerSuppliers.html";
			break;

			case'editSuppliers':
				$manager = new Manager;
				$supply = $manager->select_common("fornecedores",null,['codFornecedor'=>$_GET['id']],null);
				include_once $GLOBALS['project_path'].'views/suppliers/editSuppliers.html';
			break;

		}

	}



?>