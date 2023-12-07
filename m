Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNHQZCVQMGQEW7RAFQY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B388093A3
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:25:09 +0100 (CET)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-42592a3a6c9sf13768111cf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:25:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984308; cv=pass;
        d=google.com; s=arc-20160816;
        b=EyRHrJoqwMEXEPZUHaUqRVmD7VuqKFixTpp3W0eRKM4BM/pAwH6DwATJz1sygk9XZH
         Okl5yOBup8RP31wQFDNhSPNyDWzije27S48eWlMIA+KhhlBjY8mnuOM1UzY+PZe1qqyP
         CxdDM9rKHOJI3UQUcFo6vfG87aqd2eCrruPTPaxpm7Nt5fon8NCZ+Zhq+Nko4OrqpC9N
         AhuExEujEDFOImD26J4QlC2EYShAbt52qqzGRCz+jMTcAPqaSfW1qNjY9KU9kaPcWA/P
         Bfj/8akvpSfbzVNUWgZpHx22R/Igr4BkosTD7BoThYY/f1VuVLulWZbH7Vy3jn2MX2YZ
         JhCQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=qwvWzfcBqm7i44zS8dIXlOgzijLh8lqXNr/BAiqrOQE=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=gTaABRpPZAFgQUVwxsrONfEBv7n/ML9eePHkbTWwK84e3t5Lfk3SKo1fy7xcx1mpKo
         tupXszpcTT9BRMIdGnr5OAjQ8sYltljlK67gh9zfZ9zRZIGgMBSkMX4FAJEySoRYNOWJ
         SIVplCgzbOodDgVBZWVHrrBjUMBQEy5sKjzqbiYdoUayN+bMamVA+IWJ+kwvzSsHaoOU
         Xi5T50mTcY29xwIjiJk16JqvHnWlFPK+AjBc+RzDftzgei9QJul4o3WLeiIy5whg69HC
         ClxwcvAepXpoxhC8XQZ0fNj/XmpfRBlNPSwuVYX0X2w9I94F1ZBIQZXwulANqj04LSPB
         ATXg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984308; x=1702589108;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qwvWzfcBqm7i44zS8dIXlOgzijLh8lqXNr/BAiqrOQE=;
        b=HFKSbtLEEockzsuIkZOcY2SGIwL1Qu7evYBkoQzKtCU3YjDW0qNeGeQ87R4/fUDfvj
         P4Nw4d28k3Hh6yWwcofaYKbqU21y3/FnNLpcy9lTN9AjWn/0UdBvqlXf/EtDQRME+VeW
         f1gA/uTZeMQvRtrhmt8mXeeRyjxdRPSoQosgRcF9wPd79RDTT1LC9wVTnH7/EfMOS31h
         SUo843H5zNZm5UhgMUXQYCtm1GCiVMY/unj2R5VDBgFxmwUSkPHPBmxK4IVm2wA8EDLe
         LJR8avXtlvwCvfQDzc58AIBaEmgYJCKBiO/MvTlm5fU83brIZ2PGY9FLnMZyWtfVw+1L
         h6wA==
X-Gm-Message-State: AOJu0YxOn1ZfeqM+wvK0naET/017C/2vP5aoj9xsER0hiOSo1NDJFpi2
	M8XP6G/2xT/ZCecQL2xpetaGgw==
X-Google-Smtp-Source: AGHT+IGY59IzZ6G6ZYYm+7MdCWJGF2D1R9wG12UOmAEcQ8uzTEwMHd7hzNtH+GDKahtsYYaIT6nnZA==
X-Received: by 2002:ac8:5ad0:0:b0:41c:d62b:fb51 with SMTP id d16-20020ac85ad0000000b0041cd62bfb51mr7805975qtd.26.1701984308618;
        Thu, 07 Dec 2023 13:25:08 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:651:b0:423:7e09:49c8 with SMTP id
 a17-20020a05622a065100b004237e0949c8ls2655616qtb.1.-pod-prod-00-us; Thu, 07
 Dec 2023 13:25:08 -0800 (PST)
