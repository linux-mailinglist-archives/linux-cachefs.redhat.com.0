Return-Path: <linux-cachefs+bncBDLIXLMFVAERBYNB46VQMGQEZ5EOG3Y@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id E55578117A4
	for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 16:42:26 +0100 (CET)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-591627a8555sf294946eaf.3
        for <lists+linux-cachefs@lfdr.de>; Wed, 13 Dec 2023 07:42:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702482145; cv=pass;
        d=google.com; s=arc-20160816;
        b=K9gSEjeIebQB0uqFjShnvpMsf/4i2O6qlrxh5CdurZdRCwLsRY51vkGHll/BC8n8FI
         vprjWX1VBFV5oVutQ0hUzpD0wEA0DFbk6XLlNbZNqWbbw67rmIm8OJ2h1K69Gr0/ukcd
         NyFTsTljL3nepNZDRTedhQpJFodc0BAkVwqZz78a/DoKOL5tzyRxNB2XlK6Mfvzh1n0K
         Zc6T9ZZskNJg5jcX+Kyen3vyu/baWi2WMNxXojQu2EgsQlO39peAVRcWKgwjZxUKxCLQ
         y3R98uCna5uR8/GLBebIOMuKPijxj/rz5ttBtEktNdDK5F9mqUgiOUrFToTis8sBa1sv
         4aPw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=xgkPbr2+703I+oR+uPjKTx6IN4dCZopmKUq6T3vvX+Q=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=gFNYJojGhFQlfGSN3mLI6/B/Cqem1zyatjecC4dsqGTZ8MTtCKBZCWJVX2bcoBjEvT
         RuOIhFiziwx53pSIEf3X+L0jhc0e8PCF7bnKXzSHVL1aL2AI8ovPuiBWdQegsWlxQcnE
         OxEr3SSYyBLuC44q4ZrOkqAWZrTqSro38yvFEfJdD3vkETFZTVOxcPvQe4Ibua+4HZ4r
         5VgnCmaNzXNIrDwxmaSGDGpE04k9j2DZA3fYNLngCAGO2frsgqjA+7ivmMjb2ws0+F67
         TyDOZWWSwMqGJGJsvbFcYdMMirns3AAEB32rvbfKU8ubivwGmeSr7Kab39fEI6pN1rZ7
         tLeg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702482145; x=1703086945;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgkPbr2+703I+oR+uPjKTx6IN4dCZopmKUq6T3vvX+Q=;
        b=b34aYymlFLUMPKMayeBu6wbU3nnexaDIUCcFlGCUnqOiYq11M69i2OIepgGlMywa2n
         7XT7dHyY8bb1HQ9XWKX0h+hqdMqeJR+g9/m5qp1QqbVWhur+z4UXdV8t2xL3VszEH6aO
         kUPKX1MXI1iCNyi+2rsVXAStw79H98mRWI4ku1pLjaZTiptKh0kLOWraLLHD59a3FqwD
         LSmK9x05DuRNNPUY5Kdvp7nvOtUwnZQh9LxoFuLkLrE/WkH6LxPdL/XPxvKqAZFuVNdf
         EGWc8Nik9DCOEnmJD0VEfv6BavU6ysW2M0r1g1hzoEXiOqIWM/AZcQTwWmlF1P3BMDLA
         GPZg==
X-Gm-Message-State: AOJu0YxVS1tATV+p3TC6AXv2vHiXwO4hQR/4XnQUdEJ67c7/1ywqhFHS
	8zh6R6JxLNfq1XUnj/hR/pTHPg==
X-Google-Smtp-Source: AGHT+IGkYlB8czYH+AMgFH6JbBB2tABXLRwIfYY09MKNfwmkBXN6k4Vn10PqnKB1z1PvquC5n6P8rg==
X-Received: by 2002:a05:6820:81e:b0:58d:a202:5bdd with SMTP id bg30-20020a056820081e00b0058da2025bddmr7130329oob.9.1702482145626;
        Wed, 13 Dec 2023 07:42:25 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6820:1612:b0:58d:d4e0:4e with SMTP id
 bb18-20020a056820161200b0058dd4e0004els3103269oob.2.-pod-prod-09-us; Wed, 13
 Dec 2023 07:42:25 -0800 (PST)
X-Received: by 2002:a05:6808:38cd:b0:3ba:789:bcbf with SMTP id el13-20020a05680838cd00b003ba0789bcbfmr10641492oib.117.1702482144884;
        Wed, 13 Dec 2023 07:42:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702482144; cv=none;
        d=google.com; s=arc-20160816;
        b=v1kyftJ2eH5Np1A85xWWDkMgxgPRzPUtDGR1b7qYCyqcBJDxT65hwj+Qnip2sEVC6w
         tx4vnHsmE5BTdoNr27Vv7sLtfBADmWh+egTZXqhLKwnqr3nb4hBZAFTkWDgoWMTHyJHV
         f2/cLZdEFAbB1A2ocr+hg9BNeFXqmsCuqRL1vJOg37W1fhW9ONjsJnhUPWQSBXX6dDSb
         PRVYQZzxYpncZPeyz142W+0A06/vTRDWchZU3KbsMr7DSHkF6kHIju8RR6YGFgZiKv+2
         NBAvIfA5rEm79kxaUID/fFi2qTvf1Rwrc2c7YBMtDy3CHP7x66/dGuh9X9ftjDcN0ql6
         qFJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=Jxf/wUT4ad6w1R4FfnLrHrgQxMCLiA/nivEsLXYmEXg=;
        fh=/d04rGhva23/oMvvc+i8J/J8+GzO8KYoVKSGWp4U6JE=;
        b=N1eoKRZgfHGqPRawfo3SO9emzy9AdVsSmgjqtjpfy6dHlVa/p6e5Ys0tN5LrTml6Ck
         5ZMgeEIKtd2bc+QWlqaqfkEk7A6D5eV2Rov+ECcJl0s11hZRp5budt07DFQ9sZ9D4mT1
         TEHXcaUQZY564S55XH7U/SE2HszbUctbMPsC4bdaj7BmWi+BnuOVg4wDlg4I+qppKlGM
         P1FgE44SBf+GjbSABFhy3aF90VkuxP8RWyfKwR/56ve3vmSk4Xstqdrh3xQOgMk1I3cI
         abmoxFI6HpW6ciL89ffUsibYeRrHJZbsjoQOpmuffed3BJZmoN8xwn6LW8DY03Crgck6
         GpCw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id g7-20020ac870c7000000b0042578f95d8esi12356028qtp.254.2023.12.13.07.42.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 07:42:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-MNRhpPt1MXaoHYUMvtFySQ-1; Wed, 13 Dec 2023 10:42:22 -0500
X-MC-Unique: MNRhpPt1MXaoHYUMvtFySQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9E215101E153
	for <linux-cachefs@gapps.redhat.com>; Wed, 13 Dec 2023 15:42:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 9A1143C2F; Wed, 13 Dec 2023 15:42:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B281A3C25;
	Wed, 13 Dec 2023 15:42:19 +0000 (UTC)
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
Subject: [PATCH v4 10/13] cifs: Cut over to using netfslib
Date: Wed, 13 Dec 2023 15:41:36 +0000
Message-ID: <20231213154139.432922-11-dhowells@redhat.com>
In-Reply-To: <20231213154139.432922-1-dhowells@redhat.com>
References: <20231213154139.432922-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
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

Make the cifs filesystem use netfslib to handle reading and writing on
behalf of cifs.  The changes include:

 (1) Various read_iter/write_iter type functions are turned into wrappers
     around netfslib API functions or are pointed directly at those
     functions:

	cifs_file_direct{,_nobrl}_ops switch to use
	netfs_unbuffered_read_iter and netfs_unbuffered_write_iter.

Large pieces of code that will be removed are #if'd out and will be removed
in subsequent patches.

