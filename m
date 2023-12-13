Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRFB46VQMGQEB55ETDQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B22811793
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:41:57 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-67ef11ee39bsf19087226d6.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:41:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482116; cv=pass;
        d=google.com; s=arc-20160816;
        b=MAotGzmb8RiXRafhIxrRtS8jpAJq5gBdV7/LetkhwnPOIJIAXeMHyuCD4KbRejGEHx
         mrN3D1g+GJ4mvkivAt/Cz14h7Mi0PmYuy1G6ne/aRa1IBHkKQlBni3PGkkECy07odUUu
         J9RyCcm9AmPRUlGbQROR9rk8eozp2M7Pk4KSpkTqt493kVYMYfwBwNtgxny37LyEw8a/
         6wWb4CSx/Sl7HLNOpoAdnsWMH3CruLM/hLorirKMKzNH0myyAJOqpuEYA/EWJwQGE6+O
         rAJlD366bVTGzjdxGZedvfgftQxKbOfBAxbp4b9NnB6OBzgY6FVsALzGA0jS4ZRNI4mV
         JmtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=p7R5+9zsDgq7vog6PBpi+bPxlsQ9PzI2EyOrPMBkFjI=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=JDkvl4E0wByBm8hSjF4erk9k+WavdcWP++L3al2G+U+IFo1g5smvHyWKirizmXuLhn
         LV7HTZpecwO2dSRF0Q9/T1wS+/c1JMiby8OxKA0ILiU9iZrpAc8Qg+6ls7wN3dy5q9hK
         rwWxGqQY/8j94wRmQ0n6fZ5bKWIAchNcvLXwVS8yPV2yhZQ4UH4z5Z0WEL7+0G84AbHk
         WvSiPSEb911g57dFvtUje+LdueREFtN78vIA27QeQmSjwsxjyzgrDZ46S4F+tEk73skK
         CAbY3TGTODtDh2MQSs1kcqWJDmGyEhAPeSGqob68xuEG6C4aJzX2bvk8AzAnteFxC1Ga
         GVCw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482116; x=1703086916;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7R5+9zsDgq7vog6PBpi+bPxlsQ9PzI2EyOrPMBkFjI=;
        b=kAfahXndjontk5JoGGagDUJDoqlDH4IRkbEE5dQ72XD6XKWdUgJcpeb7OpxFx8CRku
         LOXl2Svn9EtodQN9NNmmPVP9tcTZ26VMcC/aDVEZFOd7YGkY5IUsoXXZZMyPn+eGLVs0
         7ncuKmqSdT2UmESdiE5h1NwcDEKBDexVNOqAe4A3wM31jUqGeATWbKE9TXuRMsHtZ1rE
         +hAC0UE3oKC9EK7sJIGS6qGmqsUakyff97jnEivd+UZ46lrEGcpymB6b3Q7WTP4o8zP8
         jh+43+AYoEr1569mEgnxEufAmPiKSlRE3eUpc6gP++xIEt/VEo7nYng92lbGhndKPzYu
         cHTg==
X-Gm-Message-State: AOJu0YxX1j1jcdAtaFZ0pTIDpErJZBVTDKSldBnCUuY1dt4/HSwIeadL
	lKg0E4xnnedkJgJrEZ0XYAKhZw==
X-Google-Smtp-Source: AGHT+IFOUV4d8hrmZZxE6Cs5o/2VSABd+Oz9ejhEtaeelVO3nrhapeV3jWfTqXxRmvoPiaXC3fHYAg==
X-Received: by 2002:ad4:5cad:0:b0:67f:406:b754 with SMTP id q13-20020ad45cad000000b0067f0406b754mr272850qvh.35.1702482116698;
        Wed, 13 Dec 2023 07:41:56 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:4b88:b0:679:fa52:346a with SMTP id
 qf8-20020a0562144b8800b00679fa52346als816719qvb.0.-pod-prod-09-us; Wed, 13
 Dec 2023 07:41:56 -0800 (PST)