X-Received: by 2002:a05:620a:8ec7:b0:77b:bfc4:4e13 with SMTP id rg7-20020a05620a8ec700b0077bbfc44e13mr2538991qkn.18.1701984308082;
        Thu, 07 Dec 2023 13:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984308; cv=none;
        d=google.com; s=arc-20160816;
        b=O/N5yJHXLqS/1n8o7Hkod/rbiuiXh4pQ9n+DkX7YrwuVGqU9ThtpJGAmJk4aHaSnvU
         ndBOivxgsyQ3g8zOmqaunB683+l9cii5ixua+L/NA3HFG45OALcmj6Z9ny/GMHeoOMwq
         l5BOPMwXzUVyEvQCarZIoaL4G4ObKw9wZoM3ikqrg2GDo746kv2ac+lvV/9SkAo5qyGb
         t/Ayz8lGQxxfIHcre1v/22cAUIgL93NFbz+PrZQLfqOpZU5gyPgU3yfxi27xsAy4YGFJ
         b5fe0VWdgE92rcGa7nloRjkXvHLan3NYo63ler/K/P3mb0z0Ycpi21GIP9lQJ2yahWeC
         EPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=sYv4ALytdU7gz5Vn/YD7YislK95lkFmM2d1IQa0OIPk=;
        fh=sYq5GRr4z4u7NkcTE0XnshsPQiXi0MpumQuI5P4a1/E=;
        b=NmWllWxiWqMoQ9RsiLIlcCxguqKrfez0lr/DmgqWiO2S3be2rwI04peV+vbf/WtouZ
         psBfoQXlzaTDdDi0XONRzIrmf91w9077YllzSpnHr4xpU/bkDNtkQP6YZvwcrbWSP92S
         kZBlu4NsGTIU+UJVF0i2xOs3kkQAMjp7yQuEQhOUYDhWSaR1ns8av2n1I0UXQZvnjC8O
         SglgNk+/fG0oTF9ti+Emi+k99LOEtZRYMwHOBK7CKp0H2CSqaoeMbUpSEw+2H83UpyHu
         BVL5rNaN5zPedeTgIqa8qSaEYdNoJmfV5pzZy1yHnOYHRqLWkYLFK27OzlM4x+MtoTob
         97LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id 18-20020a05620a04d200b0077dca498345si525122qks.719.2023.12.07.13.25.07
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-mYmOgQ1NN8y8jho-BRD_YQ-1; Thu,
 07 Dec 2023 16:25:06 -0500
X-MC-Unique: mYmOgQ1NN8y8jho-BRD_YQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 282B2386A0A9
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:25:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 2529C492C29; Thu,  7 Dec 2023 21:25:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1A5A2492BE6;
	Thu,  7 Dec 2023 21:25:03 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v3 50/59] cifs: Replace cifs_writedata with a wrapper around netfs_io_subrequest
Date: Thu,  7 Dec 2023 21:21:57 +0000
Message-ID: <20231207212206.1379128-51-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
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

Replace the cifs_writedata struct with the same wrapper around
netfs_io_subrequest that was used to replace cifs_readdata.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  | 30 +++------------
 fs/smb/client/cifsproto.h | 16 ++++++--
 fs/smb/client/cifssmb.c   |  9 ++---
 fs/smb/client/file.c      | 79 ++++++++++++++++-----------------------
 fs/smb/client/smb2pdu.c   |  9 ++---
 fs/smb/client/smb2proto.h |  3 +-
 6 files changed, 58 insertions(+), 88 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index ed456c6a2752..0ca70c0581af 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -244,7 +244,6 @@ struct cifs_fattr;
 struct smb3_fs_context;
 struct cifs_fid;
 struct cifs_io_subrequest;
-struct cifs_writedata;
 struct cifs_io_parms;
 struct cifs_search_info;
 struct cifsInodeInfo;