[?] Why does cifs mark the page dirty in the destination buffer of a DIO
    read?  Should that happen automatically?  Does netfs need to do that?

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
 fs/netfs/io.c             |   7 +-
 fs/smb/client/cifsfs.c    |   8 +-
 fs/smb/client/cifsfs.h    |   8 +-
 fs/smb/client/cifsglob.h  |   3 +-
 fs/smb/client/cifsproto.h |   8 +-
 fs/smb/client/cifssmb.c   |  45 ++++++-----
 fs/smb/client/file.c      | 166 ++++++++++++++++++++------------------
 fs/smb/client/fscache.c   |   2 +
 fs/smb/client/fscache.h   |   4 +
 fs/smb/client/inode.c     |  19 ++++-
 fs/smb/client/smb2pdu.c   |  98 +++++++++++++---------
 fs/smb/client/trace.h     | 144 ++++++++++++++++++++++++++++-----
 fs/smb/client/transport.c |   3 +
 13 files changed, 347 insertions(+), 168 deletions(-)

diff --git a/fs/netfs/io.c b/fs/netfs/io.c
index 41a6113aa7fa..7c39b9a830d6 100644
--- a/fs/netfs/io.c
+++ b/fs/netfs/io.c
@@ -352,8 +352,13 @@ static void netfs_rreq_assess_dio(struct netfs_io_request *rreq)
 	unsigned int i;
 	size_t transferred = 0;
 
-	for (i = 0; i < rreq->direct_bv_count; i++)
+	for (i = 0; i < rreq->direct_bv_count; i++) {
 		flush_dcache_page(rreq->direct_bv[i].bv_page);
+		// TODO: cifs marks pages in the destination buffer
+		// dirty under some circumstances after a read.  Do we
+		// need to do that too?
+		set_page_dirty(rreq->direct_bv[i].bv_page);
+	}
 
 	list_for_each_entry(subreq, &rreq->subrequests, rreq_link) {
 		if (subreq->error || subreq->transferred == 0)
diff --git a/fs/smb/client/cifsfs.c b/fs/smb/client/cifsfs.c
index 1cd9309e46f7..3fad0b5a1b08 100644
--- a/fs/smb/client/cifsfs.c
+++ b/fs/smb/client/cifsfs.c
@@ -1513,8 +1513,8 @@ const struct file_operations cifs_file_strict_ops = {
 };
 
 const struct file_operations cifs_file_direct_ops = {
-	.read_iter = cifs_direct_readv,
-	.write_iter = cifs_direct_writev,
+	.read_iter = netfs_unbuffered_read_iter,
+	.write_iter = netfs_file_write_iter,
 	.open = cifs_open,
 	.release = cifs_close,
 	.lock = cifs_lock,
@@ -1569,8 +1569,8 @@ const struct file_operations cifs_file_strict_nobrl_ops = {
 };
 
 const struct file_operations cifs_file_direct_nobrl_ops = {
-	.read_iter = cifs_direct_readv,
-	.write_iter = cifs_direct_writev,
+	.read_iter = netfs_unbuffered_read_iter,
+	.write_iter = netfs_file_write_iter,
 	.open = cifs_open,
 	.release = cifs_close,
 	.fsync = cifs_fsync,
diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
index 28c41c449205..637fead22509 100644
--- a/fs/smb/client/cifsfs.h
+++ b/fs/smb/client/cifsfs.h
@@ -85,6 +85,7 @@ extern const struct inode_operations cifs_namespace_inode_operations;
 
 
 /* Functions related to files and directories */
+extern const struct netfs_request_ops cifs_req_ops;
 extern const struct file_operations cifs_file_ops;
 extern const struct file_operations cifs_file_direct_ops; /* if directio mnt */
 extern const struct file_operations cifs_file_strict_ops; /* if strictio mnt */
@@ -94,11 +95,7 @@ extern const struct file_operations cifs_file_strict_nobrl_ops;
 extern int cifs_open(struct inode *inode, struct file *file);
 extern int cifs_close(struct inode *inode, struct file *file);
 extern int cifs_closedir(struct inode *inode, struct file *file);
-extern ssize_t cifs_user_readv(struct kiocb *iocb, struct iov_iter *to);
-extern ssize_t cifs_direct_readv(struct kiocb *iocb, struct iov_iter *to);
 extern ssize_t cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to);
-extern ssize_t cifs_user_writev(struct kiocb *iocb, struct iov_iter *from);
-extern ssize_t cifs_direct_writev(struct kiocb *iocb, struct iov_iter *from);
 extern ssize_t cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from);
 ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from);
 ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter);
@@ -112,9 +109,6 @@ extern int cifs_file_strict_mmap(struct file *file, struct vm_area_struct *vma);
 extern const struct file_operations cifs_dir_ops;
 extern int cifs_dir_open(struct inode *inode, struct file *file);
 extern int cifs_readdir(struct file *file, struct dir_context *ctx);
-extern void cifs_pages_written_back(struct inode *inode, loff_t start, unsigned int len);
-extern void cifs_pages_write_failed(struct inode *inode, loff_t start, unsigned int len);
-extern void cifs_pages_write_redirty(struct inode *inode, loff_t start, unsigned int len);
 
 /* Functions related to dir entries */
 extern const struct dentry_operations cifs_dentry_ops;
diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 7d17e515624f..224cc47209eb 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -1456,7 +1456,7 @@ struct cifs_io_subrequest {
 #endif
 	struct cifs_credits		credits;
 
-	// TODO: Remove following elements
+#if 0 // TODO: Remove following elements
 	struct list_head		list;
 	struct completion		done;
 	struct work_struct		work;
@@ -1466,6 +1466,7 @@ struct cifs_io_subrequest {
 	enum writeback_sync_modes	sync_mode;
 	bool				uncached;
 	struct bio_vec			*bv;
+#endif
 };
 
 /*
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 85e115da8899..3bbbe9b2fb8e 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -145,8 +145,8 @@ extern int checkSMB(char *buf, unsigned int len, struct TCP_Server_Info *srvr);
 extern bool is_valid_oplock_break(char *, struct TCP_Server_Info *);
 extern bool backup_cred(struct cifs_sb_info *);
 extern bool is_size_safe_to_change(struct cifsInodeInfo *, __u64 eof);
-extern void cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
-			    unsigned int bytes_written);
+void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result,
+				      bool was_async);
 extern struct cifsFileInfo *find_writable_file(struct cifsInodeInfo *, int);
 extern int cifs_get_writable_file(struct cifsInodeInfo *cifs_inode,
 				  int flags,
@@ -587,17 +587,20 @@ void __cifs_put_smb_ses(struct cifs_ses *ses);
 extern struct cifs_ses *
 cifs_get_smb_ses(struct TCP_Server_Info *server, struct smb3_fs_context *ctx);
 
+#if 0 // TODO Remove
 void cifs_readdata_release(struct cifs_io_subrequest *rdata);
 static inline void cifs_put_readdata(struct cifs_io_subrequest *rdata)
 {
 	if (refcount_dec_and_test(&rdata->subreq.ref))
 		cifs_readdata_release(rdata);
 }
+#endif
 int cifs_async_readv(struct cifs_io_subrequest *rdata);
 int cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid);
 
 int cifs_async_writev(struct cifs_io_subrequest *wdata);
 void cifs_writev_complete(struct work_struct *work);
+#if 0 // TODO Remove
 struct cifs_io_subrequest *cifs_writedata_alloc(work_func_t complete);
 void cifs_writedata_release(struct cifs_io_subrequest *rdata);
 static inline void cifs_get_writedata(struct cifs_io_subrequest *wdata)
@@ -609,6 +612,7 @@ static inline void cifs_put_writedata(struct cifs_io_subrequest *wdata)
 	if (refcount_dec_and_test(&wdata->subreq.ref))
 		cifs_writedata_release(wdata);
 }
+#endif
 int cifs_query_mf_symlink(unsigned int xid, struct cifs_tcon *tcon,
 			  struct cifs_sb_info *cifs_sb,
 			  const unsigned char *path, char *pbuf,
diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 702dae6bf913..66ed3f3f3db4 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1265,7 +1265,7 @@ static void
 cifs_readv_callback(struct mid_q_entry *mid)
 {
 	struct cifs_io_subrequest *rdata = mid->callback_data;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	struct TCP_Server_Info *server = tcon->ses->server;
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 2,
@@ -1306,7 +1306,12 @@ cifs_readv_callback(struct mid_q_entry *mid)
 		rdata->result = -EIO;
 	}
 
-	queue_work(cifsiod_wq, &rdata->work);
+	if (rdata->result == 0 || rdata->result == -EAGAIN)
+		iov_iter_advance(&rdata->subreq.io_iter, rdata->got_bytes);
+	netfs_subreq_terminated(&rdata->subreq,
+				(rdata->result == 0 || rdata->result == -EAGAIN) ?
+				rdata->got_bytes : rdata->result,
+				false);
 	release_mid(mid);
 	add_credits(server, &credits, 0);
 }
@@ -1318,7 +1323,7 @@ cifs_async_readv(struct cifs_io_subrequest *rdata)
 	int rc;
 	READ_REQ *smb = NULL;
 	int wct;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 2 };
 
@@ -1343,7 +1348,7 @@ cifs_async_readv(struct cifs_io_subrequest *rdata)
 	smb->hdr.PidHigh = cpu_to_le16((__u16)(rdata->pid >> 16));
 
 	smb->AndXCommand = 0xFF;	/* none */
-	smb->Fid = rdata->cfile->fid.netfid;
+	smb->Fid = rdata->req->cfile->fid.netfid;
 	smb->OffsetLow = cpu_to_le32(rdata->subreq.start & 0xFFFFFFFF);
 	if (wct == 12)
 		smb->OffsetHigh = cpu_to_le32(rdata->subreq.start >> 32);
@@ -1613,15 +1618,16 @@ static void
 cifs_writev_callback(struct mid_q_entry *mid)
 {
 	struct cifs_io_subrequest *wdata = mid->callback_data;
-	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
-	unsigned int written;
+	struct cifs_tcon *tcon = tlink_tcon(wdata->req->cfile->tlink);
 	WRITE_RSP *smb = (WRITE_RSP *)mid->resp_buf;
 	struct cifs_credits credits = { .value = 1, .instance = 0 };
+	ssize_t result;
+	size_t written;
 
 	switch (mid->mid_state) {
 	case MID_RESPONSE_RECEIVED:
-		wdata->result = cifs_check_receive(mid, tcon->ses->server, 0);
-		if (wdata->result != 0)
+		result = cifs_check_receive(mid, tcon->ses->server, 0);
+		if (result != 0)
 			break;
 
 		written = le16_to_cpu(smb->CountHigh);
@@ -1637,20 +1643,20 @@ cifs_writev_callback(struct mid_q_entry *mid)
 			written &= 0xFFFF;
 
 		if (written < wdata->subreq.len)
-			wdata->result = -ENOSPC;
+			result = -ENOSPC;
 		else
-			wdata->subreq.len = written;
+			result = written;
 		break;
 	case MID_REQUEST_SUBMITTED:
 	case MID_RETRY_NEEDED:
-		wdata->result = -EAGAIN;
+		result = -EAGAIN;
 		break;
 	default:
-		wdata->result = -EIO;
+		result = -EIO;
 		break;
 	}
 
-	queue_work(cifsiod_wq, &wdata->work);
+	cifs_write_subrequest_terminated(wdata, result, true);
 	release_mid(mid);
 	add_credits(tcon->ses->server, &credits, 0);
 }
@@ -1662,7 +1668,7 @@ cifs_async_writev(struct cifs_io_subrequest *wdata)
 	int rc = -EACCES;
 	WRITE_REQ *smb = NULL;
 	int wct;
-	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(wdata->req->cfile->tlink);
 	struct kvec iov[2];
 	struct smb_rqst rqst = { };
 
@@ -1672,7 +1678,8 @@ cifs_async_writev(struct cifs_io_subrequest *wdata)
 		wct = 12;
 		if (wdata->subreq.start >> 32 > 0) {
 			/* can not handle big offset for old srv */
-			return -EIO;
+			rc = -EIO;
+			goto out;
 		}
 	}
 
@@ -1684,7 +1691,7 @@ cifs_async_writev(struct cifs_io_subrequest *wdata)
 	smb->hdr.PidHigh = cpu_to_le16((__u16)(wdata->pid >> 16));
 
 	smb->AndXCommand = 0xFF;	/* none */
-	smb->Fid = wdata->cfile->fid.netfid;
+	smb->Fid = wdata->req->cfile->fid.netfid;
 	smb->OffsetLow = cpu_to_le32(wdata->subreq.start & 0xFFFFFFFF);
 	if (wct == 14)
 		smb->OffsetHigh = cpu_to_le32(wdata->subreq.start >> 32);
@@ -1724,17 +1731,17 @@ cifs_async_writev(struct cifs_io_subrequest *wdata)
 		iov[1].iov_len += 4; /* pad bigger by four bytes */
 	}
 
-	cifs_get_writedata(wdata);
 	rc = cifs_call_async(tcon->ses->server, &rqst, NULL,
 			     cifs_writev_callback, NULL, wdata, 0, NULL);
 
 	if (rc == 0)
 		cifs_stats_inc(&tcon->stats.cifs_stats.num_writes);
-	else
-		cifs_put_writedata(wdata);
 
 async_writev_out:
 	cifs_small_buf_release(smb);
+out:
+	if (rc)
+		cifs_write_subrequest_terminated(wdata, rc, false);
 	return rc;
 }
 
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index dfeb8cb86d61..6917f998d9ff 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/swap.h>
 #include <linux/mm.h>
+#include <linux/netfs.h>
 #include <asm/div64.h>
 #include "cifsfs.h"
 #include "cifspdu.h"
@@ -172,7 +173,7 @@ static void cifs_create_write_requests(struct netfs_io_request *wreq,
 failed_return_credits:
 	add_credits_and_wake_if(server, &wdata->credits, 0);
 failed:
-	netfs_write_subrequest_terminated(subreq, rc, false);
+	cifs_write_subrequest_terminated(wdata, rc, false);
 	free_xid(xid);
 }
 
@@ -394,6 +395,7 @@ const struct netfs_request_ops cifs_req_ops = {
 	.create_write_requests	= cifs_create_write_requests,
 };
 
+#if 0 // TODO remove 397
 /*
  * Remove the dirty flags from a span of pages.
  */
@@ -518,6 +520,7 @@ void cifs_pages_write_redirty(struct inode *inode, loff_t start, unsigned int le
 
 	rcu_read_unlock();
 }
+#endif // end netfslib remove 397
 
 /*
  * Mark as invalid, all open files on tree connections since they
@@ -2465,20 +2468,23 @@ int cifs_lock(struct file *file, int cmd, struct file_lock *flock)
 	return rc;
 }
 
-/*
- * update the file size (if needed) after a write. Should be called with
- * the inode->i_lock held
- */
-void
-cifs_update_eof(struct cifsInodeInfo *cifsi, loff_t offset,
-		      unsigned int bytes_written)
+void cifs_write_subrequest_terminated(struct cifs_io_subrequest *wdata, ssize_t result,
+				      bool was_async)
 {
-	loff_t end_of_write = offset + bytes_written;
+	struct netfs_io_request *wreq = wdata->rreq;
+	loff_t new_server_eof;
 
-	if (end_of_write > cifsi->netfs.remote_i_size)
-		netfs_resize_file(&cifsi->netfs, end_of_write, true);
+	if (result > 0) {
+		new_server_eof = wdata->subreq.start + wdata->subreq.transferred + result;
+
+		if (new_server_eof > netfs_inode(wreq->inode)->remote_i_size)
+			netfs_resize_file(netfs_inode(wreq->inode), new_server_eof, true);
+	}
+
+	netfs_write_subrequest_terminated(&wdata->subreq, result, was_async);
 }
 
+#if 0 // TODO remove 2483
 static ssize_t
 cifs_write(struct cifsFileInfo *open_file, __u32 pid, const char *write_data,
 	   size_t write_size, loff_t *offset)