X-Received: by 2002:a05:6122:4214:b0:4b2:7fa3:a965 with SMTP id cm20-20020a056122421400b004b27fa3a965mr7240440vkb.11.1702482116188;
        Wed, 13 Dec 2023 07:41:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482116; cv=none;
        d=google.com; s=arc-20160816;
        b=U3K1EhUsuDr8XitxrqWZGILNWytDNFGFC5YJPAtu8XkjPsNr4XfodcikrjfK3Oa1Fq
         LjhglDJrJQmAHCaoUwwx2ps/FdrSgpRlg5i3BwRZfLYXhSPwVoqVlWh7x9HC2Bx0w0Wd
         YpYveAXZNd/f7HHQpr4I7vGFqP4VNLYgIXrQogfu1W874T9H2QLudv/hmCqkFyfb7L4Y
         w/ZCGYRcC2pyPM5m0Oh8HwarAYAVtgxyRGYhArOZD3lUE35A9kGIaWzENnp8Ai1wUjDp
         hJ4kqLzW5XWsMQf9gOKoynYACjuXnNyBiRfXgcnQcviH5ZAyeog8L2I5w0WQM1431IkA
         xBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=SMbOgFkbak90MAOfkXqzM0Do3/SwWTslJ0OTgQqv11o=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=mVgvktXLDKhyTErTp14ZwyVgJwyfTG1IlKeAPhWpTCxPkoianswEc+9tbwT3m/AHN1
         PLUmW5k+m1m+Q4NJc9csGVTjpslFX6OVS2vYslGg+UU5dNM1xXlKblpPp7xPJg+rMufb
         iFhdXTjq37Oz0i0CxxgfG+25XKGyj7j28jVOFuN7uXazlkvvwGGcfPU3762g3jbbk5qo
         tv1K+bokgXqnX3zJRgvuwcPcNd4Zv+HJtwbGXDj152O9BYQ1jhq3ks2GVupo3kLsWnWm
         FqV9a77IwuahpnB1aMnw9XXfmkWQav/Qm/NPJdrlH923EZFhwO5WS1jMFkJ2on3XWsLK
         sZHw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id s185-20020a1fdbc2000000b004b2e2f0a9f6si2484611vkg.81.2023.12.13.07.41.56
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:41:56 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-X16VjvHRNDiVbq-a2BS7Lg-1; Wed, 13 Dec 2023 10:41:54 -0500
X-MC-Unique: X16VjvHRNDiVbq-a2BS7Lg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6C1A68350E9
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:41:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6688A519D; Wed, 13 Dec 2023 15:41:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6450C51E3;
	Wed, 13 Dec 2023 15:41:50 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
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
Subject: [PATCH v4 02/13] cifs: Replace cifs_readdata with a wrapper around netfs_io_subrequest
Date: Wed, 13 Dec 2023 15:41:28 +0000
Message-ID: <20231213154139.432922-3-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Netfslib has a facility whereby the allocation for netfs_io_subrequest can
be increased to so that filesystem-specific data can be tagged on the end.

Prepare to use this by making a struct, cifs_io_subrequest, that wraps
netfs_io_subrequest, and absorb struct cifs_readdata into it.

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
 fs/smb/client/cifsglob.h  | 22 ++++++++++--------
 fs/smb/client/cifsproto.h |  9 ++++++--
 fs/smb/client/cifssmb.c   | 11 ++++-----
 fs/smb/client/file.c      | 48 ++++++++++++++++++---------------------
 fs/smb/client/smb2ops.c   |  2 +-
 fs/smb/client/smb2pdu.c   | 13 ++++++-----
 fs/smb/client/smb2proto.h |  2 +-
 fs/smb/client/transport.c |  4 ++--
 8 files changed, 56 insertions(+), 55 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 7558167f603c..65820f40f7f4 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -243,7 +243,7 @@ struct dfs_info3_param;
 struct cifs_fattr;
 struct smb3_fs_context;
 struct cifs_fid;
-struct cifs_readdata;
+struct cifs_io_subrequest;
 struct cifs_writedata;
 struct cifs_io_parms;
 struct cifs_search_info;
