Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CE351546DBD
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Jun 2022 21:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654891036;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t31W44fI1CQKWHIa7ePx55dX+dtxSQDQ1cOa+oGY7x8=;
	b=Y6MYSzXSW+vhoKK2neqLo2n1tJuyTjI7+yiRcfR0bH14StCZO9ayeZowoNj/UDpo8I/Tpv
	mJ7v3WkUemH/LoFuc78cp/x+saqMUZOgbhOzPVT06Mq40Z1mxJ0hW8swmW9+aI2e+cWfmE
	ZhWUbdBx2mRfj8xWKpWeb/uSokHBBMc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-OQ2Pb3pfPCyeNyvrfSiK1Q-1; Fri, 10 Jun 2022 15:57:13 -0400
X-MC-Unique: OQ2Pb3pfPCyeNyvrfSiK1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 219073C0F729;
	Fri, 10 Jun 2022 19:57:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 171F418EA9;
	Fri, 10 Jun 2022 19:57:13 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9177D1947057;
	Fri, 10 Jun 2022 19:57:12 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8C5FC1947054 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 19:57:11 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 7419F401E5C; Fri, 10 Jun 2022 19:57:11 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1EAB492C3B;
 Fri, 10 Jun 2022 19:57:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
Date: Fri, 10 Jun 2022 20:57:09 +0100
Message-ID: <165489102899.703883.17034408390431788184.stgit@warthog.procyon.org.uk>
In-Reply-To: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
References: <165489100590.703883.11054313979289027590.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Linux-cachefs] [PATCH 3/3] netfs: Rename the netfs_io_request
 cleanup op and give it an op pointer
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The netfs_io_request cleanup op is now always in a position to be given a
pointer to a netfs_io_request struct, so this can be passed in instead of
the mapping and private data arguments (both of which are included in the
struct).

So rename the ->cleanup op to ->free_request (to match ->init_request) and
pass in the I/O pointer.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
---

 Documentation/filesystems/netfs_library.rst |   24 ++++++++++++------------
 fs/9p/vfs_addr.c                            |   11 +++++------
 fs/afs/file.c                               |    6 +++---
 fs/ceph/addr.c                              |    9 ++++-----
 fs/netfs/objects.c                          |    6 +++---
 include/linux/netfs.h                       |    3 ++-
 6 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/Documentation/filesystems/netfs_library.rst b/Documentation/filesystems/netfs_library.rst
index 9332f66373ee..4d19b19bcc08 100644
--- a/Documentation/filesystems/netfs_library.rst
+++ b/Documentation/filesystems/netfs_library.rst
@@ -158,9 +158,10 @@ The helpers manage the read request, calling back into the network filesystem
 through the suppplied table of operations.  Waits will be performed as
 necessary before returning for helpers that are meant to be synchronous.
 
-If an error occurs and netfs_priv is non-NULL, ops->cleanup() will be called to
-deal with it.  If some parts of the request are in progress when an error
-occurs, the request will get partially completed if sufficient data is read.
+If an error occurs, the ->free_request() will be called to clean up the
+netfs_io_request struct allocated.  If some parts of the request are in
+progress when an error occurs, the request will get partially completed if
+sufficient data is read.
 
 Additionally, there is::
 
@@ -208,8 +209,7 @@ The above fields are the ones the netfs can use.  They are:
  * ``netfs_priv``
 
    The network filesystem's private data.  The value for this can be passed in
-   to the helper functions or set during the request.  The ->cleanup() op will
-   be called if this is non-NULL at the end.
+   to the helper functions or set during the request.
 
  * ``start``
  * ``len``
@@ -294,6 +294,7 @@ through which it can issue requests and negotiate::
 
 	struct netfs_request_ops {
 		void (*init_request)(struct netfs_io_request *rreq, struct file *file);
+		void (*free_request)(struct netfs_io_request *rreq);
 		int (*begin_cache_operation)(struct netfs_io_request *rreq);
 		void (*expand_readahead)(struct netfs_io_request *rreq);
 		bool (*clamp_length)(struct netfs_io_subrequest *subreq);
@@ -302,7 +303,6 @@ through which it can issue requests and negotiate::
 		int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
 					 struct folio *folio, void **_fsdata);
 		void (*done)(struct netfs_io_request *rreq);
-		void (*cleanup)(struct address_space *mapping, void *netfs_priv);
 	};
 
 The operations are as follows:
@@ -310,7 +310,12 @@ The operations are as follows:
  * ``init_request()``
 
    [Optional] This is called to initialise the request structure.  It is given
-   the file for reference and can modify the ->netfs_priv value.
+   the file for reference.
+
+ * ``free_request()``
+
+   [Optional] This is called as the request is being deallocated so that the
+   filesystem can clean up any state it has attached there.
 
  * ``begin_cache_operation()``
 
@@ -384,11 +389,6 @@ The operations are as follows:
    [Optional] This is called after the folios in the request have all been
    unlocked (and marked uptodate if applicable).
 
- * ``cleanup``
-
-   [Optional] This is called as the request is being deallocated so that the
-   filesystem can clean up ->netfs_priv.
-
 
 
 Read Helper Procedure
diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index c004b9a73a92..a8f512b44a85 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -66,13 +66,12 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 }
 
 /**
- * v9fs_req_cleanup - Cleanup request initialized by v9fs_init_request
- * @mapping: unused mapping of request to cleanup
- * @priv: private data to cleanup, a fid, guaranted non-null.
+ * v9fs_free_request - Cleanup request initialized by v9fs_init_rreq
+ * @rreq: The I/O request to clean up
  */
