CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `pageTitle` varchar(150) DEFAULT 'No Title ',
  `content` text,
  `status` int(11) DEFAULT '1',
  PRIMARY KEY (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1



ALTER TABLE `jobseekers`
DROP `Xml`,
DROP `BlogUrl`,
DROP `JobPrompt`,
DROP `SiteId`,
DROP `Res_Phone_Auth`,
DROP `KioskID`,
DROP `BranchID`,
DROP `Res_Cnt`,
DROP `Mob_Cnt`,
DROP `Current_Resume`,
DROP `Block_Comp`,
DROP `Name_Flag`,
DROP `Email_Flag`,
DROP `Mailing_Flag`,
DROP `Contact_Flag`,
DROP `Shield_Type`,
DROP `Res_P_Status`,
DROP `Res_UP_Status`,
DROP `Res_UM_Status`,
DROP `Res_Mod_Status`,
DROP `Res_UMod_Status`,
DROP `Delete_Oth_Res`,
DROP `AutoApply`,
DROP `EmailActive`;



ALTER TABLE jobseekers modify UserId varchar(50);
ALTER TABLE jobseekers DROP primary key;

ALTER TABLE jobseekers add column jsId int auto_increment primary key first;


CREATE TABLE js_profile (
profileId int not null auto_increment primary key ,
jsId int not null ,
headline varchar(200) null default "No Headline",
curDesignation varchar(30) default "Not Mentioned",
curCompanyId int null,
curLocation int default "0",
prefLocation int default "0",
functionalArea int ,
curRole char(30) default "Not Available",
industryId int ,
totExp varchar(10) default "0",
salary float(2.2) default "0.0",
highestEducation int default "0",
keySkils varchar(500) default "Not Available",
dateAdded datetime ,
dateModified timestamp default current_timestamp on update current_timestamp);

ALTER TABLE cj_ch_jobseekers_res_det ADD COLUMN jsId int NOT NULL AFTER Res_Id;




DROP TABLE `accounts`, `automatch`, `automatch_history`, `autosuggest_list`, `bc_consultantgroups`, `bc_consultants`, `bc_consultants_new`, `blockedinvitation`, `blockedreminders`, `bouncemails`, `broadcastdetails`, `cjbmmembers`, `cj_bmmembers`, `cj_ch_edu_spec`, `cj_ch_jobprompt`, `cj_ch_jobprompt_duplicate`, `cj_ch_jobseekers_res_det_duplicate`, `cj_ch_js_bday_rs_discount`, `cj_ch_js_coverletter`, `cj_ch_js_coverletter_duplicate`, `cj_ch_js_credentials`, `cj_ch_js_credentials_duplicate`, `cj_ch_js_del_info`, `cj_ch_js_itskills`, `cj_ch_js_itskills_duplicate`, `cj_ch_js_lang`, `cj_ch_js_lang_duplicate`, `cj_ch_js_newsletter`, `cj_ch_js_newsletter_duplicate`, `cj_ch_js_womenday_rs_discount`, `cj_ch_prof_det_duplicate`, `cj_cst_mailing_list`, `cj_cst_mailing_list_details`, `cj_cst_sms_list`, `cj_cst_sms_list_details`, `cj_emp_dirlistings_contact_cmp`, `cj_emp_dirlistings_review`, `cj_emp_jobpost_qual`, `cj_emp_sh_arcsvd_det`, `cj_im_email_alert`, `cj_im_employer`, `cj_im_jobpost`, `cj_im_jobseeker`, `cj_jobs_on_phone`, `cj_job_list`, `cj_js_ivr_track`, `cj_microsite_cadd`, `cj_rs_sms_track`, `cj_sms_alert_js`, `cj_sms_apply_js`, `cj_sms_detail_js`, `cj_sms_detail_log`, `cj_sms_forward_cv_js`, `cj_sms_transfail_js`, `cj_widget_track`, `clickjobs_branches`, `cmp_code`, `conversations`, `CountInfo`, `cse`, `cseprivilege`, `cst`, `custom_payment`, `easycart_transaction`, `empsms`, `empviewlist`, `emp_feat`, `emp_logo`, `emp_pack`, `emp_pack_feat`, `emp_pack_price`, `emp_report_invalidno`, `emp_search_session`, `emp_sentmail`, `emp_stat`, `emp_templates`, `featured_listings`, `format_error`, `friends_network`, `indexq`, `indexq_consultants`, `indexq_dirlistings`, `indexq_emailalert`, `indexq_js`, `interviewschedular`, `invalidids`, `invitation`, `invitation_final`, `invitation_uniq`, `invite_sendmail`, `jobapplications_duplicate`, `jobpost_duplicate`, `jobseekers_duplicate`, `job_list_for_bm`, `job_repost`, `job_repost_userid`, `js_earnings`, `js_earnings_dec29_tmp`, `js_earnings_nov17`, `js_earnings_summary`, `js_earnings_summary_apr5`, `js_earnings_summary_dec29`, `js_earnings_summary_tmp`, `js_emp_report_details`, `js_payment_contact_details`, `js_recommended_jobs`, `js_redeem_history`, `js_relation`, `js_resume_viewlist`, `js_resume_viewlist_org`, `js_vs_count`, `linkdetails`, `mailer`, `microsite`, `missing_resume`, `monthly_earnings_report`, `monthly_newsletter`, `payment_transaction`, `pay_citiauth`, `pay_cititrace`, `pending_automatchid`, `pending_jobapplication_mail`, `plansowned`, `plan_sms`, `prev_employer_duplicate`, `recommendation`, `registration_details`, `release_order`, `release_order_details`, `reminder`, `reminder_invitation_count`, `rep_js_master`, `rep_online_stat`, `rep_online_stat_old`, `resumeassessment`, `resumelock`, `resumevalidate`, `resume_assessment_remark`, `resume_assessment_report`, `res_feat`, `res_pack`, `res_pack_feat`, `res_pack_feat_diwali_offer`, `res_pack_feat_yearendsale2010`, `res_special_pack`, `RG_MAILER`, `salary_cmp_det`, `salary_graph`, `salary_graph_old`, `salary_graph_populate`, `salesincharge`, `salesUser`, `SearchEditFields`, `secondary_email`, `secondary_email_archive`, `session_clust_emp`, `session_clust_js`, `smspayment`, `statistics`, `tmp_mailer`, `tm_js_details`, `tm_resume_lock`, `tm_tc_comments`, `toolbarcount`, `transactions`, `validsmsreport`, `webservice_apilog`, `webservice_authentication`, `webservice_capdetails`, `webservice_details`, `webservice_jobapplications`, `web_notification`,`payment_master`;
DROP TABLE action_history;
DROP TABLE `employer_count`, `employer_products`, `emppreference`, `events`, `jobapplications`, `jobpost`, `jobpost_mis`;


