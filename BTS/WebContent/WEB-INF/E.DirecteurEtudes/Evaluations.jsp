<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
  	<title>Evaluations</title>
  	
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dataTables.bootstrap.css" type="text/css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstap.min.css" type="text/css" >
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.min.css" type="text/css" >
		
	<style type="text/css">
	body{
			background-color:#fff;
		}
	/***************** Modal confirm **********************/
	.modal-confirm {		
		color: #636363;
		width: 325px;
	}
	.modal-confirm .modal-content {
		padding: 20px;
		border-radius: 5px;
		border: none;
	}
	.modal-confirm .modal-header {
		border-bottom: none;   
        position: relative;
	}
	.modal-confirm h4 {
		width:100%;
		text-align: center;
		font-size: 26px;
		margin: 30px 0 -15px;
	}
	.modal-confirm .form-control, .modal-confirm .btn {
		min-height: 40px;
		border-radius: 3px; 
	}
	.modal-confirm .close {
        position: absolute;
		top: -5px;
		right: -5px;
	}	
	.modal-confirm .modal-footer {
		border: none;
		text-align: center;
		border-radius: 5px;
		font-size: 13px;
	}	
	.modal-confirm .icon-box {
		color: #fff;		
		position: absolute;
		margin: 0 auto;
		left: 0;
		right: 0;
		top: -70px;
		width: 95px;
		height: 95px;
		border-radius: 50%;
		z-index: 9;
		/* background: #82ce34; */
		padding: 15px;
		text-align: center;
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
	}
	.modal-confirm .icon-box i {
		font-size: 58px;
		position: relative;
		top: 3px;
	}
	.modal-confirm.modal-dialog {
		margin-top: 80px;
	}
    .modal-confirm .btn {
        color: #fff;
        border-radius: 4px;
		text-decoration: none;
		transition: all 0.4s;
        line-height: normal;
        border: none;
        width:100%;
    }