@@ -416,7 +416,7 @@ struct smb_version_operations {
 	/* send a flush request to the server */
 	int (*flush)(const unsigned int, struct cifs_tcon *, struct cifs_fid *);
 	/* async read from the server */
-	int (*async_readv)(struct cifs_readdata *);
+	int (*async_readv)(struct cifs_io_subrequest *);
 	/* async write to the server */
 	int (*async_writev)(struct cifs_writedata *,
 			    void (*release)(struct kref *));
@@ -1435,26 +1435,28 @@ struct cifs_aio_ctx {
 };
 
 /* asynchronous read support */
-struct cifs_readdata {
-	struct kref			refcount;
-	struct list_head		list;
-	struct completion		done;
+struct cifs_io_subrequest {
+	struct netfs_io_subrequest	subreq;
 	struct cifsFileInfo		*cfile;
 	struct address_space		*mapping;
 	struct cifs_aio_ctx		*ctx;
-	__u64				offset;
 	ssize_t				got_bytes;
-	unsigned int			bytes;
 	pid_t				pid;
 	int				result;
-	struct work_struct		work;
-	struct iov_iter			iter;
 	struct kvec			iov[2];
 	struct TCP_Server_Info		*server;
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	struct smbd_mr			*mr;
 #endif
 	struct cifs_credits		credits;
+
+	// TODO: Remove following elements
+	struct list_head		list;
+	struct completion		done;
+	struct work_struct		work;
+	struct iov_iter			iter;
+	__u64				offset;
+	unsigned int			bytes;
 };
 
 /* asynchronous write support */
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 46feaa0880bd..49ffa657893b 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -587,8 +587,13 @@ void __cifs_put_smb_ses(struct cifs_ses *ses);
 extern struct cifs_ses *
 cifs_get_smb_ses(struct TCP_Server_Info *server, struct smb3_fs_context *ctx);
 
-void cifs_readdata_release(struct kref *refcount);
-int cifs_async_readv(struct cifs_readdata *rdata);
+void cifs_readdata_release(struct cifs_io_subrequest *rdata);
+static inline void cifs_put_readdata(struct cifs_io_subrequest *rdata)
+{
+	if (refcount_dec_and_test(&rdata->subreq.ref))
+		cifs_readdata_release(rdata);
+}
+int cifs_async_readv(struct cifs_io_subrequest *rdata);
 int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
 
 int cifs_async_writev(struct cifs_writedata *wdata,
diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 9ee348e6d106..d8b03eec15c4 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -24,6 +24,8 @@
 #include <linux/swap.h>
 #include <linux/task_io_accounting_ops.h>
 #include <linux/uaccess.h>
+#include <linux/netfs.h>
+#include <trace/events/netfs.h>
 #include "cifspdu.h"
 #include "cifsfs.h"
 #include "cifsglob.h"
@@ -1262,12 +1264,11 @@ CIFS_open(const unsigned int xid, struct cifs_open_parms *oparms, int *oplock,
 static void
 cifs_readv_callback(struct mid_q_entry *mid)
 {
-	struct cifs_readdata *rdata = mid->callback_data;
+	struct cifs_io_subrequest *rdata = mid->callback_data;
 	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
 	struct TCP_Server_Info *server = tcon->ses->server;
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 2,
-				 .rq_iter_size = iov_iter_count(&rdata->iter),
 				 .rq_iter = rdata->iter };
 	struct cifs_credits credits = { .value = 1, .instance = 0 };
 
@@ -1312,7 +1313,7 @@ cifs_readv_callback(struct mid_q_entry *mid)
 
 /* cifs_async_readv - send an async write, and set up mid to handle result */
 int
-cifs_async_readv(struct cifs_readdata *rdata)
+cifs_async_readv(struct cifs_io_subrequest *rdata)
 {
 	int rc;
 	READ_REQ *smb = NULL;
@@ -1364,15 +1365,11 @@ cifs_async_readv(struct cifs_readdata *rdata)
 	rdata->iov[1].iov_base = (char *)smb + 4;
 	rdata->iov[1].iov_len = get_rfc1002_length(smb);
 
-	kref_get(&rdata->refcount);
 	rc = cifs_call_async(tcon->ses->server, &rqst, cifs_readv_receive,
 			     cifs_readv_callback, NULL, rdata, 0, NULL);
 
 	if (rc == 0)
 		cifs_stats_inc(&tcon->stats.cifs_stats.num_reads);
-	else
-		kref_put(&rdata->refcount, cifs_readdata_release);
-
 	cifs_small_buf_release(smb);
 	return rc;
 }
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index b25cace63768..ca697bda4666 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2949,7 +2949,7 @@ static int cifs_writepages_region(struct address_space *mapping,
 			continue;
 		}
 
-		folio_batch_release(&fbatch);		
+		folio_batch_release(&fbatch);
 		cond_resched();
 	} while (wbc->nr_to_write > 0);
 
@@ -3783,13 +3783,13 @@ cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from)
 	return written;
 }
 
-static struct cifs_readdata *cifs_readdata_alloc(work_func_t complete)
+static struct cifs_io_subrequest *cifs_readdata_alloc(work_func_t complete)
 {
-	struct cifs_readdata *rdata;
+	struct cifs_io_subrequest *rdata;
 
 	rdata = kzalloc(sizeof(*rdata), GFP_KERNEL);
 	if (rdata) {
-		kref_init(&rdata->refcount);
+		refcount_set(&rdata->subreq.ref, 1);
 		INIT_LIST_HEAD(&rdata->list);
 		init_completion(&rdata->done);
 		INIT_WORK(&rdata->work, complete);
@@ -3799,11 +3799,8 @@ static struct cifs_readdata *cifs_readdata_alloc(work_func_t complete)
 }
 
 void
-cifs_readdata_release(struct kref *refcount)
+cifs_readdata_release(struct cifs_io_subrequest *rdata)
 {
-	struct cifs_readdata *rdata = container_of(refcount,
-					struct cifs_readdata, refcount);
-
 	if (rdata->ctx)
 		kref_put(&rdata->ctx->refcount, cifs_aio_ctx_release);
 #ifdef CONFIG_CIFS_SMB_DIRECT
@@ -3823,16 +3820,16 @@ static void collect_uncached_read_data(struct cifs_aio_ctx *ctx);
 static void
 cifs_uncached_readv_complete(struct work_struct *work)
 {
-	struct cifs_readdata *rdata = container_of(work,
-						struct cifs_readdata, work);
+	struct cifs_io_subrequest *rdata =
+		container_of(work, struct cifs_io_subrequest, work);
 
 	complete(&rdata->done);
 	collect_uncached_read_data(rdata->ctx);
 	/* the below call can possibly free the last ref to aio ctx */
-	kref_put(&rdata->refcount, cifs_readdata_release);
+	cifs_put_readdata(rdata);
 }
 
-static int cifs_resend_rdata(struct cifs_readdata *rdata,
+static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
@@ -3900,7 +3897,7 @@ static int cifs_resend_rdata(struct cifs_readdata *rdata,
 	} while (rc == -EAGAIN);
 
 fail:
-	kref_put(&rdata->refcount, cifs_readdata_release);
+	cifs_put_readdata(rdata);
 	return rc;
 }
 
@@ -3909,7 +3906,7 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 		     struct cifs_sb_info *cifs_sb, struct list_head *rdata_list,
 		     struct cifs_aio_ctx *ctx)
 {
-	struct cifs_readdata *rdata;
+	struct cifs_io_subrequest *rdata;
 	unsigned int rsize, nsegs, max_segs = INT_MAX;
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
@@ -3977,7 +3974,7 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 		rdata->ctx	= ctx;
 		kref_get(&ctx->refcount);
 
-		rdata->iter	= ctx->iter;
+		rdata->iter = ctx->iter;
 		iov_iter_truncate(&rdata->iter, cur_len);
 
 		rc = adjust_credits(server, &rdata->credits, rdata->bytes);
@@ -3991,7 +3988,7 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 
 		if (rc) {
 			add_credits_and_wake_if(server, &rdata->credits, 0);
-			kref_put(&rdata->refcount, cifs_readdata_release);
+			cifs_put_readdata(rdata);
 			if (rc == -EAGAIN)
 				continue;
 			break;
@@ -4009,7 +4006,7 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 static void
 collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 {
-	struct cifs_readdata *rdata, *tmp;
+	struct cifs_io_subrequest *rdata, *tmp;
 	struct cifs_sb_info *cifs_sb;
 	int rc;
 
@@ -4055,8 +4052,7 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 						rdata->cfile, cifs_sb,
 						&tmp_list, ctx);
 
-					kref_put(&rdata->refcount,
-						cifs_readdata_release);
+					cifs_put_readdata(rdata);
 				}
 
 				list_splice(&tmp_list, &ctx->list);
@@ -4072,7 +4068,7 @@ collect_uncached_read_data(struct cifs_aio_ctx *ctx)
 			ctx->total_len += rdata->got_bytes;
 		}
 		list_del_init(&rdata->list);
-		kref_put(&rdata->refcount, cifs_readdata_release);
+		cifs_put_readdata(rdata);
 	}
 
 	/* mask nodata case */
@@ -4444,8 +4440,8 @@ static void cifs_unlock_folios(struct address_space *mapping, pgoff_t first, pgo
 
 static void cifs_readahead_complete(struct work_struct *work)
 {
-	struct cifs_readdata *rdata = container_of(work,
-						   struct cifs_readdata, work);
+	struct cifs_io_subrequest *rdata = container_of(work,
+						   struct cifs_io_subrequest, work);
 	struct folio *folio;
 	pgoff_t last;
 	bool good = rdata->result == 0 || (rdata->result == -EAGAIN && rdata->got_bytes);
@@ -4471,7 +4467,7 @@ static void cifs_readahead_complete(struct work_struct *work)
 	}
 	rcu_read_unlock();
 
-	kref_put(&rdata->refcount, cifs_readdata_release);
+	cifs_put_readdata(rdata);
 }
 
 static void cifs_readahead(struct readahead_control *ractl)
@@ -4511,7 +4507,7 @@ static void cifs_readahead(struct readahead_control *ractl)
 	 */
 	while ((nr_pages = ra_pages)) {
 		unsigned int i, rsize;
-		struct cifs_readdata *rdata;
+		struct cifs_io_subrequest *rdata;
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
 		struct folio *folio;
@@ -4630,11 +4626,11 @@ static void cifs_readahead(struct readahead_control *ractl)
 					   rdata->offset / PAGE_SIZE,
 					   (rdata->offset + rdata->bytes - 1) / PAGE_SIZE);
 			/* Fallback to the readpage in error/reconnect cases */
-			kref_put(&rdata->refcount, cifs_readdata_release);
+			cifs_put_readdata(rdata);
 			break;
 		}
 
