<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


// front end start here----------------------------------------------
	// home controller start-------
		Route::get('/', 'Admin\Auth\LoginController@showLoginForm')->name('admin.login');
		
		Route::get('about/us', 'HelpController@about_us')->name('about_us');
		Route::get('contact-us', 'HelpController@contact_us')->name('contact_us');
		Route::get('services', 'HelpController@services')->name('services');
		Route::post('contact-us/process', 'HelpController@contact_us_process')->name('contact_us_process');
		Route::any('matched_sponsored_id_by_ajax', 'HelpController@matched_sponsored_id_by_ajax')->name('matched_sponsored_id_by_ajax');
// front end here----------------------------------------------





// admin controller start-----------------------------------------------------
	Route::group(['namespace' => 'Admin'], function(){
		// for deshboard
			Route::get('backend/dashboard', 'dashboardController@index')->name('admin.dashboard');

		/*country route routes start*/
			Route::any('backend/country', 'dashboardController@country')->name('admin.country');
			Route::any('backend/country_process', 'dashboardController@country_process')->name('admin.country_process');
			Route::any('backend/country_delete/{id?}', 'dashboardController@country_delete')->name('admin.country_delete');
		/*country route routes end*/


		/*contact us route start*/
			Route::get('backend/contact-us', 'dashboardController@contact_us')->name('admin.contact_us');
			Route::get('backend/contact-us/replay/{id}', 'dashboardController@contact_us_replay')->name('admin.contact_us_replay');
			Route::post('backend/contact-us/replay/process', 'dashboardController@contact_us_replay_process')->name('admin.contact_us_replay_process');
			Route::get('backend/contact/all/trash', 'dashboardController@contact_us_all_trash')->name('admin.contact_us_all_trash');
			Route::get('backend/contact-us/trash/{id}', 'dashboardController@contact_us_trash')->name('admin.contact_us_trash');

			Route::get('backend/contact-us/restor/{id}', 'dashboardController@contact_us_restor')->name('admin.contact_us_restor');
			Route::get('backend/contact-us/delete/{id}', 'dashboardController@contact_us_delete')->name('admin.contact_us_delete');
		/*contact us route end*/


		/*video route start*/
			Route::get('backend/video', 'dashboardController@video')->name('admin.video');
			Route::post('backend/video/process', 'dashboardController@video_process')->name('admin.video_process');
			Route::get('backend/video_delete/{id}', 'dashboardController@video_delete')->name('admin.video_delete');
		/*video route end*/


		/*report routes start*/
			Route::group(['namespace' => 'Report'], function(){
				Route::any('report/new', 'reportController@create')->name('admin.new_report');
				Route::post('report/save', 'reportController@store')->name('admin.save_new_report');

				Route::get('all-report', 'reportController@index')->name('admin.all_report');

				Route::get('edit-report/{id?}', 'reportController@edit')->name('admin.update_report');
				Route::post('process-edit-report/{id?}', 'reportController@edit_process')->name('admin.update_process_report');
				
				Route::get('trash-list-report/{id?}', 'reportController@trash_list')->name('admin.all_trash_report');
				Route::get('trash-report/{id?}', 'reportController@trash')->name('admin.trash_report');
				Route::get('restor-report/{id?}', 'reportController@restore')->name('admin.restore_report');
				
				Route::get('delete-report/{id?}', 'reportController@delete')->name('admin.delete_report');
				Route::get('overview', 'reportController@overview')->name('admin.overview_report');
				Route::get('overview/single/{type?}/{id?}', 'reportController@single_overview')->name('admin.single_overview');

				
				// for ajax request route
				Route::get('new-report/attendance/verifications/{student_id?}', 'reportController@attendance_verifications')->name('admin.attendance_verifications');
				Route::get('report/getStudents/{student_type?}', 'reportController@getStudents')->name('admin.getStudents');
			});
		/*report routes end*/

		/*hifzreport routes start*/
			Route::group(['namespace' => 'Report'], function(){
				Route::any('hifzreport/new', 'hifzreportController@create')->name('admin.new_hifzreport');
				Route::post('hifzreport/save', 'hifzreportController@store')->name('admin.save_new_hifzreport');

				Route::get('all-hifzreport', 'hifzreportController@index')->name('admin.all_hifzreport');

				Route::get('edit-hifzreport/{id?}', 'hifzreportController@edit')->name('admin.update_hifzreport');
				Route::post('process-edit-hifzreport/{id?}', 'hifzreportController@edit_process')->name('admin.update_process_hifzreport');
				
				Route::get('trash-list-hifzreport/{id?}', 'hifzreportController@trash_list')->name('admin.all_trash_hifzreport');
				Route::get('trash-hifzreport/{id?}', 'hifzreportController@trash')->name('admin.trash_hifzreport');
				Route::get('restor-hifzreport/{id?}', 'hifzreportController@restore')->name('admin.restore_hifzreport');
				
				Route::get('delete-hifzreport/{id?}', 'hifzreportController@delete')->name('admin.delete_hifzreport');
				Route::get('hifz-overview', 'hifzreportController@overview')->name('admin.overview_hifzreport');
				Route::get('hifz-overview/single/{type?}/{id?}', 'hifzreportController@single_overview')->name('admin.hifz_single_overview');

				
				// for ajax request route
				Route::get('new-hifzreport/attendance/verifications/{student_id?}', 'hifzreportController@attendance_verifications')->name('admin.attendance_verifications');
				Route::get('hifzreport/getStudents/{student_type?}', 'hifzreportController@getStudents')->name('admin.getStudents');
			});
		/*hifzreport routes end*/
		

		// gallery start--------------------------------------
			Route::group(['namespace' => 'Gallery'], function(){
				Route::get('new-gallery', 'galleryController@create')->name('admin.add_new_gallery');
				Route::post('new-gallery/save', 'galleryController@store')->name('admin.save_new_gallery');

				Route::get('gallery/list', 'galleryController@index')->name('admin.all_gallery');
				
				Route::get('edit-gallery/{id?}', 'galleryController@edit')->name('admin.update_gallery');
				Route::post('process-edit-gallery/{id?}', 'galleryController@edit_process')->name('admin.update_process_gallery');
				
				Route::get('trash-list-gallery/{id?}', 'galleryController@trash_list')->name('admin.all_trash_gallery');
				Route::get('trash-gallery/{id?}', 'galleryController@trash')->name('admin.trash_gallery');
				Route::get('restor-gallery/{id?}', 'galleryController@restore')->name('admin.restore_gallery');
				
				Route::get('delete-gallery/{id?}', 'galleryController@delete')->name('admin.delete_gallery');
			});
		// gallery end----------------------------------------
		

		// team start--------------------------------------
			Route::group(['namespace' => 'Team'], function(){
				Route::get('new-team', 'teamController@create')->name('admin.add_new_team');
				Route::post('new-team/save', 'teamController@store')->name('admin.save_new_team');

				Route::get('team/list', 'teamController@index')->name('admin.all_team');
				
				Route::get('edit-team/{id?}', 'teamController@edit')->name('admin.update_team');
				Route::post('process-edit-team/{id?}', 'teamController@edit_process')->name('admin.update_process_team');
				
				Route::get('trash-list-team/{id?}', 'teamController@trash_list')->name('admin.all_trash_team');
				Route::get('trash-team/{id?}', 'teamController@trash')->name('admin.trash_team');
				Route::get('restor-team/{id?}', 'teamController@restore')->name('admin.restore_team');
				
				Route::get('delete-team/{id?}', 'teamController@delete')->name('admin.delete_team');
			});
		// team end----------------------------------------

		// students start--------------------------------------
			Route::group(['namespace' => 'Students'], function(){
				Route::get('new-students', 'studentsController@create')->name('admin.add_new_students');
				Route::post('new-students/save', 'studentsController@store')->name('admin.save_new_students');

				Route::get('students/list', 'studentsController@index')->name('admin.all_students');
				
				Route::get('edit-students/{id?}', 'studentsController@edit')->name('admin.update_students');
				Route::post('process-edit-students/{id?}', 'studentsController@edit_process')->name('admin.update_process_students');
				
				Route::get('trash-list-students/{id?}', 'studentsController@trash_list')->name('admin.all_trash_students');
				Route::get('trash-students/{id?}', 'studentsController@trash')->name('admin.trash_students');
				Route::get('restor-students/{id?}', 'studentsController@restore')->name('admin.restore_students');
				
				Route::get('delete-students/{id?}', 'studentsController@delete')->name('admin.delete_students');
			});
		// students end----------------------------------------


		// cours start--------------------------------------
			Route::group(['namespace' => 'Cours'], function(){
				Route::get('new-cours', 'coursController@create')->name('admin.add_new_cours');
				Route::post('new-cours/save', 'coursController@store')->name('admin.save_new_cours');

				Route::get('cours/list', 'coursController@index')->name('admin.all_cours');
				
				Route::get('edit-cours/{id?}', 'coursController@edit')->name('admin.update_cours');
				Route::post('process-edit-cours/{id?}', 'coursController@edit_process')->name('admin.update_process_cours');
				
				Route::get('trash-list-cours/{id?}', 'coursController@trash_list')->name('admin.all_trash_cours');
				Route::get('trash-cours/{id?}', 'coursController@trash')->name('admin.trash_cours');
				Route::get('restor-cours/{id?}', 'coursController@restore')->name('admin.restore_cours');
				
				Route::get('delete-cours/{id?}', 'coursController@delete')->name('admin.delete_cours');
			});
		// cours end----------------------------------------
		

		// page_section start--------------------------------------
			Route::group(['namespace' => 'Page_section'], function(){
				Route::get('new-page-section', 'page_sectionController@create')->name('admin.add_new_page_section');
				Route::post('new-page_section/save', 'page_sectionController@store')->name('admin.save_new_page_section');

				Route::get('page_section/list', 'page_sectionController@index')->name('admin.all_page_section');
				
				Route::get('edit-page_section/{id?}', 'page_sectionController@edit')->name('admin.update_page_section');
				Route::post('process-edit-page_section/{id?}', 'page_sectionController@edit_process')->name('admin.update_process_page_section');
				
				Route::get('trash-list-page_section/{id?}', 'page_sectionController@trash_list')->name('admin.all_trash_page_section');
				Route::get('trash-page_section/{id?}', 'page_sectionController@trash')->name('admin.trash_page_section');
				Route::get('restor-page_section/{id?}', 'page_sectionController@restore')->name('admin.restore_page_section');
				
				Route::get('delete-page_section/{id?}', 'page_sectionController@delete')->name('admin.delete_page_section');
			});
		// page_section end----------------------------------------


		// news start--------------------------------------
		Route::group(['namespace' => 'News'], function(){
			Route::get('new-news', 'newsController@create')->name('admin.add_new_news');
			Route::post('new-news/save', 'newsController@store')->name('admin.save_new_news');

			Route::get('news', 'newsController@index')->name('admin.all_news');
			
			Route::get('edit-news/{id?}', 'newsController@edit')->name('admin.update_news');
			Route::post('process-edit-news/{id?}', 'newsController@edit_process')->name('admin.update_process_news');
			
			Route::get('trash-list-news/{id?}', 'newsController@trash_list')->name('admin.all_trash_news');
			Route::get('trash-news/{id?}', 'newsController@trash')->name('admin.trash_news');
			Route::get('restor-news/{id?}', 'newsController@restore')->name('admin.restore_news');
			
			Route::get('delete-news/{id?}', 'newsController@delete')->name('admin.delete_news');

			/*ajax request controller start*/
			Route::get('getsubcategoryByAjaxForNews', 'newsController@getsubcategoryByAjaxForNews')->name('admin.getsubcategoryByAjaxForNews');
			/*ajax request controller end*/
		});
		// news end----------------------------------------


		// pages start--------------------------------------
		Route::group(['namespace' => 'Pages'], function(){
			Route::get('new-pages', 'pagesController@create')->name('admin.add_new_pages');
			Route::post('new-pages/save', 'pagesController@store')->name('admin.save_new_pages');

			Route::get('pages/list', 'pagesController@index')->name('admin.all_pages');
			
			Route::get('edit-pages/{id?}', 'pagesController@edit')->name('admin.update_pages');
			Route::post('process-edit-pages/{id?}', 'pagesController@edit_process')->name('admin.update_process_pages');
			
			Route::get('trash-list-pages/{id?}', 'pagesController@trash_list')->name('admin.all_trash_pages');
			Route::get('trash-pages/{id?}', 'pagesController@trash')->name('admin.trash_pages');
			Route::get('restor-pages/{id?}', 'pagesController@restore')->name('admin.restore_pages');
			
			Route::get('delete-pages/{id?}', 'pagesController@delete')->name('admin.delete_pages');
		});
		// pages end----------------------------------------




		// faq start--------------------------------------
		Route::group(['namespace' => 'Faq'], function(){
			Route::get('new-faq', 'faqController@create')->name('admin.add_new_faq');
			Route::post('new-faq/save', 'faqController@store')->name('admin.save_new_faq');

			Route::get('faq/list', 'faqController@index')->name('admin.all_faq');
			
			Route::get('edit-faq/{id?}', 'faqController@edit')->name('admin.update_faq');
			Route::post('process-edit-faq/{id?}', 'faqController@edit_process')->name('admin.update_process_faq');
			
			Route::get('trash-list-faq/{id?}', 'faqController@trash_list')->name('admin.all_trash_faq');
			Route::get('trash-faq/{id?}', 'faqController@trash')->name('admin.trash_faq');
			Route::get('restor-faq/{id?}', 'faqController@restore')->name('admin.restore_faq');
			
			Route::get('delete-faq/{id?}', 'faqController@delete')->name('admin.delete_faq');
		});
		// faq end----------------------------------------
		

		// media start--------------------------------------
		Route::group(['namespace' => 'Media'], function(){
			Route::get('new-media', 'mediaController@create')->name('admin.add_new_media');
			Route::any('catAsJson', 'mediaController@catAsJson')->name('admin.catAsJson');
			Route::any('update_media_info', 'mediaController@update_media_info')->name('admin.update_media_info');
			Route::any('delete_media_info', 'mediaController@delete_media_info')->name('admin.delete_media_info');
		});
		// media end----------------------------------------




		// customer_feedback start--------------------------------------
			Route::group(['namespace' => 'Customer_feedback'], function(){
				Route::get('new-customer_feedback', 'customer_feedbackController@create')->name('admin.add_new_customer_feedback');
				Route::post('new-customer_feedback/save', 'customer_feedbackController@store')->name('admin.save_new_customer_feedback');

				Route::get('customer_feedback', 'customer_feedbackController@index')->name('admin.all_customer_feedback');
				
				Route::get('edit-customer_feedback/{id?}', 'customer_feedbackController@edit')->name('admin.update_customer_feedback');
				Route::post('process-edit-customer_feedback/{id?}', 'customer_feedbackController@edit_process')->name('admin.update_process_customer_feedback');
				
				Route::get('trash-list-customer_feedback/{id?}', 'customer_feedbackController@trash_list')->name('admin.all_trash_customer_feedback');
				Route::get('trash-customer_feedback/{id?}', 'customer_feedbackController@trash')->name('admin.trash_customer_feedback');
				Route::get('restor-customer_feedback/{id?}', 'customer_feedbackController@restore')->name('admin.restore_customer_feedback');
				
				Route::get('delete-customer_feedback/{id?}', 'customer_feedbackController@delete')->name('admin.delete_customer_feedback');
			});
		// customer_feedback end----------------------------------------


		// slider start--------------------------------------
			Route::group(['namespace' => 'Slider'], function(){
				Route::get('new-slider', 'sliderController@create')->name('admin.add_new_slider');
				Route::post('new-slider/save', 'sliderController@store')->name('admin.save_new_slider');

				Route::get('slider', 'sliderController@index')->name('admin.all_slider');
				
				Route::get('edit-slider/{id?}', 'sliderController@edit')->name('admin.update_slider');
				Route::post('process-edit-slider/{id?}', 'sliderController@edit_process')->name('admin.update_process_slider');
				
				Route::get('trash-list-slider/{id?}', 'sliderController@trash_list')->name('admin.all_trash_slider');
				Route::get('trash-slider/{id?}', 'sliderController@trash')->name('admin.trash_slider');
				Route::get('restor-slider/{id?}', 'sliderController@restore')->name('admin.restore_slider');
				
				Route::get('delete-slider/{id?}', 'sliderController@delete')->name('admin.delete_slider');
			});
		// slider end----------------------------------------



		// category start--------------------------------------
			Route::group(['namespace' => 'Category'], function(){
				Route::get('new-category', 'categoryController@create')->name('admin.add_new_category');
				Route::post('new-category/save', 'categoryController@store')->name('admin.save_new_category');

				Route::get('category', 'categoryController@index')->name('admin.all_category');
				
				Route::get('edit-category/{id?}', 'categoryController@edit')->name('admin.update_category');
				Route::post('process-edit-category/{id?}', 'categoryController@edit_process')->name('admin.update_process_category');
				
				Route::get('trash-list-category/{id?}', 'categoryController@trash_list')->name('admin.all_trash_category');
				Route::get('trash-category/{id?}', 'categoryController@trash')->name('admin.trash_category');
				Route::get('restor-category/{id?}', 'categoryController@restore')->name('admin.restore_category');
				
				Route::get('delete-category/{id?}', 'categoryController@delete')->name('admin.delete_category');
			});
		// category end----------------------------------------



		// subcategory start--------------------------------------
			Route::group(['namespace' => 'Subcategory'], function(){
				Route::get('new-subcategory', 'subcategoryController@create')->name('admin.add_new_subcategory');
				Route::post('new-subcategory/save', 'subcategoryController@store')->name('admin.save_new_subcategory');

				Route::get('subcategory', 'subcategoryController@index')->name('admin.all_subcategory');
				
				Route::get('edit-subcategory/{id?}', 'subcategoryController@edit')->name('admin.update_subcategory');
				Route::post('process-edit-subcategory/{id?}', 'subcategoryController@edit_process')->name('admin.update_process_subcategory');
				
				Route::get('trash-list-subcategory/{id?}', 'subcategoryController@trash_list')->name('admin.all_trash_subcategory');
				Route::get('trash-subcategory/{id?}', 'subcategoryController@trash')->name('admin.trash_subcategory');
				Route::get('restor-subcategory/{id?}', 'subcategoryController@restore')->name('admin.restore_subcategory');
				
				Route::get('delete-subcategory/{id?}', 'subcategoryController@delete')->name('admin.delete_subcategory');
			});
		// subcategory end----------------------------------------



		// sub_subcategory start--------------------------------------
			Route::group(['namespace' => 'Sub_subcategory'], function(){
				Route::get('new-sub_subcategory', 'sub_subcategoryController@create')->name('admin.add_new_sub_subcategory');
				Route::post('new-sub_subcategory/save', 'sub_subcategoryController@store')->name('admin.save_new_sub_subcategory');

				Route::get('sub_subcategory', 'sub_subcategoryController@index')->name('admin.all_sub_subcategory');
				
				Route::get('edit-sub_subcategory/{id?}', 'sub_subcategoryController@edit')->name('admin.update_sub_subcategory');
				Route::post('process-edit-sub_subcategory/{id?}', 'sub_subcategoryController@edit_process')->name('admin.update_process_sub_subcategory');
				
				Route::get('trash-list-sub_subcategory/{id?}', 'sub_subcategoryController@trash_list')->name('admin.all_trash_sub_subcategory');
				Route::get('trash-sub_subcategory/{id?}', 'sub_subcategoryController@trash')->name('admin.trash_sub_subcategory');
				Route::get('restor-sub_subcategory/{id?}', 'sub_subcategoryController@restore')->name('admin.restore_sub_subcategory');
				
				Route::get('delete-sub_subcategory/{id?}', 'sub_subcategoryController@delete')->name('admin.delete_sub_subcategory');
				Route::post('getSubcategoryByAjax', 'sub_subcategoryController@getSubcategoryByAjax')->name('admin.getSubcategoryByAjax');
			});
		// sub_subcategory end----------------------------------------


		/**********************************************************************************
		/*																				  */
		/*						Don't Touch To This Route Below 						  */
		/*																				  */
		/**********************************************************************************/

		// site settings start
			Route::get('backend/theme-settings/text_and_image', 'theme_settingsController@text_and_image')->name('admin.image_and_text');
			Route::post('backend/theme-settings/text_and_image', 'theme_settingsController@text_and_image_store')->name('admin.text_and_image_store');
			
			Route::get('backend/theme-settings', 'theme_settingsController@settings')->name('admin.settings');
			Route::post('backend/theme-settings', 'theme_settingsController@settings_store')->name('admin.settings_process');
		// site settings end


		// developer tools route start (Don't touch to this code)
		Route::group(['namespace' => 'Developer'], function(){
			/*aside menu start____________________________*/
			Route::get('create-aside-menu', 'menusController@create')->name('admin.new_aside_menu');
			Route::post('create-aside-menu', 'menusController@store')->name('admin.store_new_aside_menu');
			Route::get('all-aside-menu', 'menusController@all')->name('admin.all_aside_menu');
			Route::get('all-trash-aside-menu', 'menusController@all_trash')->name('admin.all_trash_aside_menu');
			Route::get('sort-aside-menu', 'menusController@sort')->name('admin.sort_aside_menu');
			Route::get('sort-aside-menu-ajax', 'menusController@sortByAjax')->name('admin.sort_aside_menu.sortByAjax');


			Route::get('aside-menu-view/{id}', 'menusController@view')->name('admin.aside_menu_view');
			Route::get('aside-menu-edit/{id}', 'menusController@edit')->name('admin.aside_menu_edit');
			Route::post('aside-menu-edit/{id}', 'menusController@edit_process')->name('admin.aside_menu_edit_process');
			Route::post('aside-menu-delete/{id}/{submenu_status}/{option_menu_status}', 'menusController@trash')->name('admin.aside_menu_delete');
			Route::get('restore-trash-aside-menu/{id}/{submenu_status}/{option_menu_status}', 'menusController@restore')->name('admin.restore_aside_menu');
			Route::post('aside-menu-permanently-delete/{id}/{submenu_status}/{option_menu_status}', 'menusController@delete')->name('admin.aside_menu_parmanently_delete');
			/*aside menu end____________________________*/


			/*aside menu dropdown start____________________________*/
			Route::get('create-aside-menu-dropdown', 'menusDropdownController@create')->name('admin.new_aside_menu_dropdown');
			Route::post('create-aside-menu-dropdown', 'menusDropdownController@store')->name('admin.store_aside_menu_dropdown');
			Route::get('all-aside-menu-dropdown', 'menusDropdownController@all')->name('admin.all_aside_menu_dropdown');
			Route::get('all-aside-menu-trashed-dropdown', 'menusDropdownController@all_trash')->name('admin.all_aside_menu_trash_dropdown');

			Route::get('aside-menu-dropdown-view/{id}', 'menusDropdownController@view')->name('admin.aside_menu_dropdown_view');
			Route::get('aside-menu-dropdown-edit/{id}', 'menusDropdownController@edit')->name('admin.aside_menu_dropdown_edit');
			Route::post('aside-menu-dropdown-edit/{id}', 'menusDropdownController@edit_process')->name('admin.aside_menu_dropdown_edit_process');
			Route::post('aside-menu-dropdown-delete/{id}', 'menusDropdownController@trash')->name('admin.aside_menu_dropdown_delete');
			Route::get('aside-menu-dropdown-restore-from-trash/{id}', 'menusDropdownController@restore')->name('admin.restore_aside_menu_dropdown');
			Route::post('aside-menu-dropdown-permanently-delete/{id}', 'menusDropdownController@delete')->name('admin.aside_menu_dropdown_parmanently_delete');
			/*aside menu dropdown end____________________________*/


			/*option menu start____________________________*/
			Route::get('create-option-menu', 'optionMenusController@create')->name('admin.new_option_menu');
			Route::post('create-option-menu', 'optionMenusController@store')->name('admin.store_option_menu');
			Route::get('all-option-menu', 'optionMenusController@all')->name('admin.all_option_menu');
			Route::get('all-trashed-option-menu', 'optionMenusController@all_trash')->name('admin.all_trash_option_menu');

			Route::get('option-menu-view/{id}', 'optionMenusController@view')->name('admin.option_menu_view');
			Route::get('option-menu-edit/{id}', 'optionMenusController@edit')->name('admin.option_menu_edit');
			Route::post('option-menu-edit/{id}', 'optionMenusController@edit_process')->name('admin.option_menu_edit_process');
			Route::post('option-menu-delete/{id}', 'optionMenusController@trash')->name('admin.option_menu_delete');
			Route::get('option-menu-restor-from-trash/{id}', 'optionMenusController@restore')->name('admin.restore_option_menu');
			Route::post('option-menu-permanently-delete/{id}', 'optionMenusController@delete')->name('admin.option_menu_parmanently_delete');

			Route::get('getDropdownMenuByAjax', 'optionMenusController@getDropdownMenuByAjax')->name('admin.getDropdownMenuByAjax');
			/*option menu end____________________________*/
		});
		// developer tools route end (Don't touch to this code)


		// admins start
			Route::get('create-admin', 'adminController@create')->name('admin.admin_create');
			Route::post('create-admin', 'adminController@store')->name('admin.admin_create_process');
			Route::get('all-admin', 'adminController@all')->name('admin.admin_all');

			Route::post('admin-profile', 'adminController@profile')->name('admin.admin_view');
			Route::get('admin-edit/{id}', 'adminController@edit')->name('admin.admin_edit');
			Route::post('admin-edit/{id}', 'adminController@edit_process')->name('admin.admin_edit_process');
			Route::post('admin-delete/{id}', 'adminController@delete')->name('admin.admin_delete');
			Route::post('admin-password-change', 'adminController@password_change')->name('admin.password_change');
		// admins end


		// privilege start
			Route::get('privilege', 'privilegeController@index')->name('admin.privilege');
			Route::post('privilege/save', 'privilegeController@store')->name('admin.privilege_set');
			Route::post('privilege/update', 'privilegeController@update')->name('admin.privilege_update');
		// privilege end


		// admin auth start
			Route::group(['namespace' => 'Auth'], function(){
				Route::get('admin', 'LoginController@showLoginForm')->name('admin.login');
				Route::post('admin-process', 'LoginController@login')->name('admin.login_process');
				Route::get('admin-process', 'LoginController@showLoginForm')->name('admin.login_process');
				Route::any('admin-logout', 'LoginController@logout')->name('admin.logout');
			});
		// admin auth end

		/**********************************************************************************
		/*																				  */
		/*						Don't Touch To This Route Above 						  */
		/*																				  */
		/**********************************************************************************/
	});