/********************************************************************/
		.page-header h3{
		padding:10px;
		}
		.panel-primary{
		border:1px solid #3071a9 !important;
		}
		.panel-body{
			padding:20px;
		}
		.panel.with-nav-tabs .panel-heading{
		    padding: 5px 5px 0 5px;
		    background-color: #3071a9;
		}
		.panel.with-nav-tabs.panel-body{
		    padding: 10px 15px;
		}
		.panel.with-nav-tabs .nav-tabs{
			border-bottom: none;
		}
		.panel.with-nav-tabs .nav-justified{
			margin-bottom: -1px;
		}
		/*** PANEL PRIMARY ***/
		.with-nav-tabs.panel-primary .nav-tabs > a,
		.with-nav-tabs.panel-primary .nav-tabs > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > a:focus {
		    color: #fff;
		}
		.with-nav-tabs.panel-primary .nav-tabs > .open > a,
		.with-nav-tabs.panel-primary .nav-tabs > .open > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > .open > a:focus,
		.with-nav-tabs.panel-primary .nav-tabs > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs >  a:focus {
			color: #fff;
			background-color: #3071a9;
			border-color: transparent;
		}
		.with-nav-tabs.panel-primary .nav-tabs > a.active,
		.with-nav-tabs.panel-primary .nav-tabs > a.active > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > a.active > a:focus {
			color: #428bca;
			background-color: #fff;
			border-color: #428bca;
			border-bottom-color: transparent;
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu {
		    background-color: #428bca;
		    border-color: #3071a9;
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a {
		    color: #fff;   
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > li > a:focus {
		    background-color: #3071a9;
		}
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a,
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:hover,
		.with-nav-tabs.panel-primary .nav-tabs > li.dropdown .dropdown-menu > .active > a:focus {
		    background-color: #4a9fe9;
		}
		/********************************************************************/
			input.error {
		    border-color: #f00 !important;
			}
			small.required {
			    color:#f00;
			}
.modal-backdrop {
   /* display: none; */
}
	/**************** Data Table *******************/
	
		</style>	
  </head>
 <body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" class="active">
			<h1><a href="index.html" class="logo"><span class="fa fa-cubes"></span></a></h1>
	      	<%@include file="MenuDirecteurEtudes.jsp" %>
		</nav>
	<!-- Page Content  -->
      <div id="content" class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
          <div class="container-fluid">

            <button type="button" id="sidebarCollapse" class="btn btn-primary">
              <i class="fa fa-bars"></i>
              <span class="sr-only">Toggle Menu</span>
            </button>
            <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fa fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="nav navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#"><span class="fa fa-home mr-2"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-envelope mr-2"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-bell mr-2"></span></a>
                </li>
                <li class="nav-item">
                    <div class="dropdown">
					    <button class="btn btn-default dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">
					     <img src="${pageContext.request.contextPath}/Document/Download?file=${sessionScope.userPhoto}" class="rounded-circle" style="width:20px;height:20px;">
					       
					    </button>
					    <div class="dropdown-menu dropdown-menu-right" role="menu" >
					      <div class="dropdown-item text-center">
					      <img src="${pageContext.request.contextPath}/Document/Download?file=${sessionScope.userPhoto}" class="rounded-circle" style="width:60px;height:60px;">
					       
					      </div>
					      <h5 class="dropdown-header text-primary text-center">${sessionScope.userFirstName_Fr} &nbsp; ${sessionScope.userLastName_Fr}</h5>
					      <h5 class="dropdown-header text-muted text-center">${sessionScope.userRole}</h5>
					      <div class="dropdown-divider"></div>
					      <a class="dropdown-item" href="${pageContext.request.contextPath}/E.DirecteurEtudes/Profile?userId=${sessionScope.userID}">
					      		<span class="fa fa-id-card mr-2"></span>
					      		Profile
					      </a>
					      <div class="dropdown-divider"></div>
						  <a class="dropdown-item" href="${pageContext.request.contextPath}/Logout"> 
						      	<span class="fa fa-external-link-square-alt mr-2"></span>
						      	Déconnexion
						  </a>
					    </div>
					  </div>
                </li>
     
              </ul>
            </div>
          </div>
        </nav>
<!-- Start content -->
	
	<div class="container"> 
		<!-- Col 0 -->
		  <div class="alert bg-light text-muted">
		  	<div class="alert bg-light text-secondary" role="alert">
	   			<i class="fa fa-list-ol mr-2"></i>
	   			Evaluations
		   	</div>
		  </div> 
		<!--/ Col 0 -->
		<div class="row">
		<div class="col-md-9"> <!-- Col 1 -->
		<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content" role="tablist">
					    <a id="tab_FormeEvaluations" href="#content-tab-FormeEvaluations" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-FormeEvaluations" aria-selected="false">
					         Formes des évaluations
					    </a>
					    <a id="tab_OptionBacs" href="#content-tab-OptionBacs" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-OptionBacs" aria-selected="false">
					         Options du Bac
					    </a>
					    <a id="tab_Mentions" href="#content-tab-Mentions" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Mentions" aria-selected="false">
					         Mentions
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Tab content -->
				<div class="tab-content" id="Tab-Content">
						<!-- Content tab 1	: FormeEvaluations-->
						<div id="content-tab-FormeEvaluations" class="tab-pane active" role="tabpanel" aria-labelledby="content-tab-FormeEvaluations">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			Formes des évaluations
						        <a href="#" data-toggle="modal" data-target="#formeExamen_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une forme d'examen"><i class="fa fa-plus"></i></a>
						    </div>
							<table id="data_table_formeExamens" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>N°</th>
										<th>Code</th>
										<th>Nom</th>
							            <th>Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<!-- Début : Modal Add New FormeEvaluation -->
								<div id="formeExamen_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="formeExamen_Add_Form" method="POST" action="../FormeEvaluation/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une forme d'évaluation
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="formeExamen_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input id="formeExamen_code" type="text" class="form-control" name="code" placeholder="Code de la forme d'évaluation" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="formeExamen_Nom_Fr" class="col-sm-3 control-label">Nom de la forme d'évaluation</label>
												  <div class="col-sm-9">
												    <input id="formeExamen_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la forme d'évaluation" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="formeExamen_Nom_Ar" class="col-sm-3 control-label">إسم شكل الإختبار</label>
												  <div class="col-sm-9">
												    <input id="formeExamen_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم شكل الإختبار بالعربية"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New FormeEvaluation -->
							 <!-- Début : Modal Update FormeEvaluation -->
								<div id="formeExamen_Update_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="formeExamen_Update_Form" method="POST" action="../FormeEvaluation/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier la forme d'évaluation
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="formeExamen_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="formeExamen_code" type="text" class="form-control" name="code" placeholder="Code de la forme d'évaluation" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="formeExamen_Nom_Fr" class="col-sm-3 control-label">Nom de la forme d'évaluation</label>
												  <div class="col-sm-9">
												    <input id="formeExamen_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la forme d'évaluation" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="formeExamen_Nom_Ar" class="col-sm-3 control-label">إسم شكل الإختبار</label>
												  <div class="col-sm-9">
												    <input id="formeExamen_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم شكل الإختبار بالعربية"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Update FormeEvaluation -->
							 <!-- Début : Modal Details FormeEvaluation -->
								<div id="formeExamen_Details_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de la forme d'évaluation
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails du formeExamen-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							 <!-- Fin : Modal Details FormeEvaluation -->
						</div>
						<!-- /Content tab 1	: FormeEvaluations-->
						<!-- Content tab 2	: Matières-->
						<div id="content-tab-OptionBacs" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-OptionBacs">
							<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-square-root-alt mr-2"></i>
					   			Option du Baccalauréat
						        <a href="#" data-toggle="modal" data-target="#optionBac_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter une matière"><i class="fa fa-plus"></i></a>
						        
							</div>
							<table id="data_table_optionBacs" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>N°</th>
										<th>Code</th>
										<th>Nom</th>
							            <th>Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<!-- Début : Modal Add New OptionBac -->
								<div id="optionBac_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="optionBac_Add_Form" method="POST" action="../OptionBac/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une option du Bac
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="optionBac_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input id="optionBac_code" type="text" class="form-control" name="code" placeholder="Code de l'option du Bac" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="optionBac_Nom_Fr" class="col-sm-3 control-label">Nom de l'option du Bac</label>
												  <div class="col-sm-9">
												    <input id="optionBac_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de l'option du Bac" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="optionBac_Nom_Ar" class="col-sm-3 control-label">إسم شعبة الباكالوريا</label>
												  <div class="col-sm-9">
												    <input id="optionBac_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم شعبة الباكالوريا بالعربية"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New OptionBac -->
							 <!-- Début : Modal Update OptionBac -->
								<div id="optionBac_Update_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="optionBac_Update_Form" method="POST" action="../OptionBac/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier l'option du Bac
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="optionBac_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="optionBac_code" type="text" class="form-control" name="code" placeholder="Code de l'option du Bac" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="optionBac_Nom_Fr" class="col-sm-3 control-label">Nom de l'option du Bac</label>
												  <div class="col-sm-9">
												    <input id="optionBac_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de l'option du Bac" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="optionBac_Nom_Ar" class="col-sm-3 control-label">إسم شعبة الباكالوريا</label>
												  <div class="col-sm-9">
												    <input id="optionBac_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم شعبة الباكالوريا بالعربية"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
								</div>
							</div>
							<!-- Début : Modal Details OptionBac -->
								<div id="optionBac_Details_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de l'option du Bac
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails de la optionBac-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							 <!-- Fin : Modal Details OptionBac -->
						</div>
						<!-- /Content tab 2	: Matières-->
						<!-- Content tab 3	: Mentions-->
						<div id="content-tab-Mentions" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-Mentions">
					   		<div class="alert bg-light text-secondary" role="alert">
					   			<i class="fa fa-stream mr-2"></i>
					   			Mentions
						        <a href="#" data-toggle="modal" data-target="#mention_Add_Modal" class="btn btn-outline-info float-right" title="Ajouter un mention"><i class="fa fa-plus"></i></a>
						        
							</div>
							<table id="data_table_mentions" class="table table-striped table-bordered" cellspacing="0" width="100%">
								<thead>
									<tr>
										<th>N°</th>
										<th>Code</th>
										<th>Nom</th>
							            <th>Action</th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							<!-- Début : Modal Add New Mention -->
								<div id="mention_Add_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="mention_Add_Form" method="POST" action="../Mention/Add" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Ajouter une mention
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="mention_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input id="mention_code" type="text" class="form-control" name="code" placeholder="Code de la mention" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="mention_Nom_Fr" class="col-sm-3 control-label">Nom de la mention</label>
												  <div class="col-sm-9">
												    <input id="mention_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la mention" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="mention_Nom_Ar" class="col-sm-3 control-label">إسم الميزة</label>
												  <div class="col-sm-9">
												    <input id="mention_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم الميزة بالعربية"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Add New Mention -->
							 <!-- Début : Modal Update Mention -->
								<div id="mention_Update_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
									<form id="mention_Update_Form" method="POST" action="../Mention/Update" >
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Modifier la mention
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<div class="form-group row">
										    		<label for="mention_code" class="col-sm-3 control-label">Code</label>
												    <div class="col-sm-9">
												      <input  type="hidden" class="form-control" name="id" />
												      <input id="mention_code" type="text" class="form-control" name="code" placeholder="Code de la mention" required/>
												    </div>
										  		</div>
												<div class="form-group row">
												  <label for="mention_Nom_Fr" class="col-sm-3 control-label">Nom de la mention</label>
												  <div class="col-sm-9">
												    <input id="mention_Nom_Fr" type="text" class="form-control" name="nom_Fr" placeholder="Nom de la mention" required/>
												  </div>
												</div>
										  		<div class="form-group row">
												  <label for="mention_Nom_Ar" class="col-sm-3 control-label">إسم الميزة</label>
												  <div class="col-sm-9">
												    <input id="mention_Nom_Ar" type="text" class="form-control" name="nom_Ar" dir="rtl" placeholder="إسم الميزة بالعربية"/>
												  </div>
												</div>
								      	</div>
								        <div class="modal-footer ">
							        		<input type="submit" class="btn btn-primary" value="Enregistrer" />
									        <button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Annuler</button>
							      		</div>
								        </div>
								   	</form>
									</div>
							    </div>
							 <!-- Fin : Modal Update Mention -->
							 <!-- Début : Modal Details Mention -->
								<div id="mention_Details_Modal" class="modal" tabindex="-1" role="dialog">
									<div class="modal-dialog">
								      	<div class="modal-content shadow-lg p-3 mb-5 bg-white rounded">
								          	<div class="modal-header bg-info">
								        		<h4 class="modal-title text-white">
								        			Détails de la mention
								        		</h4>
								        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							    					<span aria-hidden="true">&times;</span>
							  					</button>
								        	</div>
								          	<div class="modal-body">
								          		<ul class="list-group">
													<!-- Affichage dynamique des détails du mention-->
												</ul>
											</div>
											<div class="modal-footer ">
												<button type="button" class="btn btn-secondary" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Fermer</button>
											</div>
								        </div>
									</div>
							    </div>
							 <!-- Fin : Modal Details Mention -->
						</div>
						<!-- /Content tab 3	: Mentions-->
				</div>
				<!-- /Tab content -->
			 </div>
		  </div>
		</div> <!-- /Col 1 -->
		<div class="col-md-3"> <!-- Col 2 -->
			<div class="panel with-nav-tabs panel-primary">
		     <div class="panel-heading">
					<nav class="nav nav-tabs flex-column flex-sm-row"  id="Tab-Content-2" role="tablist">
					    <a id="tab_Annonces" href="#content-tab-Annonces" class="nav-item nav-link active" data-toggle="tab" role="tab" aria-controls="content-tab-Annonces" aria-selected="false">
					        <span class="fa fa-bullhorn mr-1"></span> Annonces
					    </a>
					    <a  id="tab_Actualites" href="#content-tab-Actualites" class="nav-item nav-link" data-toggle="tab" role="tab" aria-controls="content-tab-Actualites" aria-selected="false">
					        <span class="fa fa-newspaper mr-1"></span>Actualites
					    </a>
					</nav>
			</div>
		    <div class="panel-body">
		    	<!-- Début : Tab content  2-->
				<div class="tab-content" id="Tab-Content-Communication">
						<!-- Content tab 1 	: Annonces-->
					  	<div id="content-tab-Annonces" class="tab-pane active" role="tabpanel" aria-labelledby="content-tab-Annonces">
					     <ul>
							<li>Annonce 1</li>
							<li>Annonce 2</li>
							<li>Annonce 3</li>
						 </ul>
					  	</div>
						<!-- /Content tab 1 : Annonces-->
						<!-- Content tab 2 	: Actualites-->
						<div id="content-tab-Actualites" class="tab-pane" role="tabpanel" aria-labelledby="content-tab-Actualites">
						 <ul>	
							<li>Actualité 1</li>
							<li>Actualité 2</li>
							<li>Actualité 3</li>
							<li>Actualite 4</li>
							<li>Actualité 5</li>
						 </ul>
						</div>
						<!-- /Content tab 2	: Actualites-->
				</div>
				<!-- Fin : Tab content 2 -->
			 </div>
		</div>
		</div> <!-- Col 2 -->
	</div><!-- /row 1 -->
	
	<!-- /Page Content  -->
</div>
</div>
</div>
<!-- Modal Success -->
	<div id="modalSuccess" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box bg-success">
					<i class="material-icons fa fa-check"></i>
				</div>				
				<h4 class="modal-title text-center">Succès !</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">
					<!-- On affiche ici le message obtenu du coté serveur -->
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-success btn-block" data-dismiss="modal">Fermer</button>
			</div>
		</div>
	  </div>
	</div>
<!-- Fin : Moad Success -->
<!-- Début : Modal error -->
	<div id="modalError" class="modal" tabindex="-1" role="dialog">
	  <div class="modal-dialog modal-dialog-centered modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box bg-danger">
					<i class="material-icons fa fa-exclamation-triangle"></i>
				</div>				
				<h4 class="modal-title text-center">Echec !</h4>	
			</div>
			<div class="modal-body">
				<p class="text-center">
					<!-- On affiche ici le message obtenu du coté serveur -->
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary btn-block" data-dismiss="modal">Fermer</button>
			</div>
		</div>
	  </div>
	</div>
<!-- Fin : Moad Error -->
<!-- Début : Moad Confirmation -->
<div id="modalConfirm" class="modal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-dialog-centered modal-confirm " role="document">
		<div class="modal-content">
		  <div class="modal-header">
				<div class="icon-box bg-warning">
					<i class="material-icons fa fa-exclamation-triangle"></i>
				</div>				
				<h4 class="modal-title text-center">Supprimer ?</h4>	
		  </div>
		  <div class="modal-body">
				<p class="text-center">
					Etes vous sûre de vouloir supprimer cet enregistrement ?
				</p>
		  </div>
		  <div class="modal-footer">
		    <button type="button" data-dismiss="modal" class="btn btn-warning  mr-auto" id="delete">Supprimer</button>
		    <button type="button" data-dismiss="modal" class="btn btn-secondary  ">Annuler</button>
		  </div>
		 </div>
  	</div>
</div>
<!-- Fin : Moad Confirmation-->
<!-- Début : Moad Loading Ajax -->
<div id="loading-image" class="modal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-sm" >
        <div class="modal-content" style="width: 48px; color:orange;">
            <span class="fa fa-spinner fa-spin fa-3x"></span>
        </div>
    </div>
</div>
<!-- Fin : Moad Loading Ajax -->

	<script src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js" ></script>
	
	<script src="${pageContext.request.contextPath}/js/popper.js" type="text/javascript"></script>
	
	
	<script src="${pageContext.request.contextPath}/js/jquery.dataTables.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/js/main.js" type="text/javascript"></script>
    
    
    <script src="${pageContext.request.contextPath}/js/dataTables.buttons.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/buttons.flash.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jszip.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/pdfmake.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/vfs_fonts.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/buttons.html5.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/buttons.print.min.js" type="text/javascript"></script>
    
    
  	<script type="text/javascript">
  	
  	$(document).ready(function() {
  		/**************** Début : Ajax Load Animation *************************/
  		$(document).ajaxStart(function(){
  			$('#loading-image').show();
		 });
  		$(document).ajaxStop(function(){
  			$('#loading-image').hide();
		 });
		/*******************Fin : Ajax Load Animation *************************/
		
		
  		/************** DataTable du Tab : FormeEvaluations **************/
	  		// Initialisation du DataTable FormeEvaluations
	  		$('#data_table_formeExamens').DataTable(
	  			{	
	  				"paging": true,
	  				"autoWidth": true,
	  				"columnDefs": [
	  					{ "orderable": false, "targets": 3 }
	  				],
	  				dom: 'Bfrtip',
	  		        buttons: [
	  		            'copy', 
	  		            'csv', 
	  		            'excel', 
	  		            'pdf', 
	  		            'print'
	  		        ]
	  			}
	  		);
	  		/******* fonction pour charger la liste des FormeEvaluations dans la TableData FormeEvaluations ******/
			function populateFormeEvaluationDataTable(){
				var tableData = $('#data_table_formeExamens').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../FormeEvaluation/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var rang =i+1;
							var btns='<div class="btn-group dropleft"> \
										  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
										  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
										    <span class="sr-only">Toggle Dropdown</span> \
										  </button> \
										  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownFormeEvaluation"> \
										    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
									        <div class="dropdown-divider"></div> \
										  	<a class="dropdown-item formeExamen-details text-primary" href="#" formeExamenId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
										  	<a class="dropdown-item formeExamen-update text-primary" href="#" formeExamenId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
										  	<a class="dropdown-item formeExamen-delete text-primary" href="#" formeExamenId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
										  </div> \
										</div> ';
							tableData.row.add( [
							             rang,
							             response[i].code,
							             response[i].nom_Fr,
							             btns
							         ] ).draw( false );
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
			};
			/*
			/* Au chargement de la page charger la listes des unités
			*/
			
			populateFormeEvaluationDataTable();
			
			/* Au click sur le tab FormeEvaluations : 
			/* On charger la liste des FormeEvaluations dans la TableData FormeEvaluations
			*/
			
			$('#tab_FormeEvaluations').on('click', function(e){
					// Effacer le DataTable FormeEvaluations
					$('#data_table_formeExamens').DataTable().rows().remove().draw();
					// Charger la liste des formeExamens dans le DataTable FormeEvaluations
		  			populateFormeEvaluationDataTable();
					e.preventDefault();
			});
			
  			/********** Ajouter un nouveau FormeEvaluation **********************/
  			//Effacer dabord le formulaire
  			$('#formeExamen_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#formeExamen_Add_Form').trigger('reset');
  			});
  			//Envoyer le formulaire via ajax
  			$("#formeExamen_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#formeExamen_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable FormeEvaluations
						$('#data_table_formeExamens').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable FormeEvaluations
						populateFormeEvaluationDataTable();    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'une FormeEvaluation ****************
  			/* 1 - Récuperer l' Id du FormeEvaluation séléctionner sur la DataTable FormeEvaluations
  			/* 2 - Charger par ajax le FormeEvaluation concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du FormeEvaluation concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_formeExamens').on('click','.formeExamen-update', function(evt){
				$this = $(this);
				var id= $this.attr('formeExamenId');
				$.ajax({
					url : "../FormeEvaluation/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#formeExamen_Update_Form input[name=id]").val(response.id);
						$("#formeExamen_Update_Form input[name=code]").val(response.code);
						$("#formeExamen_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
						$("#formeExamen_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
						$('#formeExamen_Update_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			/* 5- Envoie du formulaire de modification */
  			
  			$("#formeExamen_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#formeExamen_Update_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				        },
				    complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable FormeEvaluations
						$('#data_table_formeExamens').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable FormeEvaluations
						populateFormeEvaluationDataTable();    
				    }   
				});
				return false;
			});	
  			/*********** Suppression d'une FormeEvaluation ****************
  			/* 1 - Récuperer l' Id du FormeEvaluation séléctionner sur la DataTable FormeEvaluations
  			/* 2 - Supprimer par ajax le FormeEvaluation concerné
  			*****************************************************/
  			
  			$('#data_table_formeExamens').on('click','.formeExamen-delete', function(evt){
				$this = $(this);
				var id= $this.attr('formeExamenId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : "../FormeEvaluation/Delete?id="+id,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
								$("#modalSuccess .modal-body p").html("");
								$("#modalSuccess .modal-body p").html(response);
						   		$('#modalSuccess').modal('show');
						    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						    	
						    },
						    error: function(response,textStatus ,jqXHR){
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError').modal('show'); 
						    },
						    complete: function (response,textStatus ,jqXHR) {
						    	
								//Effacer le DataTable FormeEvaluations
								$('#data_table_formeExamens').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable FormeEvaluations
								populateFormeEvaluationDataTable();    
						    }
						});
				  });
				
				
				return false;
			});
  			
  			/*********** Affichage des détails d'une FormeEvaluation ****************
  			/* 1 - Récuperer l' Id du FormeEvaluation séléctionner sur la DataTable FormeEvaluations
  			/* 2 - Charger par ajax le FormeEvaluation concerné
  			/* 3 - Afficher les détails du FormeEvaluation concerné 
  			*****************************************************/
  			
  			$('#data_table_formeExamens').on('click','.formeExamen-details', function(evt){
				$this = $(this);
				var id= $this.attr('formeExamenId');
				$.ajax({
					url : "../FormeEvaluation/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code</strong></span><span class="float-right">'+response.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom de la forme d\'évalaution  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
						var nom_ArItem ='<li class="list-group-item"><span><strong>إسم شكل الإختبار</strong></span><span class="float-right" dir="rtl">'+response.nom_Ar+'</span></li>';
						$("#formeExamen_Details_Modal .list-group").html("");
						$("#formeExamen_Details_Modal .list-group").append(codeItem);
						$("#formeExamen_Details_Modal .list-group").append(nom_FrItem);
						$("#formeExamen_Details_Modal .list-group").append(nom_ArItem);
						$('#formeExamen_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			
  			
  			
  			/************** DataTable du Tab : OptionBacs **************/
	  		// Initialisation du DataTable OptionBacs
	  		$('#data_table_optionBacs').DataTable(
	  			{	
	  				"paging": true,
	  				"autoWidth": true,
	  				"columnDefs": [
	  					{ "orderable": false, "targets": 3 }
	  				],
	  				dom: 'Bfrtip',
	  		        buttons: [
	  		            'copy', 
	  		            'csv', 
	  		            'excel', 
	  		            'pdf', 
	  		            'print'
	  		        ]
	  			}
	  		);
	  		/******* fonction pour charger la liste des OptionBacs dans la TableData OptionBacs ******/
			function populateOptionBacDataTable(){
				var tableData = $('#data_table_optionBacs').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../OptionBac/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var rang=i+1;
							var btns='<div class="btn-group dropleft"> \
								  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
								  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
								    <span class="sr-only">Toggle Dropdown</span> \
								  </button> \
								  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownFormeEvaluation"> \
								    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
							        <div class="dropdown-divider"></div> \
								  	<a class="dropdown-item optionBac-details text-primary" href="#" optionBacId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
								  	<a class="dropdown-item optionBac-update text-primary" href="#" optionBacId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
								  	<a class="dropdown-item optionBac-delete text-primary" href="#" optionBacId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
								  </div> \
								</div> ';
							tableData.row.add( [
							             rang,
							             response[i].code,
							             response[i].nom_Fr,
							             btns
							         ] ).draw( false );
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
			};
			
			/* Au click sur le tab OptionBacs : 
			/* On charger la liste des OptionBacs dans la TableData OptionBacs
			*/
			
			$('#tab_OptionBacs').on('click', function(e){
					// Effacer le DataTable OptionBacs
		  			$('#data_table_optionBacs').DataTable().rows().remove().draw();
		  			// Charger la liste des optionBacs dans le DataTable OptionBacs
		  			populateOptionBacDataTable();
					e.preventDefault();
			});
  			
  			/********** Ajouter une nouvelle OptionBac **********************/
  			//Effacer dabord le formulaire
  			$('#optionBac_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#optionBac_Add_Form').trigger('reset');
  			});
  			
  			$("#optionBac_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#optionBac_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				   },
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable OptionBacs
						$('#data_table_optionBacs').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable OptionBacs
						populateOptionBacDataTable();
			  			    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'une OptionBac ****************
  			/* 1 - Récuperer l' Id de la OptionBac séléctionner sur la DataTable OptionBacs
  			/* 2 - Charger par ajax le OptionBac concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du OptionBac concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_optionBacs').on('click','.optionBac-update', function(evt){
				$this = $(this);
				var id= $this.attr('optionBacId');
				$.ajax({
					url : "../OptionBac/Details?id="+id,
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						$("#optionBac_Update_Form input[name=id]").val(response.id);
						$("#optionBac_Update_Form input[name=code]").val(response.code);
						$("#optionBac_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
						$("#optionBac_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
						$('#optionBac_Update_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
			});
  			/* 5- Envoie du formulaire de modification */
  			
  			$("#optionBac_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#optionBac_Update_Modal').modal('hide');		//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				    },
				   complete: function (response,textStatus ,jqXHR) {
					 	//Effacer le DataTable OptionBacs
						$('#data_table_optionBacs').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable OptionBacs
						populateOptionBacDataTable();
			  			    
				    }
				});
				return false;
			});
  			
  			/*********** Suppression d'une OptionBac ****************
  			/* 1 - Récuperer l' Id du OptionBac séléctionner sur la DataTable OptionBacs
  			/* 2 - Supprimer via ajax le OptionBac concerné
  			*****************************************************/
  			
  			$('#data_table_optionBacs').on('click','.optionBac-delete', function(evt){
				$this = $(this);
				var id= $this.attr('optionBacId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
						$.ajax({
							url : "../OptionBac/Delete?id="+id,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
								
								$("#modalSuccess .modal-body p").html("");
								$("#modalSuccess .modal-body p").html(response);
						   		$('#modalSuccess').modal('show');
						    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						    },
						    error: function(response,textStatus ,jqXHR){
						    
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError').modal('show'); 
						    },
						    complete: function (response,textStatus ,jqXHR) {
							 	//Effacer le DataTable OptionBacs
								$('#data_table_optionBacs').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable OptionBacs
								populateOptionBacDataTable();
					  			    
						    }
						});
				  });
				return false;
			});
  			
  			/*********** Affichage des détails d'une OptionBac****************
  			/* 1 - Récuperer l' Id de la matière séléctionner sur la DataTable Filiers
  			/* 2 - Charger par ajax la matière concernée
  			/* 3 - Afficher les détails la matière concernée
  			*****************************************************/
  			
  			$('#data_table_optionBacs').on('click','.optionBac-details', function(evt){
				$this = $(this);
				var id= $this.attr('optionBacId');
				$.ajax({
					url : "../OptionBac/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code</strong></span><span class="float-right">'+response.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom de l\'option du bac  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
						var nom_ArItem ='<li class="list-group-item"><span class="float-right"><strong>إسم شعبة الباكالوريا</strong></span><span class="float-left" dir="rtl">'+response.nom_Ar+'</span></li>';
						$("#optionBac_Details_Modal .list-group").html("");
						$("#optionBac_Details_Modal .list-group").append(codeItem);
						$("#optionBac_Details_Modal .list-group").append(nom_FrItem);
						$("#optionBac_Details_Modal .list-group").append(nom_ArItem);
						$('#optionBac_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			
  			/************** DataTable du Tab : Mentions **************/
	  		// Initialisation du DataTable Mentions
	  		$('#data_table_mentions').DataTable(
	  			{	
	  				"paging": true,
	  				"autoWidth": true,
	  				"columnDefs": [
	  					{ "orderable": false, "targets": 3 }
	  				],
	  				dom: 'Bfrtip',
	  		        buttons: [
	  		            'copy', 
	  		            'csv', 
	  		            'excel', 
	  		            'pdf', 
	  		            'print'
	  		        ]
	  			}
	  		);
	  		/******* fonction pour charger la liste des Mentions dans la TableData Mentions ******/
			function populateMentionDataTable(){
				var tableData = $('#data_table_mentions').DataTable();
				//tableData.DataTable().rows().remove().draw();		// Vider la TableData 
				$.ajax({
					url : "../Mention/List",
					type: "GET",
					dataType: 'json',
					success: function(response,textStatus ,jqXHR){
						for(i=0;i<response.length;i++){
							var rang =i+1;
							var btns='<div class="btn-group dropleft"> \
								  <button type="button" class="btn btn-outline-info btn-sm" title="Actions"><span class="fa fa-ellipsis-h"></span></button> \
								  <button type="button" class="btn btn-outline-info btn-sm dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> \
								    <span class="sr-only">Toggle Dropdown</span> \
								  </button> \
								  <div class="dropdown-menu shadow p-3 mb-5 bg-white rounded" id="dropdownFormeEvaluation"> \
								    <div class="bg-info text-white px-3 py-1"><span class="fa fa-ellipsis-h mr-4"></span> Actions</div> \
							        <div class="dropdown-divider"></div> \
								  	<a class="dropdown-item mention-details text-primary" href="#" mentionId="'+response[i].id+'"><span class="fa fa-info-circle mr-4"></span>Détails</a> \
								  	<a class="dropdown-item mention-update text-primary" href="#" mentionId="'+response[i].id+'"><span class="fa fa-pen mr-4"></span>Modifier</a> \
								  	<a class="dropdown-item mention-delete text-primary" href="#" mentionId="'+response[i].id+'"><span class="fa fa-trash mr-4"></span>Supprimer</a> \
								  </div> \
								</div> ';
							tableData.row.add( [
							             rang,
							             response[i].code,
							             response[i].nom_Fr,
							             btns
							         ] ).draw( false );
						}
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
			};
			/* Au click sur le tab Mentions : 
			/* On charger la liste des Mentions dans la TableData Mentions
			*/
			
			$('#tab_Mentions').on('click', function(e){
					// Effacer le DataTable Mentions
					$('#data_table_mentions').DataTable().rows().remove().draw();
					// Charger la liste des mentions dans le DataTable Mentions
		  			populateMentionDataTable();
					e.preventDefault();
			});
			
  			/********** Ajouter un nouveau Mention **********************/
  			//Effacer dabord le formulaire
  			$('#mention_Add_Modal').on('shown.bs.modal', function(evt){
  				$('#mention_Add_Form').trigger('reset');
  			});
  			//Envoyer le formulaire via ajax
  			$("#mention_Add_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#mention_Add_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError').modal('show'); 
				        },
					complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable Mentions
						$('#data_table_mentions').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Mentions
						populateMentionDataTable();    
				    }
				});
				return false;
			});	
  			
  			/*********** Modification d'un Mention ****************
  			/* 1 - Récuperer l' Id du Mention séléctionner sur la DataTable Mentions
  			/* 2 - Charger par ajax le Mention concerné
  			/* 3 - Remplir les champs de formulaire de modification avec les données du Mention concerné
  			/* 4 - Afficher le formulaire de modification
  			*****************************************************/
  			
  			$('#data_table_mentions').on('click','.mention-update', function(evt){
				$this = $(this);
				var id= $this.attr('mentionId');
				$.ajax({
					url : "../Mention/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#mention_Update_Form input[name=id]").val(response.id);
						$("#mention_Update_Form input[name=code]").val(response.code);
						$("#mention_Update_Form input[name=nom_Fr]").val(response.nom_Fr);
						$("#mention_Update_Form input[name=nom_Ar]").val(response.nom_Ar);
						$('#mention_Update_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  			/* 5- Envoie du formulaire de modification */
  			
  			$("#mention_Update_Form").submit(function(event){ 
				var post_url = $(this).attr("action"); 			//Lire l'action (URL) du formulaire
				var request_method = $(this).attr("method"); 	//Lire la méthode du formulaire  GET/POST 
				var form_data = $(this).serialize(); 			//Encoder les données du formulaire pour envoie
				$('#mention_Update_Modal').modal('hide');			//Fermer la fenetre modal apres envoie du formulaire
				$.ajax({
					url : post_url,
					type: request_method,
					data : form_data,
					dataType: 'json',
					contentType: "application/x-www-form-urlencoded;charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						$("#modalSuccess .modal-body p").html("");
						$("#modalSuccess .modal-body p").html(response);
				   		$('#modalSuccess').modal('show');
				    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						
				    },
				    error: function(response,textStatus ,jqXHR){
	                    $("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(response);
				   		$('#modalError').modal('show'); 
				        },
				    complete: function (response,textStatus ,jqXHR) {
				    	
						//Effacer le DataTable Mentions
						$('#data_table_mentions').DataTable().rows().remove().draw();
			  			//Raffrichir le DataTable Mentions
						populateMentionDataTable();    
				    }   
				});
				return false;
			});	
  			/*********** Suppression d'un Mention ****************
  			/* 1 - Récuperer l' Id du Mention séléctionner sur la DataTable Mentions
  			/* 2 - Supprimer par ajax le Mention concerné
  			*****************************************************/
  			
  			$('#data_table_mentions').on('click','.mention-delete', function(evt){
				$this = $(this);
				var id= $this.attr('mentionId');
				$('#modalConfirm').modal('show');
				$('#modalConfirm').on('click', '#delete', function(e) {
					
						$.ajax({
							url : "../Mention/Delete?id="+id,
							type: "GET",
							dataType: 'json',
							success: function(response,textStatus ,jqXHR){
								$("#modalSuccess .modal-body p").html("");
								$("#modalSuccess .modal-body p").html(response);
						   		$('#modalSuccess').modal('show');
						    	//setTimeout(function() { $('#modalSuccess').modal('hide'); }, 5000);
						    	
						    },
						    error: function(response,textStatus ,jqXHR){
						    	$("#modalError .modal-body p").html("");
								$("#modalError .modal-body p").html(jqXHR.responseText);
						   		$('#modalError').modal('show'); 
						    },
						    complete: function (response,textStatus ,jqXHR) {
						    	
								//Effacer le DataTable Mentions
								$('#data_table_mentions').DataTable().rows().remove().draw();
					  			//Raffrichir le DataTable Mentions
								populateMentionDataTable();    
						    }
						});
				  });
				
				
				return false;
			});
  			
  			/*********** Affichage des détails d'un Mention ****************
  			/* 1 - Récuperer l' Id du Mention séléctionné sur la DataTable Mentions
  			/* 2 - Charger par ajax le Mention concerné
  			/* 3 - Afficher les détails du Mention concerné 
  			*****************************************************/
  			
  			$('#data_table_mentions').on('click','.mention-details', function(evt){
				$this = $(this);
				var id= $this.attr('mentionId');
				$.ajax({
					url : "../Mention/Details?id="+id,
					type: "GET",
					dataType: 'json',
					contentType: "application/json; charset=UTF-8",
					success: function(response,textStatus ,jqXHR){
						var codeItem ='<li class="list-group-item"><span><strong>Code</strong></span><span class="float-right">'+response.code+'</span></li>';
						var nom_FrItem ='<li class="list-group-item"><span><strong>Nom de la mention  </strong></span><span class="float-right">'+response.nom_Fr+'</span></li>';
						var nom_ArItem ='<li class="list-group-item"><span><strong>إسم الميزة</strong></span><span class="float-right" dir="rtl">'+response.nom_Ar+'</span></li>';
						$("#mention_Details_Modal .list-group").html("");
						$("#mention_Details_Modal .list-group").append(codeItem);
						$("#mention_Details_Modal .list-group").append(nom_FrItem);
						$("#mention_Details_Modal .list-group").append(nom_ArItem);
						$('#mention_Details_Modal').modal('show');
				    },
				    error: function(response,textStatus ,jqXHR){
				    	$("#modalError .modal-body p").html("");
						$("#modalError .modal-body p").html(jqXHR.responseText);
				   		$('#modalError .modal-body p').modal('show'); 
				        }
				});
				
				return false;
			});
  		
  	});
    </script>
   
</body>
</html>