-		kref_put(&rdata->refcount, cifs_readdata_release);
+		cifs_put_readdata(rdata);
 	}
 
 	free_xid(xid);
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index 8f6f0a38b886..a441785b4cf1 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -4613,7 +4613,7 @@ handle_read_data(struct TCP_Server_Info *server, struct mid_q_entry *mid,
 	unsigned int cur_off;
 	unsigned int cur_page_idx;
 	unsigned int pad_len;
-	struct cifs_readdata *rdata = mid->callback_data;
+	struct cifs_io_subrequest *rdata = mid->callback_data;
 	struct smb2_hdr *shdr = (struct smb2_hdr *)buf;
 	int length;
 	bool use_rdma_mr = false;
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index c571760ad39a..3d6292a45c56 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -23,6 +23,8 @@
 #include <linux/uuid.h>
 #include <linux/pagemap.h>
 #include <linux/xattr.h>
+#include <linux/netfs.h>
+#include <trace/events/netfs.h>
 #include "cifsglob.h"
 #include "cifsacl.h"
 #include "cifsproto.h"
@@ -4190,7 +4192,7 @@ static inline bool smb3_use_rdma_offload(struct cifs_io_parms *io_parms)
  */
 static int
 smb2_new_read_req(void **buf, unsigned int *total_len,
-	struct cifs_io_parms *io_parms, struct cifs_readdata *rdata,
+	struct cifs_io_parms *io_parms, struct cifs_io_subrequest *rdata,
 	unsigned int remaining_bytes, int request_type)
 {
 	int rc = -EACCES;
@@ -4282,13 +4284,14 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 static void
 smb2_readv_callback(struct mid_q_entry *mid)
 {
-	struct cifs_readdata *rdata = mid->callback_data;
+	struct cifs_io_subrequest *rdata = mid->callback_data;
 	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
 	struct TCP_Server_Info *server = rdata->server;
 	struct smb2_hdr *shdr =
 				(struct smb2_hdr *)rdata->iov[0].iov_base;
 	struct cifs_credits credits = { .value = 0, .instance = 0 };
-	struct smb_rqst rqst = { .rq_iov = &rdata->iov[1], .rq_nvec = 1 };
+	struct smb_rqst rqst = { .rq_iov = &rdata->iov[1],
+				 .rq_nvec = 1 };
 
 	if (rdata->got_bytes) {
 		rqst.rq_iter	  = rdata->iter;
@@ -4369,7 +4372,7 @@ smb2_readv_callback(struct mid_q_entry *mid)
 
 /* smb2_async_readv - send an async read, and set up mid to handle result */
 int
-smb2_async_readv(struct cifs_readdata *rdata)
+smb2_async_readv(struct cifs_io_subrequest *rdata)
 {
 	int rc, flags = 0;
 	char *buf;
@@ -4427,13 +4430,11 @@ smb2_async_readv(struct cifs_readdata *rdata)
 		flags |= CIFS_HAS_CREDITS;
 	}
 
-	kref_get(&rdata->refcount);
 	rc = cifs_call_async(server, &rqst,
 			     cifs_readv_receive, smb2_readv_callback,
 			     smb3_handle_read_data, rdata, flags,
 			     &rdata->credits);
 	if (rc) {
-		kref_put(&rdata->refcount, cifs_readdata_release);
 		cifs_stats_fail_inc(io_parms.tcon, SMB2_READ_HE);
 		trace_smb3_read_err(0 /* xid */, io_parms.persistent_fid,
 				    io_parms.tcon->tid,
diff --git a/fs/smb/client/smb2proto.h b/fs/smb/client/smb2proto.h
index 0e371f7e2854..d995b8fc5189 100644
--- a/fs/smb/client/smb2proto.h
+++ b/fs/smb/client/smb2proto.h
@@ -186,7 +186,7 @@ extern int SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
 extern int SMB2_get_srv_num(const unsigned int xid, struct cifs_tcon *tcon,
 			    u64 persistent_fid, u64 volatile_fid,
 			    __le64 *uniqueid);
-extern int smb2_async_readv(struct cifs_readdata *rdata);
+extern int smb2_async_readv(struct cifs_io_subrequest *rdata);
 extern int SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 		     unsigned int *nbytes, char **buf, int *buf_type);
 extern int smb2_async_writev(struct cifs_writedata *wdata,
diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index 4f717ad7c21b..bae758ec621b 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -1677,7 +1677,7 @@ __cifs_readv_discard(struct TCP_Server_Info *server, struct mid_q_entry *mid,
 static int
 cifs_readv_discard(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 {
-	struct cifs_readdata *rdata = mid->callback_data;
+	struct cifs_io_subrequest *rdata = mid->callback_data;
 
 	return  __cifs_readv_discard(server, mid, rdata->result);
 }
@@ -1687,7 +1687,7 @@ cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 {
 	int length, len;
 	unsigned int data_offset, data_len;
-	struct cifs_readdata *rdata = mid->callback_data;
+	struct cifs_io_subrequest *rdata = mid->callback_data;
 	char *buf = server->smallbuf;
 	unsigned int buflen = server->pdu_size + HEADER_PREAMBLE_SIZE(server);
 	bool use_rdma_mr = false;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