-static void v9fs_req_cleanup(struct address_space *mapping, void *priv)
+static void v9fs_free_request(struct netfs_io_request *rreq)
 {
-	struct p9_fid *fid = priv;
+	struct p9_fid *fid = rreq->netfs_priv;
 
 	p9_client_clunk(fid);
 }
@@ -94,9 +93,9 @@ static int v9fs_begin_cache_operation(struct netfs_io_request *rreq)
 
 const struct netfs_request_ops v9fs_req_ops = {
 	.init_request		= v9fs_init_request,
+	.free_request		= v9fs_free_request,
 	.begin_cache_operation	= v9fs_begin_cache_operation,
 	.issue_read		= v9fs_issue_read,
-	.cleanup		= v9fs_req_cleanup,
 };
 
 /**
diff --git a/fs/afs/file.c b/fs/afs/file.c
index 4de7af7c2f09..42118a4f3383 100644
--- a/fs/afs/file.c
+++ b/fs/afs/file.c
@@ -382,17 +382,17 @@ static int afs_check_write_begin(struct file *file, loff_t pos, unsigned len,
 	return test_bit(AFS_VNODE_DELETED, &vnode->flags) ? -ESTALE : 0;
 }
 
-static void afs_priv_cleanup(struct address_space *mapping, void *netfs_priv)
+static void afs_free_request(struct netfs_io_request *rreq)
 {
-	key_put(netfs_priv);
+	key_put(rreq->netfs_priv);
 }
 
 const struct netfs_request_ops afs_req_ops = {
 	.init_request		= afs_init_request,
+	.free_request		= afs_free_request,
 	.begin_cache_operation	= afs_begin_cache_operation,
 	.check_write_begin	= afs_check_write_begin,
 	.issue_read		= afs_issue_read,
-	.cleanup		= afs_priv_cleanup,
 };
 
 int afs_write_inode(struct inode *inode, struct writeback_control *wbc)
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 9763e7ea8148..6dee88815491 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -394,11 +394,10 @@ static int ceph_init_request(struct netfs_io_request *rreq, struct file *file)
 	return 0;
 }
 
-static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
+static void ceph_netfs_free_request(struct netfs_io_request *rreq)
 {
-	struct inode *inode = mapping->host;
-	struct ceph_inode_info *ci = ceph_inode(inode);
-	int got = (uintptr_t)priv;
+	struct ceph_inode_info *ci = ceph_inode(rreq->inode);
+	int got = (uintptr_t)rreq->netfs_priv;
 
 	if (got)
 		ceph_put_cap_refs(ci, got);
@@ -406,12 +405,12 @@ static void ceph_readahead_cleanup(struct address_space *mapping, void *priv)
 
 const struct netfs_request_ops ceph_netfs_ops = {
 	.init_request		= ceph_init_request,
+	.free_request		= ceph_netfs_free_request,
 	.begin_cache_operation	= ceph_begin_cache_operation,
 	.issue_read		= ceph_netfs_issue_read,
 	.expand_readahead	= ceph_netfs_expand_readahead,
 	.clamp_length		= ceph_netfs_clamp_length,
 	.check_write_begin	= ceph_netfs_check_write_begin,
-	.cleanup		= ceph_readahead_cleanup,
 };
 
 #ifdef CONFIG_CEPH_FSCACHE
diff --git a/fs/netfs/objects.c b/fs/netfs/objects.c
index c6afa605b63b..e17cdf53f6a7 100644
--- a/fs/netfs/objects.c
+++ b/fs/netfs/objects.c
@@ -75,10 +75,10 @@ static void netfs_free_request(struct work_struct *work)
 	struct netfs_io_request *rreq =
 		container_of(work, struct netfs_io_request, work);
 
-	netfs_clear_subrequests(rreq, false);
-	if (rreq->netfs_priv)
-		rreq->netfs_ops->cleanup(rreq->mapping, rreq->netfs_priv);
 	trace_netfs_rreq(rreq, netfs_rreq_trace_free);
+	netfs_clear_subrequests(rreq, false);
+	if (rreq->netfs_ops->free_request)
+		rreq->netfs_ops->free_request(rreq);
 	if (rreq->cache_resources.ops)
 		rreq->cache_resources.ops->end_operation(&rreq->cache_resources);
 	kfree(rreq);
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index a62739f3726b..097cdd644665 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -206,7 +206,9 @@ struct netfs_io_request {
  */
 struct netfs_request_ops {
 	int (*init_request)(struct netfs_io_request *rreq, struct file *file);
+	void (*free_request)(struct netfs_io_request *rreq);
 	int (*begin_cache_operation)(struct netfs_io_request *rreq);
+
 	void (*expand_readahead)(struct netfs_io_request *rreq);
 	bool (*clamp_length)(struct netfs_io_subrequest *subreq);
 	void (*issue_read)(struct netfs_io_subrequest *subreq);
@@ -214,7 +216,6 @@ struct netfs_request_ops {
 	int (*check_write_begin)(struct file *file, loff_t pos, unsigned len,
 				 struct folio *folio, void **_fsdata);
 	void (*done)(struct netfs_io_request *rreq);
-	void (*cleanup)(struct address_space *mapping, void *netfs_priv);
 };
 
 /*


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