@@ -2562,6 +2568,7 @@ cifs_write(struct cifsFileInfo *open_file, __u32 pid, const char *write_data,
 	free_xid(xid);
 	return total_written;
 }
+#endif // end netfslib remove 2483
 
 struct cifsFileInfo *find_readable_file(struct cifsInodeInfo *cifs_inode,
 					bool fsuid_only)
@@ -2767,6 +2774,7 @@ cifs_get_readable_path(struct cifs_tcon *tcon, const char *name,
 	return -ENOENT;
 }
 
+#if 0 // TODO remove 2773
 void
 cifs_writedata_release(struct cifs_io_subrequest *wdata)
 {
@@ -3457,7 +3465,11 @@ static int cifs_write_end(struct file *file, struct address_space *mapping,
 
 	return rc;
 }
+#endif // End netfs removal 2773
 
+/*
+ * Flush data on a strict file.
+ */
 int cifs_strict_fsync(struct file *file, loff_t start, loff_t end,
 		      int datasync)
 {
@@ -3512,6 +3524,9 @@ int cifs_strict_fsync(struct file *file, loff_t start, loff_t end,
 	return rc;
 }
 
+/*
+ * Flush data on a non-strict data.
+ */
 int cifs_fsync(struct file *file, loff_t start, loff_t end, int datasync)
 {
 	unsigned int xid;
@@ -3578,6 +3593,7 @@ int cifs_flush(struct file *file, fl_owner_t id)
 	return rc;
 }
 
+#if 0 // TODO remove 3594
 static void collect_uncached_write_data(struct cifs_aio_ctx *ctx);
 
 static void
@@ -4039,6 +4055,7 @@ ssize_t cifs_user_writev(struct kiocb *iocb, struct iov_iter *from)
 {
 	return __cifs_writev(iocb, from, false);
 }
+#endif // TODO remove 3594
 
 static ssize_t
 cifs_writev(struct kiocb *iocb, struct iov_iter *from)
@@ -4050,7 +4067,10 @@ cifs_writev(struct kiocb *iocb, struct iov_iter *from)
 	struct TCP_Server_Info *server = tlink_tcon(cfile->tlink)->ses->server;
 	ssize_t rc;
 
-	inode_lock(inode);
+	rc = netfs_start_io_write(inode);
+	if (rc < 0)
+		return rc;
+
 	/*
 	 * We need to hold the sem to be sure nobody modifies lock list
 	 * with a brlock that prevents writing.
@@ -4064,13 +4084,12 @@ cifs_writev(struct kiocb *iocb, struct iov_iter *from)
 	if (!cifs_find_lock_conflict(cfile, iocb->ki_pos, iov_iter_count(from),
 				     server->vals->exclusive_lock_type, 0,
 				     NULL, CIFS_WRITE_OP))
-		rc = __generic_file_write_iter(iocb, from);
+		rc = netfs_buffered_write_iter_locked(iocb, from, NULL);
 	else
 		rc = -EACCES;
 out:
 	up_read(&cinode->lock_sem);
-	inode_unlock(inode);
-
+	netfs_end_io_write(inode);
 	if (rc > 0)
 		rc = generic_write_sync(iocb, rc);
 	return rc;
@@ -4093,9 +4112,9 @@ cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from)
 
 	if (CIFS_CACHE_WRITE(cinode)) {
 		if (cap_unix(tcon->ses) &&
-		(CIFS_UNIX_FCNTL_CAP & le64_to_cpu(tcon->fsUnixInfo.Capability))
-		  && ((cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NOPOSIXBRL) == 0)) {
-			written = generic_file_write_iter(iocb, from);
+		    (CIFS_UNIX_FCNTL_CAP & le64_to_cpu(tcon->fsUnixInfo.Capability)) &&
+		    ((cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NOPOSIXBRL) == 0)) {
+			written = netfs_file_write_iter(iocb, from);
 			goto out;
 		}
 		written = cifs_writev(iocb, from);
@@ -4107,7 +4126,7 @@ cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from)
 	 * affected pages because it may cause a error with mandatory locks on
 	 * these pages but not on the region from pos to ppos+len-1.
 	 */
-	written = cifs_user_writev(iocb, from);
+	written = netfs_file_write_iter(iocb, from);
 	if (CIFS_CACHE_READ(cinode)) {
 		/*
 		 * We have read level caching and we have just sent a write
@@ -4126,6 +4145,7 @@ cifs_strict_writev(struct kiocb *iocb, struct iov_iter *from)
 	return written;
 }
 
+#if 0 // TODO remove 4143
 static struct cifs_io_subrequest *cifs_readdata_alloc(work_func_t complete)
 {
 	struct cifs_io_subrequest *rdata;
@@ -4565,7 +4585,9 @@ ssize_t cifs_direct_readv(struct kiocb *iocb, struct iov_iter *to)
 ssize_t cifs_user_readv(struct kiocb *iocb, struct iov_iter *to)
 {
 	return __cifs_readv(iocb, to, false);
+
 }
+#endif // end netfslib removal 4143
 
 ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
@@ -4573,13 +4595,13 @@ ssize_t cifs_loose_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	struct inode *inode = file_inode(iocb->ki_filp);
 
 	if (iocb->ki_flags & IOCB_DIRECT)
-		return cifs_user_readv(iocb, iter);
+		return netfs_unbuffered_read_iter(iocb, iter);
 
 	rc = cifs_revalidate_mapping(inode);
 	if (rc)
 		return rc;
 
-	return generic_file_read_iter(iocb, iter);
+	return netfs_file_read_iter(iocb, iter);
 }
 
 ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
@@ -4590,7 +4612,7 @@ ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	int rc;
 
 	if (iocb->ki_filp->f_flags & O_DIRECT) {
-		written = cifs_user_writev(iocb, from);
+		written = netfs_unbuffered_write_iter(iocb, from);
 		if (written > 0 && CIFS_CACHE_READ(cinode)) {
 			cifs_zap_mapping(inode);
 			cifs_dbg(FYI,
@@ -4605,17 +4627,15 @@ ssize_t cifs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	if (written)
 		return written;
 
-	written = generic_file_write_iter(iocb, from);
-
-	if (CIFS_CACHE_WRITE(CIFS_I(inode)))
-		goto out;
+	written = netfs_file_write_iter(iocb, from);
 
-	rc = filemap_fdatawrite(inode->i_mapping);
-	if (rc)
-		cifs_dbg(FYI, "cifs_file_write_iter: %d rc on %p inode\n",
-			 rc, inode);
+	if (!CIFS_CACHE_WRITE(CIFS_I(inode))) {
+		rc = filemap_fdatawrite(inode->i_mapping);
+		if (rc)
+			cifs_dbg(FYI, "cifs_file_write_iter: %d rc on %p inode\n",
+				 rc, inode);
+	}
 
-out:
 	cifs_put_writer(cinode);
 	return written;
 }
@@ -4640,12 +4660,15 @@ cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to)
 	 * pos+len-1.
 	 */
 	if (!CIFS_CACHE_READ(cinode))
-		return cifs_user_readv(iocb, to);
+		return netfs_unbuffered_read_iter(iocb, to);
 
 	if (cap_unix(tcon->ses) &&
 	    (CIFS_UNIX_FCNTL_CAP & le64_to_cpu(tcon->fsUnixInfo.Capability)) &&
-	    ((cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NOPOSIXBRL) == 0))
-		return generic_file_read_iter(iocb, to);
+	    ((cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NOPOSIXBRL) == 0)) {
+		if (iocb->ki_flags & IOCB_DIRECT)
+			return netfs_unbuffered_read_iter(iocb, to);
+		return netfs_buffered_read_iter(iocb, to);
+	}
 
 	/*
 	 * We need to hold the sem to be sure nobody modifies lock list
@@ -4654,12 +4677,17 @@ cifs_strict_readv(struct kiocb *iocb, struct iov_iter *to)
 	down_read(&cinode->lock_sem);
 	if (!cifs_find_lock_conflict(cfile, iocb->ki_pos, iov_iter_count(to),
 				     tcon->ses->server->vals->shared_lock_type,
-				     0, NULL, CIFS_READ_OP))
-		rc = generic_file_read_iter(iocb, to);
+				     0, NULL, CIFS_READ_OP)) {
+		if (iocb->ki_flags & IOCB_DIRECT)
+			rc = netfs_unbuffered_read_iter(iocb, to);
+		else
+			rc = netfs_buffered_read_iter(iocb, to);
+	}
 	up_read(&cinode->lock_sem);
 	return rc;
 }
 
+#if 0 // TODO remove 4633
 static ssize_t
 cifs_read(struct file *file, char *read_data, size_t read_size, loff_t *offset)
 {
@@ -4751,29 +4779,11 @@ cifs_read(struct file *file, char *read_data, size_t read_size, loff_t *offset)
 	free_xid(xid);
 	return total_read;
 }
+#endif // end netfslib remove 4633
 
-/*
- * If the page is mmap'ed into a process' page tables, then we need to make
- * sure that it doesn't change while being written back.
- */
 static vm_fault_t cifs_page_mkwrite(struct vm_fault *vmf)
 {
-	struct folio *folio = page_folio(vmf->page);
-
-	/* Wait for the folio to be written to the cache before we allow it to
-	 * be modified.  We then assume the entire folio will need writing back.
-	 */
-#ifdef CONFIG_CIFS_FSCACHE
-	if (folio_test_fscache(folio) &&
-	    folio_wait_fscache_killable(folio) < 0)
-		return VM_FAULT_RETRY;
-#endif
-
-	folio_wait_writeback(folio);
-
-	if (folio_lock_killable(folio) < 0)
-		return VM_FAULT_RETRY;
-	return VM_FAULT_LOCKED;
+	return netfs_page_mkwrite(vmf, NULL);
 }
 
 static const struct vm_operations_struct cifs_file_vm_ops = {
@@ -4819,6 +4829,7 @@ int cifs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return rc;
 }
 
+#if 0 // TODO remove 4794
 /*
  * Unlock a bunch of folios in the pagecache.
  */
@@ -5103,6 +5114,7 @@ static int cifs_read_folio(struct file *file, struct folio *folio)
 	free_xid(xid);
 	return rc;
 }
+#endif // end netfslib remove 4794
 
 static int is_inode_writable(struct cifsInodeInfo *cifs_inode)
 {
@@ -5149,6 +5161,7 @@ bool is_size_safe_to_change(struct cifsInodeInfo *cifsInode, __u64 end_of_file)
 		return true;
 }
 
+#if 0 // TODO remove 5152
 static int cifs_write_begin(struct file *file, struct address_space *mapping,
 			loff_t pos, unsigned len,
 			struct page **pagep, void **fsdata)
@@ -5265,6 +5278,7 @@ static int cifs_launder_folio(struct folio *folio)
 	folio_wait_fscache(folio);
 	return rc;
 }
