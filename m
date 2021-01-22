Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C7A41300A84
	for <lists+linux-cachefs@lfdr.de>; Fri, 22 Jan 2021 19:01:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-axjR-NzVM8KaF4I1In6xug-1; Fri, 22 Jan 2021 13:01:52 -0500
X-MC-Unique: axjR-NzVM8KaF4I1In6xug-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11F3318C8C0D;
	Fri, 22 Jan 2021 18:01:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9E1F1001901;
	Fri, 22 Jan 2021 18:01:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AB881809C9F;
	Fri, 22 Jan 2021 18:01:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MI1icQ016211 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 13:01:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9BC1F2166B33; Fri, 22 Jan 2021 18:01:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 908342166B32
	for <linux-cachefs@redhat.com>; Fri, 22 Jan 2021 18:01:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C527811E85
	for <linux-cachefs@redhat.com>; Fri, 22 Jan 2021 18:01:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-537-XuOTpgXwNN2Zt3v56YLpxw-1;
	Fri, 22 Jan 2021 13:01:39 -0500
X-MC-Unique: XuOTpgXwNN2Zt3v56YLpxw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2DD2323AAA;
	Fri, 22 Jan 2021 17:51:24 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 22 Jan 2021 12:51:16 -0500
Message-Id: <20210122175119.364381-5-jlayton@kernel.org>
In-Reply-To: <20210122175119.364381-1-jlayton@kernel.org>
References: <20210122175119.364381-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10MI1icQ016211
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org, willy@infradead.org
Subject: [Linux-cachefs] [RFC PATCH 4/6] ceph: convert readpage to fscache
	read helper
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Have the ceph KConfig select NETFS_SUPPORT. Add a new netfs ops
structure and the operations for it. Convert ceph_readpage to use
the new netfs_readpage helper.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/Kconfig |   1 +
 fs/ceph/addr.c  | 149 ++++++++++++++++++++++++++++++++++++++++++++----
 fs/ceph/cache.h |  36 ++++++++++++
 3 files changed, 176 insertions(+), 10 deletions(-)

diff --git a/fs/ceph/Kconfig b/fs/ceph/Kconfig
index 471e40156065..94df854147d3 100644
--- a/fs/ceph/Kconfig
+++ b/fs/ceph/Kconfig
@@ -6,6 +6,7 @@ config CEPH_FS
 	select LIBCRC32C
 	select CRYPTO_AES
 	select CRYPTO
+	select NETFS_SUPPORT
 	default n
 	help
 	  Choose Y or M here to include support for mounting the
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index f554667e1e91..986c9c56653f 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -12,6 +12,7 @@
 #include <linux/signal.h>
 #include <linux/iversion.h>
 #include <linux/ktime.h>
+#include <linux/netfs.h>
 
 #include "super.h"
 #include "mds_client.h"
@@ -182,6 +183,144 @@ static int ceph_releasepage(struct page *page, gfp_t gfp_flags)
 	return !PagePrivate(page);
 }
 
