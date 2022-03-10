Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CAB4D4E89
	for <lists+linux-cachefs@lfdr.de>; Thu, 10 Mar 2022 17:19:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1646929185;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NxDLRD9n/UYkJN55nQuhar5IyMbhXm8nsmHrFP9fDI8=;
	b=NHsMeB5aKtSas8t7NMfUdDGWtSxdeu95t/LVLcLV05gvIGUos19TW/APXjZBOAwnOz1z7G
	FTNtarMFmuorysQtP1nKCThAt+eF/iLpElkV7ZWQ5q7AhTQfWJOMajeEcAhaV//B9Rv6W4
	O1L3uPJ2jf4wCpeJo5CNsSDu/yDmaTk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-diSuD2RqM_aSG-EaTILQfA-1; Thu, 10 Mar 2022 11:18:15 -0500
X-MC-Unique: diSuD2RqM_aSG-EaTILQfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F7AE2A2AD42;
	Thu, 10 Mar 2022 16:18:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E881240C1242;
	Thu, 10 Mar 2022 16:18:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 87408194E00A;
	Thu, 10 Mar 2022 16:18:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 932B119452D2 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 10 Mar 2022 16:18:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4E48286C39; Thu, 10 Mar 2022 16:18:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.19])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9AA278C1B;
 Thu, 10 Mar 2022 16:17:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com
Date: Thu, 10 Mar 2022 16:17:56 +0000
Message-ID: <164692907694.2099075.10081819855690054094.stgit@warthog.procyon.org.uk>
In-Reply-To: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
References: <164692883658.2099075.5745824552116419504.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Subject: [Linux-cachefs] [PATCH v3 12/20] ceph: Make ceph_init_request()
 check caps on readahead
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
 linux-cifs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, Ilya Dryomov <idryomov@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Anna Schumaker <anna.schumaker@netapp.com>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move the caps check from ceph_readahead() to ceph_init_request(),
conditional on the origin being NETFS_READAHEAD so that in a future patch,
ceph can point its ->readahead() vector directly at netfs_readahead().

Changes
=======
ver #3)
 - Split from the patch to add a netfs inode context[1].
 - Need to store the caps got in rreq->netfs_priv for later freeing.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: ceph-devel@vger.kernel.org
cc: linux-cachefs@redhat.com
Link: https://lore.kernel.org/r/8af0d47f17d89c06bbf602496dd845f2b0bf25b3.camel@kernel.org/ [1]
---

 fs/ceph/addr.c |   69 +++++++++++++++++++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 9189257476f8..6d056db41f50 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -354,6 +354,45 @@ static void ceph_netfs_issue_read(struct netfs_io_subrequest *subreq)
 	dout("%s: result %d\n", __func__, err);
 }
 
+static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
+{
+	struct inode *inode = rreq->inode;
+	int got = 0, want = CEPH_CAP_FILE_CACHE;
+	int ret = 0;
+
+	if (file) {
+		struct ceph_rw_context *rw_ctx;
+		struct ceph_file_info *fi = file->private_data;
+
+		rw_ctx = ceph_find_rw_context(fi);
+		if (rw_ctx)
+			return 0;
+	}
+
+	if (rreq->origin != NETFS_READAHEAD)
+		return 0;
+
+	/*
+	 * readahead callers do not necessarily hold Fcb caps
+	 * (e.g. fadvise, madvise).
+	 */
+	ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
+	if (ret < 0) {
+		dout("start_read %p, error getting cap\n", inode);
+		return ret;
+	}
+
+	if (!(got & want)) {
+		dout("start_read %p, no cache cap\n", inode);
+		return -EACCES;
+	}
+	if (ret == 0)
+		return -EACCES;
+
+	rreq->netfs_priv = (void *)(uintptr_t)got;
+	return 0;
+}
+
 static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 {
 	struct inode *inode = mapping->host;
@@ -365,7 +404,7 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 }
 
 static const struct netfs_request_ops ceph_netfs_read_ops = {
-	.is_cache_enabled	= ceph_is_cache_enabled,
+	.init_request		= ceph_init_request,
 	.begin_cache_operation	= ceph_begin_cache_operation,
 	.issue_read		= ceph_netfs_issue_read,
 	.expand_readahead	= ceph_netfs_expand_readahead,
@@ -393,33 +432,7 @@ static int ceph_readpage(struct file *file, struct page *subpage)
 
 static void ceph_readahead(struct readahead_control *ractl)
 {
-	struct inode *inode = file_inode(ractl->file);
-	struct ceph_file_info *fi = ractl->file->private_data;
-	struct ceph_rw_context *rw_ctx;
-	int got = 0;
-	int ret = 0;
-
-	if (ceph_inode(inode)->i_inline_version != CEPH_INLINE_NONE)
-		return;
-
-	rw_ctx = ceph_find_rw_context(fi);
-	if (!rw_ctx) {
-		/*
-		 * readahead callers do not necessarily hold Fcb caps
-		 * (e.g. fadvise, madvise).
-		 */
-		int want = CEPH_CAP_FILE_CACHE;
-
-		ret = ceph_try_get_caps(inode, CEPH_CAP_FILE_RD, want, true, &got);
-		if (ret < 0)
-			dout("start_read %p, error getting cap\n", inode);
-		else if (!(got & want))
-			dout("start_read %p, no cache cap\n", inode);
-
-		if (ret <= 0)
-			return;
-	}
-	netfs_readahead(ractl, &ceph_netfs_read_ops, (void *)(uintptr_t)got);
+	netfs_readahead(ractl, &ceph_netfs_read_ops, NULL);
 }
 
 #ifdef CONFIG_CEPH_FSCACHE


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