@@ -418,8 +417,7 @@ struct smb_version_operations {
 	/* async read from the server */
 	int (*async_readv)(struct cifs_io_subrequest *);
 	/* async write to the server */
-	int (*async_writev)(struct cifs_writedata *,
-			    void (*release)(struct kref *));
+	int (*async_writev)(struct cifs_io_subrequest *);
 	/* sync read from the server */
 	int (*sync_read)(const unsigned int, struct cifs_fid *,
 			 struct cifs_io_parms *, unsigned int *, char **,
@@ -1450,35 +1448,17 @@ struct cifs_io_subrequest {
 #endif
 	struct cifs_credits		credits;
 
-	// TODO: Remove following elements
-	struct list_head		list;
-	struct completion		done;
-	struct work_struct		work;
-	struct iov_iter			iter;
-	__u64				offset;
-	unsigned int			bytes;
-};
+	enum writeback_sync_modes	sync_mode;
+	bool				uncached;
+	struct bio_vec			*bv;
 
-/* asynchronous write support */
-struct cifs_writedata {
-	struct kref			refcount;
+	// TODO: Remove following elements
 	struct list_head		list;
 	struct completion		done;
-	enum writeback_sync_modes	sync_mode;
 	struct work_struct		work;
-	struct cifsFileInfo		*cfile;
-	struct cifs_aio_ctx		*ctx;
 	struct iov_iter			iter;
-	struct bio_vec			*bv;
 	__u64				offset;
-	pid_t				pid;
 	unsigned int			bytes;
-	int				result;
-	struct TCP_Server_Info		*server;
-#ifdef CONFIG_CIFS_SMB_DIRECT
-	struct smbd_mr			*mr;
-#endif
-	struct cifs_credits		credits;
 };
 
 /*
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 49ffa657893b..47c352426fcf 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -596,11 +596,19 @@ static inline void cifs_put_readdata(struct cifs_io_subrequest *rdata)
 int cifs_async_readv(struct cifs_io_subrequest *rdata);
 int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
 
-int cifs_async_writev(struct cifs_writedata *wdata,
-		      void (*release)(struct kref *kref));
+int cifs_async_writev(struct cifs_io_subrequest *wdata);
 void cifs_writev_complete(struct work_struct *work);
-struct cifs_writedata *cifs_writedata_alloc(work_func_t complete);
-void cifs_writedata_release(struct kref *refcount);
+struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete);
+void cifs_writedata_release(struct cifs_io_subrequest *rdata);
+static inline void cifs_get_writedata(struct cifs_io_subrequest *wdata)
+{
+	refcount_inc(&wdata->subreq.ref);
+}
+static inline void cifs_put_writedata(struct cifs_io_subrequest *wdata)
+{
+	if (refcount_dec_and_test(&wdata->subreq.ref))
+		cifs_writedata_release(wdata);
+}
 int cifs_query_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
 			  struct cifs_sb_info *cifs_sb,
 			  const unsigned char *path, char *pbuf,
diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index d8b03eec15c4..a64d972ba0b1 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1612,7 +1612,7 @@ CIFSSMBWrite(const unsigned int xid, struct cifs_io_parms *io_parms,
 static void
 cifs_writev_callback(struct mid_q_entry *mid)
 {
-	struct cifs_writedata *wdata = mid->callback_data;
+	struct cifs_io_subrequest *wdata = mid->callback_data;
 	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
 	unsigned int written;
 	WRITE_RSP *smb = (WRITE_RSP *)mid->resp_buf;
@@ -1657,8 +1657,7 @@ cifs_writev_callback(struct mid_q_entry *mid)
 
 /* cifs_async_writev - send an async write, and set up mid to handle result */
 int
-cifs_async_writev(struct cifs_writedata *wdata,
-		  void (*release)(struct kref *kref))
+cifs_async_writev(struct cifs_io_subrequest *wdata)
 {
 	int rc = -EACCES;
 	WRITE_REQ *smb = NULL;
@@ -1725,14 +1724,14 @@ cifs_async_writev(struct cifs_writedata *wdata,
 		iov[1].iov_len += 4; /* pad bigger by four bytes */
 	}
 
-	kref_get(&wdata->refcount);
+	cifs_get_writedata(wdata);
 	rc = cifs_call_async(tcon->ses->server, &rqst, NULL,
 			     cifs_writev_callback, NULL, wdata, 0, NULL);
 
 	if (rc == 0)
 		cifs_stats_inc(&tcon->stats.cifs_stats.num_writes);
 	else
-		kref_put(&wdata->refcount, release);
+		cifs_put_writedata(wdata);
 
 async_writev_out:
 	cifs_small_buf_release(smb);
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index 1074d56573b7..6e0a99888bfc 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2411,10 +2411,10 @@ cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
 }
 
 void
-cifs_writedata_release(struct kref *refcount)
+cifs_writedata_release(struct cifs_io_subrequest *wdata)
 {
-	struct cifs_writedata *wdata = container_of(refcount,
-					struct cifs_writedata, refcount);
+	if (wdata->uncached)
+		kref_put(&wdata->ctx->refcount, cifs_aio_ctx_release);
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	if (wdata->mr) {
 		smbd_deregister_mr(wdata->mr);
@@ -2433,7 +2433,7 @@ cifs_writedata_release(struct kref *refcount)
  * possible that the page was redirtied so re-clean the page.
  */
 static void
-cifs_writev_requeue(struct cifs_writedata *wdata)
+cifs_writev_requeue(struct cifs_io_subrequest *wdata)
 {
 	int rc = 0;
 	struct inode *inode = d_inode(wdata->cfile->dentry);
@@ -2443,7 +2443,7 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 
 	server = tlink_tcon(wdata->cfile->tlink)->ses->server;
 	do {
-		struct cifs_writedata *wdata2;
+		struct cifs_io_subrequest *wdata2;
 		unsigned int wsize, cur_len;
 
 		wsize = server->ops->wp_retry_size(inode);
@@ -2466,7 +2466,7 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 		wdata2->sync_mode = wdata->sync_mode;
 		wdata2->offset	= fpos;
 		wdata2->bytes	= cur_len;
-		wdata2->iter	= wdata->iter;
+		wdata2->iter = wdata->iter;
 
 		iov_iter_advance(&wdata2->iter, fpos - wdata->offset);
 		iov_iter_truncate(&wdata2->iter, wdata2->bytes);
@@ -2488,11 +2488,10 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 				rc = -EBADF;
 		} else {
 			wdata2->pid = wdata2->cfile->pid;
-			rc = server->ops->async_writev(wdata2,
-						       cifs_writedata_release);
+			rc = server->ops->async_writev(wdata2);
 		}
 
-		kref_put(&wdata2->refcount, cifs_writedata_release);
+		cifs_put_writedata(wdata2);
 		if (rc) {
 			if (is_retryable_error(rc))
 				continue;
@@ -2511,14 +2510,14 @@ cifs_writev_requeue(struct cifs_writedata *wdata)
 
 	if (rc != 0 && !is_retryable_error(rc))
 		mapping_set_error(inode->i_mapping, rc);
-	kref_put(&wdata->refcount, cifs_writedata_release);
+	cifs_put_writedata(wdata);
 }
 
 void
 cifs_writev_complete(struct work_struct *work)
 {
-	struct cifs_writedata *wdata = container_of(work,
-						struct cifs_writedata, work);
+	struct cifs_io_subrequest *wdata = container_of(work,
+						struct cifs_io_subrequest, work);
 	struct inode *inode = d_inode(wdata->cfile->dentry);
 
 	if (wdata->result == 0) {
@@ -2539,16 +2538,16 @@ cifs_writev_complete(struct work_struct *work)
 
 	if (wdata->result != -EAGAIN)
 		mapping_set_error(inode->i_mapping, wdata->result);
-	kref_put(&wdata->refcount, cifs_writedata_release);
+	cifs_put_writedata(wdata);
 }
 
-struct cifs_writedata *cifs_writedata_alloc(work_func_t complete)
+struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete)
 {
-	struct cifs_writedata *wdata;
+	struct cifs_io_subrequest *wdata;
 
 	wdata = kzalloc(sizeof(*wdata), GFP_NOFS);
 	if (wdata != NULL) {
-		kref_init(&wdata->refcount);
+		refcount_set(&wdata->subreq.ref, 1);
 		INIT_LIST_HEAD(&wdata->list);
 		init_completion(&wdata->done);
 		INIT_WORK(&wdata->work, complete);
@@ -2729,7 +2728,7 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 {
 	struct inode *inode = mapping->host;
 	struct TCP_Server_Info *server;
-	struct cifs_writedata *wdata;
+	struct cifs_io_subrequest *wdata;
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
@@ -2821,10 +2820,9 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 		if (wdata->cfile->invalidHandle)
 			rc = -EAGAIN;
 		else
-			rc = wdata->server->ops->async_writev(wdata,
-							      cifs_writedata_release);
+			rc = wdata->server->ops->async_writev(wdata);
 		if (rc >= 0) {
-			kref_put(&wdata->refcount, cifs_writedata_release);
+			cifs_put_writedata(wdata);
 			goto err_close;
 		}
 	} else {
@@ -2834,7 +2832,7 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	}
 
 err_wdata:
-	kref_put(&wdata->refcount, cifs_writedata_release);
+	cifs_put_writedata(wdata);
 err_uncredit:
 	add_credits_and_wake_if(server, credits, 0);
 err_close:
@@ -3223,23 +3221,13 @@ int cifs_flush(struct file *file, fl_owner_t id)
 	return rc;
 }
 
-static void
-cifs_uncached_writedata_release(struct kref *refcount)
-{
-	struct cifs_writedata *wdata = container_of(refcount,
-					struct cifs_writedata, refcount);
-
-	kref_put(&wdata->ctx->refcount, cifs_aio_ctx_release);
-	cifs_writedata_release(refcount);
-}
-
 static void collect_uncached_write_data(struct cifs_aio_ctx *ctx);
 
 static void
 cifs_uncached_writev_complete(struct work_struct *work)
 {
-	struct cifs_writedata *wdata = container_of(work,
-					struct cifs_writedata, work);
+	struct cifs_io_subrequest *wdata = container_of(work,
+					struct cifs_io_subrequest, work);
 	struct inode *inode = d_inode(wdata->cfile->dentry);
 	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 
@@ -3252,11 +3240,11 @@ cifs_uncached_writev_complete(struct work_struct *work)
 	complete(&wdata->done);
 	collect_uncached_write_data(wdata->ctx);
 	/* the below call can possibly free the last ref to aio ctx */
-	kref_put(&wdata->refcount, cifs_uncached_writedata_release);
+	cifs_put_writedata(wdata);
 }
 
 static int
-cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
+cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
 	unsigned int wsize;
@@ -3305,8 +3293,7 @@ cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 					wdata->mr = NULL;
 				}
 #endif
-				rc = server->ops->async_writev(wdata,
-					cifs_uncached_writedata_release);
+				rc = server->ops->async_writev(wdata);
 			}
 		}
 
@@ -3321,7 +3308,7 @@ cifs_resend_wdata(struct cifs_writedata *wdata, struct list_head *wdata_list,
 	} while (rc == -EAGAIN);
 
 fail:
-	kref_put(&wdata->refcount, cifs_uncached_writedata_release);
+	cifs_put_writedata(wdata);
 	return rc;
 }
 
@@ -3373,7 +3360,7 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 {
 	int rc = 0;
 	size_t cur_len, max_len;
-	struct cifs_writedata *wdata;
+	struct cifs_io_subrequest *wdata;
 	pid_t pid;
 	struct TCP_Server_Info *server;
 	unsigned int xid, max_segs = INT_MAX;
@@ -3437,6 +3424,7 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 			break;
 		}
 
+		wdata->uncached	= true;
 		wdata->sync_mode = WB_SYNC_ALL;
 		wdata->offset	= (__u64)fpos;
 		wdata->cfile	= cifsFileInfo_get(open_file);
@@ -3456,14 +3444,12 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 			if (wdata->cfile->invalidHandle)
 				rc = -EAGAIN;
 			else
-				rc = server->ops->async_writev(wdata,
-					cifs_uncached_writedata_release);
+				rc = server->ops->async_writev(wdata);
 		}
 
 		if (rc) {
 			add_credits_and_wake_if(server, &wdata->credits, 0);
-			kref_put(&wdata->refcount,
-				 cifs_uncached_writedata_release);
+			cifs_put_writedata(wdata);
 			if (rc == -EAGAIN)
 				continue;
 			break;
@@ -3481,7 +3467,7 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 
 static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
 {
-	struct cifs_writedata *wdata, *tmp;
+	struct cifs_io_subrequest *wdata, *tmp;
 	struct cifs_tcon *tcon;
 	struct cifs_sb_info *cifs_sb;
 	struct dentry *dentry = ctx->cfile->dentry;
@@ -3536,8 +3522,7 @@ static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
 						ctx->cfile, cifs_sb, &tmp_list,
 						ctx);
 
-					kref_put(&wdata->refcount,
-						cifs_uncached_writedata_release);
+					cifs_put_writedata(wdata);
 				}
 
 				list_splice(&tmp_list, &ctx->list);
@@ -3545,7 +3530,7 @@ static void collect_uncached_write_data(struct cifs_aio_ctx *ctx)
 			}
 		}
 		list_del_init(&wdata->list);