+#endif // end netfslib remove 5152
 
 void cifs_oplock_break(struct work_struct *work)
 {
@@ -5355,6 +5369,7 @@ void cifs_oplock_break(struct work_struct *work)
 	cifs_done_oplock_break(cinode);
 }
 
+#if 0 // TODO remove 5333
 /*
  * The presence of cifs_direct_io() in the address space ops vector
  * allowes open() O_DIRECT flags which would have failed otherwise.
@@ -5373,6 +5388,7 @@ cifs_direct_io(struct kiocb *iocb, struct iov_iter *iter)
          */
         return -EINVAL;
 }
+#endif // netfs end remove 5333
 
 static int cifs_swap_activate(struct swap_info_struct *sis,
 			      struct file *swap_file, sector_t *span)
@@ -5435,22 +5451,20 @@ static void cifs_swap_deactivate(struct file *file)
 }
 
 const struct address_space_operations cifs_addr_ops = {
-	.read_folio = cifs_read_folio,
-	.readahead = cifs_readahead,
-	.writepages = cifs_writepages,
-	.write_begin = cifs_write_begin,
-	.write_end = cifs_write_end,
-	.dirty_folio = netfs_dirty_folio,
-	.release_folio = cifs_release_folio,
-	.direct_IO = cifs_direct_io,
-	.invalidate_folio = cifs_invalidate_folio,
-	.launder_folio = cifs_launder_folio,
-	.migrate_folio = filemap_migrate_folio,
+	.read_folio	= netfs_read_folio,
+	.readahead	= netfs_readahead,
+	.writepages	= netfs_writepages,
+	.dirty_folio	= netfs_dirty_folio,
+	.release_folio	= netfs_release_folio,
+	.direct_IO	= noop_direct_IO,
+	.invalidate_folio = netfs_invalidate_folio,
+	.launder_folio	= netfs_launder_folio,
+	.migrate_folio	= filemap_migrate_folio,
 	/*
 	 * TODO: investigate and if useful we could add an is_dirty_writeback
 	 * helper if needed
 	 */
-	.swap_activate = cifs_swap_activate,
+	.swap_activate	= cifs_swap_activate,
 	.swap_deactivate = cifs_swap_deactivate,
 };
 
@@ -5460,13 +5474,11 @@ const struct address_space_operations cifs_addr_ops = {
  * to leave cifs_readahead out of the address space operations.
  */
 const struct address_space_operations cifs_addr_ops_smallbuf = {
-	.read_folio = cifs_read_folio,
-	.writepages = cifs_writepages,
-	.write_begin = cifs_write_begin,
-	.write_end = cifs_write_end,
-	.dirty_folio = netfs_dirty_folio,
-	.release_folio = cifs_release_folio,
-	.invalidate_folio = cifs_invalidate_folio,
-	.launder_folio = cifs_launder_folio,
-	.migrate_folio = filemap_migrate_folio,
+	.read_folio	= netfs_read_folio,
+	.writepages	= netfs_writepages,
+	.dirty_folio	= netfs_dirty_folio,
+	.release_folio	= netfs_release_folio,
+	.invalidate_folio = netfs_invalidate_folio,
+	.launder_folio	= netfs_launder_folio,
+	.migrate_folio	= filemap_migrate_folio,
 };
diff --git a/fs/smb/client/fscache.c b/fs/smb/client/fscache.c
index c4a3cb736881..228fe57bbde3 100644
--- a/fs/smb/client/fscache.c
+++ b/fs/smb/client/fscache.c
@@ -137,6 +137,7 @@ void cifs_fscache_release_inode_cookie(struct inode *inode)
 	}
 }
 
+#if 0 // TODO remove
 /*
  * Fallback page reading interface.
  */
@@ -245,3 +246,4 @@ int __cifs_fscache_query_occupancy(struct inode *inode,
 	fscache_end_operation(&cres);
 	return ret;
 }
+#endif
diff --git a/fs/smb/client/fscache.h b/fs/smb/client/fscache.h
index a3d73720914f..c2c05a778a71 100644
--- a/fs/smb/client/fscache.h
+++ b/fs/smb/client/fscache.h
@@ -74,6 +74,7 @@ static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags
 			   i_size_read(inode), flags);
 }
 
