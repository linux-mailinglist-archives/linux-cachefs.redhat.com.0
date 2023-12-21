Return-Path: <linux-cachefs+bncBDLIXLMFVAERBAHZSCWAMGQEBNIEBBQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id D865A81B747
	for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 14:24:17 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67f27673b1dsf7594426d6.0
        for <lists+linux-cachefs@lfdr.de>; Thu, 21 Dec 2023 05:24:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703165057; cv=pass;
        d=google.com; s=arc-20160816;
        b=V5g2I7AUSYjn97KR1oGrXkhSQnEFZTdy8OOdm+yvEnUFF3VIHa27hvoqCJtbJobrhx
         69Mjw6eMvbcdzVTfigqxTc2zPvlVrQFHQLZCdQV8v4o7zOxLsbSQYBHzFDH5l+CgFHeT
         xMtYIVEuJnC2i7k802bHbVGBZ2ZY3pyrMKu9QvCCMxqTptNNwp2xlfAtNt+nkpEppAf6
         bo/nnF/hHDXSRgzcBpIT0hNRmiowcVVMrubytMgqhG3YtsdsiSXtQflJlyara3HSz9V+
         AXxwMp98bunrzPYl6/1jBctCpehS0vYnGZ0tUSuI7kKMN44xgRaRIf39hzuwbdTcDqQs
         3RjQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=ufSAwEfHu4yqkvEDQn5rtbhH/R41NBPqCwugFsS1cLo=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=0u4rOAsaVQPDfT46DptUqCoofO46Ttr2WjjUID8Zt9F6hNjzACeD1m/PgQjya27Fz2
         3SmGRglLK0kzscFsI8695sxBrpfxbOi4Du/X6L5JuOcf5jZZoDOtjAVoYNZ8gGqW+aHG
         fDQjUlcrHqxbvIFnYdBLuko8LmbKc6Vw7TCuNrg1gPxd1FDZlzPYRVEqaaau5cAR8cwI
         3HTUTY25wx29cdLZvqN2nL3HM3pRZcKwDHZ5TcLNHtnNDR6ipYFCxdhPyFj92l2jW7R+
         akWTihEkzSdUWIf+zCXl7ca7MdUzjHNsr3qtWUIph7DN7KKyHYFJ049bmBkKtfPkvlsM
         2pNg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165057; x=1703769857;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufSAwEfHu4yqkvEDQn5rtbhH/R41NBPqCwugFsS1cLo=;
        b=q9IHld4dyJ3LGep6cyw7WyqhjxjqvUOX9zwWdp0Ke0adJDz4IqxljbmVfWuvd99lg5
         lxo1kGCqrg8N4IDuTKxnlSH1tibDkGnFWknmQwvYbAv/MT7tWFic59s3aknxHXjO1mX5
         zigAlREkM349nxRcuBql7eDwHbyI80QFARmJ2RTQgKnf8ge/n0xz34ZRdhSWjvbhH4oV
         8xOrwrM+d0eepBX67vBaWEL4LYXg9/i2ThHVGvYyPNlXh9ufLzEf22DR9A7M/al5ic7S
         3up3M+1dVTokWyNr6pRL6Ly7XeNld22W1SUQbLRmgHxINUXEcFPbjAEo3lxTcu0XcUkH
         POTA==
X-Gm-Message-State: AOJu0Yyee2P6z9jx7SC3SH4MOt2z2R4EBijy7dOYDFysWFyRbzDsXevk
	Sz20z7LToz84eEfKB4n8cdMLWg==
X-Google-Smtp-Source: AGHT+IEhRaYL2iMgNL30tN57927vrUX0uE86IOfoIZtBd0MBUPrZEMekX+9MZw9kv93aZQahL30Ozg==
X-Received: by 2002:a0c:c58d:0:b0:67a:8f89:a631 with SMTP id a13-20020a0cc58d000000b0067a8f89a631mr17285691qvj.23.1703165056706;
        Thu, 21 Dec 2023 05:24:16 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:4113:b0:67f:4e7a:d81e with SMTP id
 kc19-20020a056214411300b0067f4e7ad81els1112206qvb.2.-pod-prod-03-us; Thu, 21
 Dec 2023 05:24:15 -0800 (PST)