-		kref_put(&wdata->refcount, cifs_uncached_writedata_release);
+		cifs_put_writedata(wdata);
 	}
 
 	cifs_stats_bytes_written(tcon, ctx->total_len);
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index ba5d63475793..c3259bf07564 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4516,7 +4516,7 @@ SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 static void
 smb2_writev_callback(struct mid_q_entry *mid)
 {
-	struct cifs_writedata *wdata = mid->callback_data;
+	struct cifs_io_subrequest *wdata = mid->callback_data;
 	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
 	struct TCP_Server_Info *server = wdata->server;
 	unsigned int written;
@@ -4597,8 +4597,7 @@ smb2_writev_callback(struct mid_q_entry *mid)
 
 /* smb2_async_writev - send an async write, and set up mid to handle result */
 int
-smb2_async_writev(struct cifs_writedata *wdata,
-		  void (*release)(struct kref *kref))
+smb2_async_writev(struct cifs_io_subrequest *wdata)
 {
 	int rc = -EACCES, flags = 0;
 	struct smb2_write_req *req = NULL;
@@ -4730,7 +4729,7 @@ smb2_async_writev(struct cifs_writedata *wdata,
 		flags |= CIFS_HAS_CREDITS;
 	}
 
-	kref_get(&wdata->refcount);
+	cifs_get_writedata(wdata);
 	rc = cifs_call_async(server, &rqst, NULL, smb2_writev_callback, NULL,
 			     wdata, flags, &wdata->credits);
 
@@ -4742,7 +4741,7 @@ smb2_async_writev(struct cifs_writedata *wdata,
 				     io_parms->offset,
 				     io_parms->length,
 				     rc);
-		kref_put(&wdata->refcount, release);
+		cifs_put_writedata(wdata);
 		cifs_stats_fail_inc(tcon, SMB2_WRITE_HE);
 	}
 
diff --git a/fs/smb/client/smb2proto.h b/fs/smb/client/smb2proto.h
index 02ffe5ec9b21..4d3d51e42d3c 100644
--- a/fs/smb/client/smb2proto.h
+++ b/fs/smb/client/smb2proto.h
@@ -189,8 +189,7 @@ extern int SMB2_get_srv_num(const unsigned int xid, struct cifs_tcon *tcon,
 extern int smb2_async_readv(struct cifs_io_subrequest *rdata);
 extern int SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 		     unsigned int *nbytes, char **buf, int *buf_type);
-extern int smb2_async_writev(struct cifs_writedata *wdata,
-			     void (*release)(struct kref *kref));
+extern int smb2_async_writev(struct cifs_io_subrequest *wdata);
 extern int SMB2_write(const unsigned int xid, struct cifs_io_parms *io_parms,
 		      unsigned int *nbytes, struct kvec *iov, int n_vec);
 extern int SMB2_echo(struct TCP_Server_Info *server);

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