+#if 0 // TODO remove
 extern int __cifs_fscache_query_occupancy(struct inode *inode,
 					  pgoff_t first, unsigned int nr_pages,
 					  pgoff_t *_data_first,
@@ -108,6 +109,7 @@ static inline void cifs_readahead_to_fscache(struct inode *inode,
 	if (cifs_inode_cookie(inode))
 		__cifs_readahead_to_fscache(inode, pos, len);
 }
+#endif
 
 #else /* CONFIG_CIFS_FSCACHE */
 static inline
@@ -125,6 +127,7 @@ static inline void cifs_fscache_unuse_inode_cookie(struct inode *inode, bool upd
 static inline struct fscache_cookie *cifs_inode_cookie(struct inode *inode) { return NULL; }
 static inline void cifs_invalidate_cache(struct inode *inode, unsigned int flags) {}
 
+#if 0 // TODO remove
 static inline int cifs_fscache_query_occupancy(struct inode *inode,
 					       pgoff_t first, unsigned int nr_pages,
 					       pgoff_t *_data_first,
@@ -143,6 +146,7 @@ cifs_readpage_from_fscache(struct inode *inode, struct page *page)
 
 static inline
 void cifs_readahead_to_fscache(struct inode *inode, loff_t pos, size_t len) {}
+#endif
 
 #endif /* CONFIG_CIFS_FSCACHE */
 
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index e8afdc969226..53d923e47fc6 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -27,14 +27,29 @@
 #include "cifs_ioctl.h"
 #include "cached_dir.h"
 
+/*
+ * Set parameters for the netfs library
+ */
+static void cifs_set_netfs_context(struct inode *inode)
+{
+	struct cifsInodeInfo *cifs_i = CIFS_I(inode);
+	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
+
+	netfs_inode_init(&cifs_i->netfs, &cifs_req_ops);
+	if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_STRICT_IO)
+		__set_bit(NETFS_ICTX_WRITETHROUGH, &cifs_i->netfs.flags);
+}
+
 static void cifs_set_ops(struct inode *inode)
 {
 	struct cifs_sb_info *cifs_sb = CIFS_SB(inode->i_sb);
+	struct netfs_inode *ictx = netfs_inode(inode);
 
 	switch (inode->i_mode & S_IFMT) {
 	case S_IFREG:
 		inode->i_op = &cifs_file_inode_ops;
 		if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_DIRECT_IO) {
+			set_bit(NETFS_ICTX_UNBUFFERED, &ictx->flags);
 			if (cifs_sb->mnt_cifs_flags & CIFS_MOUNT_NO_BRL)
 				inode->i_fop = &cifs_file_direct_nobrl_ops;
 			else
@@ -218,8 +233,10 @@ cifs_fattr_to_inode(struct inode *inode, struct cifs_fattr *fattr)
 
 	if (fattr->cf_flags & CIFS_FATTR_JUNCTION)
 		inode->i_flags |= S_AUTOMOUNT;
-	if (inode->i_state & I_NEW)
+	if (inode->i_state & I_NEW) {
+		cifs_set_netfs_context(inode);
 		cifs_set_ops(inode);
+	}
 	return 0;
 }
 
diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index 26db4a2d2643..c702aec03fca 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4220,10 +4220,12 @@ smb2_new_read_req(void **buf, unsigned int *total_len,
 	req->Length = cpu_to_le32(io_parms->length);
 	req->Offset = cpu_to_le64(io_parms->offset);
 
-	trace_smb3_read_enter(0 /* xid */,
-			io_parms->persistent_fid,
-			io_parms->tcon->tid, io_parms->tcon->ses->Suid,
-			io_parms->offset, io_parms->length);
+	trace_smb3_read_enter(rdata ? rdata->rreq->debug_id : 0,
+			      rdata ? rdata->subreq.debug_index : 0,
+			      rdata ? rdata->xid : 0,
+			      io_parms->persistent_fid,
+			      io_parms->tcon->tid, io_parms->tcon->ses->Suid,
+			      io_parms->offset, io_parms->length);
 #ifdef CONFIG_CIFS_SMB_DIRECT
 	/*
 	 * If we want to do a RDMA write, fill in and append
@@ -4285,7 +4287,7 @@ static void
 smb2_readv_callback(struct mid_q_entry *mid)
 {
 	struct cifs_io_subrequest *rdata = mid->callback_data;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	struct TCP_Server_Info *server = rdata->server;
 	struct smb2_hdr *shdr =
 				(struct smb2_hdr *)rdata->iov[0].iov_base;
@@ -4355,17 +4357,33 @@ smb2_readv_callback(struct mid_q_entry *mid)
 #endif
 	if (rdata->result && rdata->result != -ENODATA) {
 		cifs_stats_fail_inc(tcon, SMB2_READ_HE);
-		trace_smb3_read_err(0 /* xid */,
-				    rdata->cfile->fid.persistent_fid,
+		trace_smb3_read_err(rdata->rreq->debug_id,
+				    rdata->subreq.debug_index,
+				    rdata->xid,
+				    rdata->req->cfile->fid.persistent_fid,
 				    tcon->tid, tcon->ses->Suid, rdata->subreq.start,
 				    rdata->subreq.len, rdata->result);
 	} else
-		trace_smb3_read_done(0 /* xid */,
-				     rdata->cfile->fid.persistent_fid,
+		trace_smb3_read_done(rdata->rreq->debug_id,
+				     rdata->subreq.debug_index,
+				     rdata->xid,
+				     rdata->req->cfile->fid.persistent_fid,
 				     tcon->tid, tcon->ses->Suid,
 				     rdata->subreq.start, rdata->got_bytes);
 
-	queue_work(cifsiod_wq, &rdata->work);
+	if (rdata->result == -ENODATA) {
+		/* We may have got an EOF error because fallocate
+		 * failed to enlarge the file.
+		 */
+		if (rdata->subreq.start < rdata->subreq.rreq->i_size)
+			rdata->result = 0;
+	}
+	if (rdata->result == 0 || rdata->result == -EAGAIN)
+		iov_iter_advance(&rdata->subreq.io_iter, rdata->got_bytes);
+	rdata->have_credits = false;
+	netfs_subreq_terminated(&rdata->subreq,
+				(rdata->result == 0 || rdata->result == -EAGAIN) ?
+				rdata->got_bytes : rdata->result, true);
 	release_mid(mid);
 	add_credits(server, &credits, 0);
 }
@@ -4381,7 +4399,7 @@ smb2_async_readv(struct cifs_io_subrequest *rdata)
 	struct smb_rqst rqst = { .rq_iov = rdata->iov,
 				 .rq_nvec = 1 };
 	struct TCP_Server_Info *server;
-	struct cifs_tcon *tcon = tlink_tcon(rdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
 	unsigned int total_len;
 	int credit_request;
 
@@ -4391,12 +4409,12 @@ smb2_async_readv(struct cifs_io_subrequest *rdata)
 	if (!rdata->server)
 		rdata->server = cifs_pick_channel(tcon->ses);
 
-	io_parms.tcon = tlink_tcon(rdata->cfile->tlink);
+	io_parms.tcon = tlink_tcon(rdata->req->cfile->tlink);
 	io_parms.server = server = rdata->server;
 	io_parms.offset = rdata->subreq.start;
 	io_parms.length = rdata->subreq.len;
-	io_parms.persistent_fid = rdata->cfile->fid.persistent_fid;
-	io_parms.volatile_fid = rdata->cfile->fid.volatile_fid;
+	io_parms.persistent_fid = rdata->req->cfile->fid.persistent_fid;
+	io_parms.volatile_fid = rdata->req->cfile->fid.volatile_fid;
 	io_parms.pid = rdata->pid;
 
 	rc = smb2_new_read_req(
@@ -4436,7 +4454,9 @@ smb2_async_readv(struct cifs_io_subrequest *rdata)
 			     &rdata->credits);
 	if (rc) {
 		cifs_stats_fail_inc(io_parms.tcon, SMB2_READ_HE);
-		trace_smb3_read_err(0 /* xid */, io_parms.persistent_fid,
+		trace_smb3_read_err(rdata->rreq->debug_id,
+				    rdata->subreq.debug_index,
+				    rdata->xid, io_parms.persistent_fid,
 				    io_parms.tcon->tid,
 				    io_parms.tcon->ses->Suid,
 				    io_parms.offset, io_parms.length, rc);
@@ -4487,22 +4507,23 @@ SMB2_read(const unsigned int xid, struct cifs_io_parms *io_parms,
 		if (rc != -ENODATA) {
 			cifs_stats_fail_inc(io_parms->tcon, SMB2_READ_HE);
 			cifs_dbg(VFS, "Send error in read = %d\n", rc);
-			trace_smb3_read_err(xid,
+			trace_smb3_read_err(0, 0, xid,
 					    req->PersistentFileId,
 					    io_parms->tcon->tid, ses->Suid,
 					    io_parms->offset, io_parms->length,
 					    rc);
 		} else
-			trace_smb3_read_done(xid, req->PersistentFileId, io_parms->tcon->tid,
+			trace_smb3_read_done(0, 0, xid,
+					     req->PersistentFileId, io_parms->tcon->tid,
 					     ses->Suid, io_parms->offset, 0);
 		free_rsp_buf(resp_buftype, rsp_iov.iov_base);
 		cifs_small_buf_release(req);
 		return rc == -ENODATA ? 0 : rc;
 	} else
-		trace_smb3_read_done(xid,
-				    req->PersistentFileId,
-				    io_parms->tcon->tid, ses->Suid,
-				    io_parms->offset, io_parms->length);
+		trace_smb3_read_done(0, 0, xid,
+				     req->PersistentFileId,
+				     io_parms->tcon->tid, ses->Suid,
+				     io_parms->offset, io_parms->length);
 
 	cifs_small_buf_release(req);
 
@@ -4536,11 +4557,12 @@ static void
 smb2_writev_callback(struct mid_q_entry *mid)
 {
 	struct cifs_io_subrequest *wdata = mid->callback_data;
-	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(wdata->req->cfile->tlink);
 	struct TCP_Server_Info *server = wdata->server;
-	unsigned int written;
 	struct smb2_write_rsp *rsp = (struct smb2_write_rsp *)mid->resp_buf;
 	struct cifs_credits credits = { .value = 0, .instance = 0 };
+	ssize_t result = 0;
+	size_t written;
 
 	WARN_ONCE(wdata->server != mid->server,
 		  "wdata server %p != mid server %p",
@@ -4550,8 +4572,8 @@ smb2_writev_callback(struct mid_q_entry *mid)
 	case MID_RESPONSE_RECEIVED:
 		credits.value = le16_to_cpu(rsp->hdr.CreditRequest);
 		credits.instance = server->reconnect_instance;
-		wdata->result = smb2_check_receive(mid, server, 0);
-		if (wdata->result != 0)
+		result = smb2_check_receive(mid, server, 0);
+		if (result != 0)
 			break;
 
 		written = le32_to_cpu(rsp->DataLength);
@@ -4568,17 +4590,18 @@ smb2_writev_callback(struct mid_q_entry *mid)
 			wdata->result = -ENOSPC;
 		else
 			wdata->subreq.len = written;
+		iov_iter_advance(&wdata->subreq.io_iter, written);
 		break;
 	case MID_REQUEST_SUBMITTED:
 	case MID_RETRY_NEEDED:
-		wdata->result = -EAGAIN;
+		result = -EAGAIN;
 		break;
 	case MID_RESPONSE_MALFORMED:
 		credits.value = le16_to_cpu(rsp->hdr.CreditRequest);
 		credits.instance = server->reconnect_instance;
 		fallthrough;
 	default:
-		wdata->result = -EIO;
+		result = -EIO;
 		break;
 	}
 #ifdef CONFIG_CIFS_SMB_DIRECT
@@ -4594,10 +4617,10 @@ smb2_writev_callback(struct mid_q_entry *mid)
 		wdata->mr = NULL;
 	}
 #endif
-	if (wdata->result) {
+	if (result) {
 		cifs_stats_fail_inc(tcon, SMB2_WRITE_HE);
 		trace_smb3_write_err(0 /* no xid */,
-				     wdata->cfile->fid.persistent_fid,
+				     wdata->req->cfile->fid.persistent_fid,
 				     tcon->tid, tcon->ses->Suid, wdata->subreq.start,
 				     wdata->subreq.len, wdata->result);
 		if (wdata->result == -ENOSPC)
@@ -4605,11 +4628,11 @@ smb2_writev_callback(struct mid_q_entry *mid)
 				     tcon->tree_name);
 	} else
 		trace_smb3_write_done(0 /* no xid */,
-				      wdata->cfile->fid.persistent_fid,
+				      wdata->req->cfile->fid.persistent_fid,
 				      tcon->tid, tcon->ses->Suid,
 				      wdata->subreq.start, wdata->subreq.len);
 
-	queue_work(cifsiod_wq, &wdata->work);
+	cifs_write_subrequest_terminated(wdata, result ?: written, true);
 	release_mid(mid);
 	add_credits(server, &credits, 0);
 }
@@ -4621,7 +4644,7 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 	int rc = -EACCES, flags = 0;
 	struct smb2_write_req *req = NULL;
 	struct smb2_hdr *shdr;
-	struct cifs_tcon *tcon = tlink_tcon(wdata->cfile->tlink);
+	struct cifs_tcon *tcon = tlink_tcon(wdata->req->cfile->tlink);
 	struct TCP_Server_Info *server = wdata->server;
 	struct kvec iov[1];
 	struct smb_rqst rqst = { };
@@ -4642,8 +4665,8 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 		.server = server,
 		.offset = wdata->subreq.start,
 		.length = wdata->subreq.len,
-		.persistent_fid = wdata->cfile->fid.persistent_fid,
-		.volatile_fid = wdata->cfile->fid.volatile_fid,
+		.persistent_fid = wdata->req->cfile->fid.persistent_fid,
+		.volatile_fid = wdata->req->cfile->fid.volatile_fid,
 		.pid = wdata->pid,
 	};
 	io_parms = &_io_parms;
@@ -4651,7 +4674,7 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 	rc = smb2_plain_req_init(SMB2_WRITE, tcon, server,
 				 (void **) &req, &total_len);
 	if (rc)
-		return rc;
+		goto out;
 
 	if (smb3_encryption_required(tcon))
 		flags |= CIFS_TRANSFORM_REQ;
@@ -4748,7 +4771,6 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 		flags |= CIFS_HAS_CREDITS;
 	}
 
-	cifs_get_writedata(wdata);
 	rc = cifs_call_async(server, &rqst, NULL, smb2_writev_callback, NULL,
 			     wdata, flags, &wdata->credits);
 
@@ -4760,12 +4782,14 @@ smb2_async_writev(struct cifs_io_subrequest *wdata)
 				     io_parms->offset,
 				     io_parms->length,
 				     rc);
-		cifs_put_writedata(wdata);
 		cifs_stats_fail_inc(tcon, SMB2_WRITE_HE);
 	}
 
 async_writev_out:
 	cifs_small_buf_release(req);
+out:
+	if (rc)
+		cifs_write_subrequest_terminated(wdata, rc, true);
 	return rc;
 }
 
diff --git a/fs/smb/client/trace.h b/fs/smb/client/trace.h
index de199ec9f726..b24264aeac13 100644
--- a/fs/smb/client/trace.h
+++ b/fs/smb/client/trace.h
@@ -21,6 +21,62 @@
 
 /* For logging errors in read or write */
 DECLARE_EVENT_CLASS(smb3_rw_err_class,
+	TP_PROTO(unsigned int rreq_debug_id,
+		 unsigned int rreq_debug_index,
+		 unsigned int xid,
+		 __u64	fid,
+		 __u32	tid,
+		 __u64	sesid,
+		 __u64	offset,
+		 __u32	len,
+		 int	rc),
+	TP_ARGS(rreq_debug_id, rreq_debug_index,
+		xid, fid, tid, sesid, offset, len, rc),
+	TP_STRUCT__entry(
+		__field(unsigned int, rreq_debug_id)
+		__field(unsigned int, rreq_debug_index)
+		__field(unsigned int, xid)
+		__field(__u64, fid)
+		__field(__u32, tid)
+		__field(__u64, sesid)
+		__field(__u64, offset)
+		__field(__u32, len)
+		__field(int, rc)
+	),
+	TP_fast_assign(
+		__entry->rreq_debug_id = rreq_debug_id;
+		__entry->rreq_debug_index = rreq_debug_index;
+		__entry->xid = xid;
+		__entry->fid = fid;
+		__entry->tid = tid;
+		__entry->sesid = sesid;
+		__entry->offset = offset;
+		__entry->len = len;
+		__entry->rc = rc;
+	),
+	TP_printk("\tR=%08x[%x] xid=%u sid=0x%llx tid=0x%x fid=0x%llx offset=0x%llx len=0x%x rc=%d",
+		  __entry->rreq_debug_id, __entry->rreq_debug_index,
+		  __entry->xid, __entry->sesid, __entry->tid, __entry->fid,
+		  __entry->offset, __entry->len, __entry->rc)
+)
+
+#define DEFINE_SMB3_RW_ERR_EVENT(name)          \
+DEFINE_EVENT(smb3_rw_err_class, smb3_##name,    \
+	TP_PROTO(unsigned int rreq_debug_id,	\
+		 unsigned int rreq_debug_index,		\
+		 unsigned int xid,			\
+		 __u64	fid,				\
+		 __u32	tid,				\
+		 __u64	sesid,				\
+		 __u64	offset,				\
+		 __u32	len,				\
+		 int	rc),				\
+	TP_ARGS(rreq_debug_id, rreq_debug_index, xid, fid, tid, sesid, offset, len, rc))
+
+DEFINE_SMB3_RW_ERR_EVENT(read_err);
+
+/* For logging errors in other file I/O ops */
+DECLARE_EVENT_CLASS(smb3_other_err_class,
 	TP_PROTO(unsigned int xid,
 		__u64	fid,
 		__u32	tid,
@@ -52,8 +108,8 @@ DECLARE_EVENT_CLASS(smb3_rw_err_class,
 		__entry->offset, __entry->len, __entry->rc)
 )
 
-#define DEFINE_SMB3_RW_ERR_EVENT(name)          \
-DEFINE_EVENT(smb3_rw_err_class, smb3_##name,    \
+#define DEFINE_SMB3_OTHER_ERR_EVENT(name)	\
+DEFINE_EVENT(smb3_other_err_class, smb3_##name, \
 	TP_PROTO(unsigned int xid,		\
 		__u64	fid,			\
 		__u32	tid,			\
@@ -63,15 +119,67 @@ DEFINE_EVENT(smb3_rw_err_class, smb3_##name,    \
 		int	rc),			\
 	TP_ARGS(xid, fid, tid, sesid, offset, len, rc))
 
-DEFINE_SMB3_RW_ERR_EVENT(write_err);
-DEFINE_SMB3_RW_ERR_EVENT(read_err);
-DEFINE_SMB3_RW_ERR_EVENT(query_dir_err);
-DEFINE_SMB3_RW_ERR_EVENT(zero_err);
-DEFINE_SMB3_RW_ERR_EVENT(falloc_err);
+DEFINE_SMB3_OTHER_ERR_EVENT(write_err);
+DEFINE_SMB3_OTHER_ERR_EVENT(query_dir_err);
+DEFINE_SMB3_OTHER_ERR_EVENT(zero_err);
+DEFINE_SMB3_OTHER_ERR_EVENT(falloc_err);
 
 
 /* For logging successful read or write */
 DECLARE_EVENT_CLASS(smb3_rw_done_class,
+	TP_PROTO(unsigned int rreq_debug_id,
+		 unsigned int rreq_debug_index,
+		 unsigned int xid,
+		 __u64	fid,
+		 __u32	tid,
+		 __u64	sesid,
+		 __u64	offset,
+		 __u32	len),
+	TP_ARGS(rreq_debug_id, rreq_debug_index,
+		xid, fid, tid, sesid, offset, len),
+	TP_STRUCT__entry(
+		__field(unsigned int, rreq_debug_id)
+		__field(unsigned int, rreq_debug_index)
+		__field(unsigned int, xid)
+		__field(__u64, fid)
+		__field(__u32, tid)
+		__field(__u64, sesid)
+		__field(__u64, offset)
+		__field(__u32, len)
+	),
+	TP_fast_assign(
+		__entry->rreq_debug_id = rreq_debug_id;
+		__entry->rreq_debug_index = rreq_debug_index;
+		__entry->xid = xid;
+		__entry->fid = fid;
+		__entry->tid = tid;
+		__entry->sesid = sesid;
+		__entry->offset = offset;
+		__entry->len = len;
+	),
+	TP_printk("R=%08x[%x] xid=%u sid=0x%llx tid=0x%x fid=0x%llx offset=0x%llx len=0x%x",
+		  __entry->rreq_debug_id, __entry->rreq_debug_index,
+		  __entry->xid, __entry->sesid, __entry->tid, __entry->fid,
+		  __entry->offset, __entry->len)
+)
+
+#define DEFINE_SMB3_RW_DONE_EVENT(name)         \
+DEFINE_EVENT(smb3_rw_done_class, smb3_##name,   \
+	TP_PROTO(unsigned int rreq_debug_id,	\
+		 unsigned int rreq_debug_index,	\
+		 unsigned int xid,		\
+		__u64	fid,			\
+		__u32	tid,			\
+		__u64	sesid,			\
+		__u64	offset,			\
+		__u32	len),			\
+	TP_ARGS(rreq_debug_id, rreq_debug_index, xid, fid, tid, sesid, offset, len))
+
+DEFINE_SMB3_RW_DONE_EVENT(read_enter);
+DEFINE_SMB3_RW_DONE_EVENT(read_done);
+
+/* For logging successful other op */
+DECLARE_EVENT_CLASS(smb3_other_done_class,
 	TP_PROTO(unsigned int xid,
 		__u64	fid,
 		__u32	tid,
@@ -100,8 +208,8 @@ DECLARE_EVENT_CLASS(smb3_rw_done_class,
 		__entry->offset, __entry->len)
 )
 
-#define DEFINE_SMB3_RW_DONE_EVENT(name)         \
-DEFINE_EVENT(smb3_rw_done_class, smb3_##name,   \
+#define DEFINE_SMB3_OTHER_DONE_EVENT(name)         \
+DEFINE_EVENT(smb3_other_done_class, smb3_##name,   \
 	TP_PROTO(unsigned int xid,		\
 		__u64	fid,			\
 		__u32	tid,			\
@@ -110,16 +218,14 @@ DEFINE_EVENT(smb3_rw_done_class, smb3_##name,   \
 		__u32	len),			\
 	TP_ARGS(xid, fid, tid, sesid, offset, len))
 
-DEFINE_SMB3_RW_DONE_EVENT(write_enter);
-DEFINE_SMB3_RW_DONE_EVENT(read_enter);
-DEFINE_SMB3_RW_DONE_EVENT(query_dir_enter);
-DEFINE_SMB3_RW_DONE_EVENT(zero_enter);
-DEFINE_SMB3_RW_DONE_EVENT(falloc_enter);
-DEFINE_SMB3_RW_DONE_EVENT(write_done);
-DEFINE_SMB3_RW_DONE_EVENT(read_done);
-DEFINE_SMB3_RW_DONE_EVENT(query_dir_done);
-DEFINE_SMB3_RW_DONE_EVENT(zero_done);
-DEFINE_SMB3_RW_DONE_EVENT(falloc_done);
+DEFINE_SMB3_OTHER_DONE_EVENT(write_enter);
+DEFINE_SMB3_OTHER_DONE_EVENT(query_dir_enter);
+DEFINE_SMB3_OTHER_DONE_EVENT(zero_enter);
+DEFINE_SMB3_OTHER_DONE_EVENT(falloc_enter);
+DEFINE_SMB3_OTHER_DONE_EVENT(write_done);
+DEFINE_SMB3_OTHER_DONE_EVENT(query_dir_done);
+DEFINE_SMB3_OTHER_DONE_EVENT(zero_done);
+DEFINE_SMB3_OTHER_DONE_EVENT(falloc_done);
 
 /* For logging successful set EOF (truncate) */
 DECLARE_EVENT_CLASS(smb3_eof_class,
diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index 5cf653463c55..c72fb243c159 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -1798,8 +1798,11 @@ cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid)
 		length = data_len; /* An RDMA read is already done. */
 	else
 #endif
+	{
 		length = cifs_read_iter_from_socket(server, &rdata->subreq.io_iter,
 						    data_len);
+		iov_iter_revert(&rdata->subreq.io_iter, data_len);
+	}
 	if (length > 0)
 		rdata->got_bytes += length;
 	server->total_read += length;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