// admin controller end-------------------------------------------------------








//=========================================================================================================
// user controller start-----------------------------------------------------
	Auth::routes();
	Route::group(['namespace' => 'User'], function()
	{
		// for deshboard start
			Route::get('user/dashboard', 'dashboardController@index')->name('user.dashboard');
		Route::get('user/ad_blance_to_main_balance', 'dashboardController@ad_blance_to_main_balance')->name('user.ad_blance_to_main_balance');
		// for deshboard end

		// user profile start
			Route::get('user/profile/profile-update', 'dashboardController@profile_update')->name('user.profile_update');
			Route::any('user/profile/profile-update-process', 'dashboardController@profile_update_process')->name('user.profile_update_process');

			Route::get('user/profile/profile-img-update', 'dashboardController@profile_img_update')->name('user.profile_img_update');
			Route::any('user/profile/profile-img-update-process', 'dashboardController@profile_img_update_process')->name('user.profile_img_update_process');

			Route::get('user/profile/profile/password-change', 'dashboardController@password_update')->name('user.password_update');
			Route::any('user/profile/profile/password-change-process', 'dashboardController@password_update_process')->name('user.password_update_process');

			Route::get('user/profile/transection-change', 'dashboardController@transection_id_update')->name('user.transection_id_update');
			Route::any('user/profile/transection-change-process', 'dashboardController@transection_id_update_process')->name('user.transection_id_update_process');
		// user profile end


		// user/login auth start
			Route::group(['namespace' => 'Auth'], function(){
				Route::get('user/login', 'LoginController@showLoginForm')->name('user.login');
				Route::get('user/login-process', 'LoginController@showLoginForm')->name('user.login_process');
				Route::post('user/login-process', 'LoginController@login')->name('user.login_process');
				
				Route::get('user/redirect-back', function(){
					return redirect()->back();
				})->name('user.login_redirect_back');


				Route::any('user/logout', 'LoginController@logout')->name('user.logout');

				Route::get('user/register', 'RegisterController@showRegistrationForm')->name('user.register');
			});
			Route::post('user/register', 'RegisterController@index')->name('user.register');
		// user/login auth end

		Route::get('user/otp_code_generator', 'RegisterController@send_OTP_by_AJAX')->name('user.send_OTP_by_AJAX');
		Route::get('user/resend_otp_by_AJAX', 'RegisterController@resend_OTP_by_AJAX')->name('user.resend_OTP_by_AJAX');

		Route::get('user/check_otp_code_existance', 'RegisterController@check_otp_code_existance')->name('check_otp_code_existance');
		Route::get('user/phone_existance_check', 'RegisterController@phone_existance_check')->name('phone_existance_check');
	});

// user controller end-------------------------------------------------------
















// subscriber controller start-----------------------------------------------------
	Route::group(['namespace' => 'Subscriber'], function(){
		// for deshboard
		Route::get('subscriber/dashboard', 'dashboardController@index')->name('subscriber.dashboard');

		// subscriber auth start
		Route::group(['namespace' => 'Auth'], function(){
			Route::get('subscriber', 'LoginController@showLoginForm')->name('subscriber.login');
			Route::post('subscriber-process', 'LoginController@login')->name('subscriber.login_process');
			Route::post('subscriber', 'LoginController@logout')->name('subscriber.logout');
		});
		// subscriber auth end
	});
// subscriber controller end-------------------------------------------------------

//=========================================================================================================




Route::get('/cache-clear', function() {
    Artisan::call('cache:clear');
    return "Cache is cleared";
});