+static bool ceph_netfs_clamp_length(struct netfs_read_subrequest *subreq)
+{
+	struct inode *inode = subreq->rreq->mapping->host;
+	struct ceph_inode_info *ci = ceph_inode(inode);
+	u64 objno, objoff;
+	u32 xlen;
+
+	/* Truncate the extent at the end of the current object */
+	ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len,
+				      &objno, &objoff, &xlen);
+	subreq->len = xlen;
+	return true;
+}
+
+static void finish_netfs_read(struct ceph_osd_request *req)
+{
+	struct ceph_fs_client *fsc = ceph_inode_to_client(req->r_inode);
+	struct ceph_osd_data *osd_data = osd_req_op_extent_osd_data(req, 0);
+	struct netfs_read_subrequest *subreq = req->r_priv;
+	int num_pages;
+	int err = req->r_result;
+
+	ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
+				 req->r_end_latency, err);
+
+	dout("%s: result %d subreq->len=%zu i_size=%lld\n", __func__, req->r_result,
+	     subreq->len, i_size_read(req->r_inode));
+
+	/* no object means success but no data */
+	if (err == -ENOENT)
+		err = 0;
+	else if (err == -EBLOCKLISTED)
+		fsc->blocklisted = true;
+
+	if (err >= 0 && err < subreq->len)
+		__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
+
+	netfs_subreq_terminated(subreq, err);
+
+	num_pages = calc_pages_for(osd_data->alignment, osd_data->length);
+	ceph_put_page_vector(osd_data->pages, num_pages, false);
+	iput(req->r_inode);
+}
+
+static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
+{
+	struct netfs_read_request *rreq = subreq->rreq;
+	struct inode *inode = rreq->mapping->host;
+	struct ceph_inode_info *ci = ceph_inode(inode);
+	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
+	struct ceph_osd_request *req = NULL;
+	struct ceph_vino vino = ceph_vino(inode);
+	struct iov_iter iter;
+	struct page **pages;
+	size_t page_off;
+	int err = 0;
+	u64 len = subreq->len;
+
+	req = ceph_osdc_new_request(&fsc->client->osdc, &ci->i_layout, vino, subreq->start, &len,
+			0, 1, CEPH_OSD_OP_READ,
+			CEPH_OSD_FLAG_READ | fsc->client->osdc.client->options->read_from_replica,
+			NULL, ci->i_truncate_seq, ci->i_truncate_size, false);
+	if (IS_ERR(req)) {
+		err = PTR_ERR(req);
+		goto out;
+	}
+
+	dout("%s: pos=%llu orig_len=%zu len=%llu\n", __func__, subreq->start, subreq->len, len);
+	iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages, subreq->start, len);
+	len = iov_iter_get_pages_alloc(&iter, &pages, len, &page_off);
+	if (len < 0) {
+		err = len;
+		dout("%s: iov_ter_get_pages_alloc returned %d\n", __func__, err);
+		goto out;
+	}
+
+	/* should always give us a page-aligned read */
+	WARN_ON_ONCE(page_off);
+
+	osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
+	req->r_callback = finish_netfs_read;
+	req->r_priv = subreq;
+	req->r_inode = inode;
+	ihold(inode);
+
+	err = ceph_osdc_start_request(req->r_osdc, req, false);
+	if (err)
+		iput(inode);
+out:
+	if (req)
+		ceph_osdc_put_request(req);
+	if (err)
+		netfs_subreq_terminated(subreq, err);
+	dout("%s: result %d\n", __func__, err);
+}
+
+static void ceph_init_rreq(struct netfs_read_request *rreq, struct file *file)
+{
+}
+
+const struct netfs_read_request_ops ceph_readpage_netfs_ops = {
+	.init_rreq		= ceph_init_rreq,
+	.is_cache_enabled	= ceph_is_cache_enabled,
+	.begin_cache_operation	= ceph_begin_cache_operation,
+	.issue_op		= ceph_netfs_issue_op,
+	.clamp_length		= ceph_netfs_clamp_length,
+};
+
+/* read a single page, without unlocking it. */
+static int ceph_readpage(struct file *filp, struct page *page)
+{
+	struct inode *inode = file_inode(filp);
+	struct ceph_inode_info *ci = ceph_inode(inode);
+	struct ceph_vino vino = ceph_vino(inode);
+	u64 off = page_offset(page);
+	u64 len = PAGE_SIZE;
+
+	if (ci->i_inline_version != CEPH_INLINE_NONE) {
+		/*
+		 * Uptodate inline data should have been added
+		 * into page cache while getting Fcr caps.
+		 */
+		if (off == 0) {
+			unlock_page(page);
+			return -EINVAL;
+		}
+		zero_user_segment(page, 0, PAGE_SIZE);
+		SetPageUptodate(page);
+		unlock_page(page);
+		return 0;
+	}
+
+	dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %lu\n",
+	     vino.ino, vino.snap, filp, off, len, page, page->index);
+
+	return netfs_readpage(filp, page, &ceph_readpage_netfs_ops, NULL);
+}
+
 /* read a single page, without unlocking it. */
 static int ceph_do_readpage(struct file *filp, struct page *page)
 {
@@ -252,16 +391,6 @@ static int ceph_do_readpage(struct file *filp, struct page *page)
 	return err < 0 ? err : 0;
 }
 
-static int ceph_readpage(struct file *filp, struct page *page)
-{
-	int r = ceph_do_readpage(filp, page);
-	if (r != -EINPROGRESS)
-		unlock_page(page);
-	else
-		r = 0;
-	return r;
-}
-
 /*
  * Finish an async read(ahead) op.
  */
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index 10c21317b62f..1409d6149281 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -9,6 +9,8 @@
 #ifndef _CEPH_CACHE_H
 #define _CEPH_CACHE_H
 
+#include <linux/netfs.h>
+
 #ifdef CONFIG_CEPH_FSCACHE
 
 extern struct fscache_netfs ceph_cache_netfs;
@@ -35,11 +37,31 @@ static inline void ceph_fscache_inode_init(struct ceph_inode_info *ci)
 	ci->fscache = NULL;
 }
 
+static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode_info *ci)
+{
+	return ci->fscache;
+}
+
 static inline void ceph_fscache_invalidate(struct inode *inode)
 {
 	fscache_invalidate(ceph_inode(inode)->fscache);
 }
 
+static inline bool ceph_is_cache_enabled(struct inode *inode)
+{
+	struct fscache_cookie *cookie = ceph_fscache_cookie(ceph_inode(inode));
+
+	if (!cookie)
+		return false;
+	return fscache_cookie_enabled(cookie);
+}
+
+static inline int ceph_begin_cache_operation(struct netfs_read_request *rreq)
+{
+	struct fscache_cookie *cookie = ceph_fscache_cookie(ceph_inode(rreq->inode));
+
+	return fscache_begin_read_operation(rreq, cookie);
+}
 #else
 
 static inline int ceph_fscache_register(void)
@@ -65,6 +87,11 @@ static inline void ceph_fscache_inode_init(struct ceph_inode_info *ci)
 {
 }
 
+static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode_info *ci)
+{
+	return NULL;
+}
+
 static inline void ceph_fscache_register_inode_cookie(struct inode *inode)
 {
 }
@@ -82,6 +109,15 @@ static inline void ceph_fscache_invalidate(struct inode *inode)
 {
 }
 
+static inline bool ceph_is_cache_enabled(struct inode *inode)
+{
+	return false;
+}
+
+static inline int ceph_begin_cache_operation(struct netfs_read_request *rreq)
+{
+	return -ENOBUFS;
+}
 #endif
 
 #endif /* _CEPH_CACHE_H */
-- 
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