X-Received: by 2002:a0c:ee47:0:b0:67a:99aa:38b0 with SMTP id m7-20020a0cee47000000b0067a99aa38b0mr18605896qvs.44.1703165055360;
        Thu, 21 Dec 2023 05:24:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703165055; cv=none;
        d=google.com; s=arc-20160816;
        b=tJndcIsGVoE3cvN/xFCkfgco180Th6I1lTeSGxC1V9QNxWwz4eZtyEB2ru+p4dJ7v1
         +8G0/k5c6imh/G5FBx53Gfk2WTbfwRUD1vroITtPF4H78lngIspiPbd84tHw7dfERf2r
         FxulGRXfAv7c9TY74tJyOkLRcjua+9eYg1l0QkpD9vwFH4DERv+6Lsmm3AjE//ZERVBW
         4XC23ucbfUdPATyv7QAInlyMTvhKVgIM8BlAYdGJ06FX1ZwjwvZuWFQFcQkjREtG4Yj5
         S0lSV8zfJMwknAnap7yT1Rjj3O9+B8i4XF4XKDKcaGmZdzSCyWG2zzmUXhKVqJaY/YtH
         QjDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=kkbmPIA2D8CaTkkPQxJ1F8pFhLqrNM5ws1a493MJpSM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=SOoxabqNjAXQpFymdB084DH3CIDQ7W6fZxyBX+4QpaZiKTYv5TjWqY0Ry390le+6lj
         7mugOrmYI+arsT4QlVmK7s+5HtRMvoM041e2AM6d/1Tqse6xKEcaLOxojphBhQPh3i82
         qgB5x7QAnqqUgdMvEbAI8+DMfzYDTpbZTUfEod5qDhzPwdj5SpRnBQI66UpeW2Fddjja
         s8L+rCeuDOJeLm2mDU9Rkl/c4rVJhksU3j3LpOjDX24Q7LqI2YGCi733StyHQvc0dvRM
         rFRc2Kc015858Xt2nw8Gk19K1X3LgbmfQXqGqwX8HQKTdKPAsSr9UXrmhxj3rr4KncVs
         3LqA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id w7-20020a0cdf87000000b0067f3f1efa29si2043935qvl.53.2023.12.21.05.24.15
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:24:15 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470--zJgCH_TPli4-3y1gemZPg-1; Thu,
 21 Dec 2023 08:24:13 -0500
X-MC-Unique: -zJgCH_TPli4-3y1gemZPg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 522C91C06502
	for <linux-cachefs@gapps.redhat.com>; Thu, 21 Dec 2023 13:24:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4EBBA492BFA; Thu, 21 Dec 2023 13:24:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5FBE5492BE6;
	Thu, 21 Dec 2023 13:24:10 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 02/40] afs: Automatically generate trace tag enums
Date: Thu, 21 Dec 2023 13:22:57 +0000
Message-ID: <20231221132400.1601991-3-dhowells@redhat.com>
In-Reply-To: <20231221132400.1601991-1-dhowells@redhat.com>
References: <20231221132400.1601991-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Automatically generate trace tag enums from the symbol -> string mapping
tables rather than having the enums as well, thereby reducing duplicated
data.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-afs@lists.infradead.org
cc: linux-fsdevel@vger.kernel.org
---
 include/trace/events/afs.h | 233 +++++--------------------------------
 1 file changed, 27 insertions(+), 206 deletions(-)

diff --git a/include/trace/events/afs.h b/include/trace/events/afs.h
index cfcd6452c156..597677acc6b1 100644
--- a/include/trace/events/afs.h
+++ b/include/trace/events/afs.h
@@ -18,97 +18,6 @@
 #ifndef __AFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 #define __AFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
 
-enum afs_call_trace {
-	afs_call_trace_alloc,
-	afs_call_trace_free,
-	afs_call_trace_get,
-	afs_call_trace_put,
-	afs_call_trace_wake,
-	afs_call_trace_work,
-};
-
-enum afs_server_trace {
-	afs_server_trace_alloc,
-	afs_server_trace_callback,
-	afs_server_trace_destroy,
-	afs_server_trace_free,
-	afs_server_trace_gc,
-	afs_server_trace_get_by_addr,
-	afs_server_trace_get_by_uuid,
-	afs_server_trace_get_caps,
-	afs_server_trace_get_install,
-	afs_server_trace_get_new_cbi,
-	afs_server_trace_get_probe,
-	afs_server_trace_give_up_cb,
-	afs_server_trace_purging,
-	afs_server_trace_put_call,
-	afs_server_trace_put_cbi,
-	afs_server_trace_put_find_rsq,
-	afs_server_trace_put_probe,
-	afs_server_trace_put_slist,
-	afs_server_trace_put_slist_isort,
-	afs_server_trace_put_uuid_rsq,
-	afs_server_trace_update,
-};
-
-
-enum afs_volume_trace {
-	afs_volume_trace_alloc,
-	afs_volume_trace_free,
-	afs_volume_trace_get_alloc_sbi,
-	afs_volume_trace_get_cell_insert,
-	afs_volume_trace_get_new_op,
-	afs_volume_trace_get_query_alias,
-	afs_volume_trace_put_cell_dup,
-	afs_volume_trace_put_cell_root,
-	afs_volume_trace_put_destroy_sbi,
-	afs_volume_trace_put_free_fc,
-	afs_volume_trace_put_put_op,
-	afs_volume_trace_put_query_alias,
-	afs_volume_trace_put_validate_fc,
-	afs_volume_trace_remove,
-};
-
-enum afs_cell_trace {
-	afs_cell_trace_alloc,
-	afs_cell_trace_free,
-	afs_cell_trace_get_queue_dns,
-	afs_cell_trace_get_queue_manage,
-	afs_cell_trace_get_queue_new,
-	afs_cell_trace_get_vol,
-	afs_cell_trace_insert,
-	afs_cell_trace_manage,
-	afs_cell_trace_put_candidate,
-	afs_cell_trace_put_destroy,
-	afs_cell_trace_put_queue_fail,
-	afs_cell_trace_put_queue_work,
-	afs_cell_trace_put_vol,
-	afs_cell_trace_see_source,
-	afs_cell_trace_see_ws,
-	afs_cell_trace_unuse_alias,
-	afs_cell_trace_unuse_check_alias,
-	afs_cell_trace_unuse_delete,
-	afs_cell_trace_unuse_fc,
-	afs_cell_trace_unuse_lookup,
-	afs_cell_trace_unuse_mntpt,
-	afs_cell_trace_unuse_no_pin,
-	afs_cell_trace_unuse_parse,
-	afs_cell_trace_unuse_pin,
-	afs_cell_trace_unuse_probe,
-	afs_cell_trace_unuse_sbi,
-	afs_cell_trace_unuse_ws,
-	afs_cell_trace_use_alias,
-	afs_cell_trace_use_check_alias,
-	afs_cell_trace_use_fc,
-	afs_cell_trace_use_fc_alias,
-	afs_cell_trace_use_lookup,
-	afs_cell_trace_use_mntpt,
-	afs_cell_trace_use_pin,
-	afs_cell_trace_use_probe,
-	afs_cell_trace_use_sbi,
-	afs_cell_trace_wait,
-};
-
 enum afs_fs_operation {
 	afs_FS_FetchData		= 130,	/* AFS Fetch file data */
 	afs_FS_FetchACL			= 131,	/* AFS Fetch file ACL */
@@ -202,121 +111,6 @@ enum yfs_cm_operation {
 	yfs_CB_CallBack			= 64204,
 };
 
-enum afs_edit_dir_op {
-	afs_edit_dir_create,
-	afs_edit_dir_create_error,
-	afs_edit_dir_create_inval,
-	afs_edit_dir_create_nospc,
-	afs_edit_dir_delete,
-	afs_edit_dir_delete_error,
-	afs_edit_dir_delete_inval,
-	afs_edit_dir_delete_noent,
-};
-
-enum afs_edit_dir_reason {
-	afs_edit_dir_for_create,
-	afs_edit_dir_for_link,
-	afs_edit_dir_for_mkdir,
-	afs_edit_dir_for_rename_0,
-	afs_edit_dir_for_rename_1,
-	afs_edit_dir_for_rename_2,
-	afs_edit_dir_for_rmdir,
-	afs_edit_dir_for_silly_0,
-	afs_edit_dir_for_silly_1,
-	afs_edit_dir_for_symlink,
-	afs_edit_dir_for_unlink,
-};
-
-enum afs_eproto_cause {
-	afs_eproto_bad_status,
-	afs_eproto_cb_count,
-	afs_eproto_cb_fid_count,
-	afs_eproto_cellname_len,
-	afs_eproto_file_type,
-	afs_eproto_ibulkst_cb_count,
-	afs_eproto_ibulkst_count,
-	afs_eproto_motd_len,
-	afs_eproto_offline_msg_len,
-	afs_eproto_volname_len,
-	afs_eproto_yvl_fsendpt4_len,
-	afs_eproto_yvl_fsendpt6_len,
-	afs_eproto_yvl_fsendpt_num,
-	afs_eproto_yvl_fsendpt_type,
-	afs_eproto_yvl_vlendpt4_len,
-	afs_eproto_yvl_vlendpt6_len,
-	afs_eproto_yvl_vlendpt_type,
-};
-
-enum afs_io_error {
-	afs_io_error_cm_reply,
-	afs_io_error_extract,
-	afs_io_error_fs_probe_fail,
-	afs_io_error_vl_lookup_fail,
-	afs_io_error_vl_probe_fail,
-};
-
-enum afs_file_error {
-	afs_file_error_dir_bad_magic,
-	afs_file_error_dir_big,
-	afs_file_error_dir_missing_page,
-	afs_file_error_dir_name_too_long,
-	afs_file_error_dir_over_end,
-	afs_file_error_dir_small,
-	afs_file_error_dir_unmarked_ext,
-	afs_file_error_mntpt,
-	afs_file_error_writeback_fail,
-};
-
-enum afs_flock_event {
-	afs_flock_acquired,
-	afs_flock_callback_break,
-	afs_flock_defer_unlock,
-	afs_flock_extend_fail,
-	afs_flock_fail_other,
-	afs_flock_fail_perm,
-	afs_flock_no_lockers,
-	afs_flock_release_fail,
-	afs_flock_silly_delete,
-	afs_flock_timestamp,
-	afs_flock_try_to_lock,
-	afs_flock_vfs_lock,
-	afs_flock_vfs_locking,
-	afs_flock_waited,
-	afs_flock_waiting,
-	afs_flock_work_extending,
-	afs_flock_work_retry,
-	afs_flock_work_unlocking,
-	afs_flock_would_block,
-};
-
-enum afs_flock_operation {
-	afs_flock_op_copy_lock,
-	afs_flock_op_flock,
-	afs_flock_op_grant,
-	afs_flock_op_lock,
-	afs_flock_op_release_lock,
-	afs_flock_op_return_ok,
-	afs_flock_op_return_eagain,
-	afs_flock_op_return_edeadlk,
-	afs_flock_op_return_error,
-	afs_flock_op_set_lock,
-	afs_flock_op_unlock,
-	afs_flock_op_wake,
-};
-
-enum afs_cb_break_reason {
-	afs_cb_break_no_break,
-	afs_cb_break_no_promise,
-	afs_cb_break_for_callback,
-	afs_cb_break_for_deleted,
-	afs_cb_break_for_lapsed,
-	afs_cb_break_for_s_reinit,
-	afs_cb_break_for_unlink,
-	afs_cb_break_for_v_break,
-	afs_cb_break_for_volume_callback,
-	afs_cb_break_for_zap,
-};
-
 #endif /* end __AFS_DECLARE_TRACE_ENUMS_ONCE_ONLY */
 
 /*
@@ -391,6 +185,7 @@ enum afs_cb_break_reason {
 	EM(afs_cell_trace_unuse_fc,		"UNU fc    ") \
 	EM(afs_cell_trace_unuse_lookup,		"UNU lookup") \
 	EM(afs_cell_trace_unuse_mntpt,		"UNU mntpt ") \
+	EM(afs_cell_trace_unuse_no_pin,		"UNU no-pin") \
 	EM(afs_cell_trace_unuse_parse,		"UNU parse ") \
 	EM(afs_cell_trace_unuse_pin,		"UNU pin   ") \
 	EM(afs_cell_trace_unuse_probe,		"UNU probe ") \
@@ -614,6 +409,32 @@ enum afs_cb_break_reason {
 	EM(afs_cb_break_for_volume_callback,	"break-v-cb")		\
 	E_(afs_cb_break_for_zap,		"break-zap")
 
+/*
+ * Generate enums for tracing information.
+ */
+#ifndef __AFS_GENERATE_TRACE_ENUMS_ONCE_ONLY
+#define __AFS_GENERATE_TRACE_ENUMS_ONCE_ONLY
+
+#undef EM
+#undef E_
+#define EM(a, b) a,
+#define E_(a, b) a
+
+enum afs_call_trace		{ afs_call_traces } __mode(byte);
+enum afs_cb_break_reason	{ afs_cb_break_reasons } __mode(byte);
+enum afs_cell_trace		{ afs_cell_traces } __mode(byte);
+enum afs_edit_dir_op		{ afs_edit_dir_ops } __mode(byte);
+enum afs_edit_dir_reason	{ afs_edit_dir_reasons } __mode(byte);
+enum afs_eproto_cause		{ afs_eproto_causes } __mode(byte);
+enum afs_file_error		{ afs_file_errors } __mode(byte);
+enum afs_flock_event		{ afs_flock_events } __mode(byte);
+enum afs_flock_operation	{ afs_flock_operations } __mode(byte);
+enum afs_io_error		{ afs_io_errors } __mode(byte);
+enum afs_server_trace		{ afs_server_traces } __mode(byte);
+enum afs_volume_trace		{ afs_volume_traces } __mode(byte);
+
+#endif /* end __AFS_GENERATE_TRACE_ENUMS_ONCE_ONLY */
+
 /*
  * Export enum symbols via userspace.
  */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

