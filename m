Return-Path: <linux-cachefs-bounces@listman.redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id EDF6031D9D1
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 13:59:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-D8kAfUONNHqQmdPIEjxh_w-1; Wed, 17 Feb 2021 07:59:07 -0500
X-MC-Unique: D8kAfUONNHqQmdPIEjxh_w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E95F11E566;
	Wed, 17 Feb 2021 12:59:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6D095D9D3;
	Wed, 17 Feb 2021 12:59:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AED9BCF5C;
	Wed, 17 Feb 2021 12:59:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HCwxmG022596 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 07:58:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7807D2026D46; Wed, 17 Feb 2021 12:58:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 725E7202F4F4
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04335800296
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-14-vR7VhwXCNK2fTbcn4gSgCw-1; 
	Wed, 17 Feb 2021 07:58:52 -0500
X-MC-Unique: vR7VhwXCNK2fTbcn4gSgCw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id B04DB64E42;
	Wed, 17 Feb 2021 12:58:50 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, idryomov@gmail.com
Date: Wed, 17 Feb 2021 07:58:43 -0500
Message-Id: <20210217125845.10319-5-jlayton@kernel.org>
In-Reply-To: <20210217125845.10319-1-jlayton@kernel.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HCwxmG022596
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 4/6] ceph: convert readpage to fscache
	read helper
X-BeenThere: linux-cachefs@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list
	<linux-cachefs.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@listman.redhat.com>
List-Help: <mailto:linux-cachefs-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@listman.redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@listman.redhat.com
Errors-To: linux-cachefs-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Have the ceph KConfig select NETFS_SUPPORT. Add a new netfs ops
structure and the operations for it. Convert ceph_readpage to use
the new netfs_readpage helper.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Cc: ceph-devel@vger.kernel.org
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
---
 fs/ceph/Kconfig |   1 +
 fs/ceph/addr.c  | 167 +++++++++++++++++++++++++++++++++++++++++++++---
 fs/ceph/cache.h |  36 +++++++++++
 3 files changed, 194 insertions(+), 10 deletions(-)

diff --git a/fs/ceph/Kconfig b/fs/ceph/Kconfig
index 471e40156065..94df854147d3 100644
--- a/fs/ceph/Kconfig
+++ b/fs/ceph/Kconfig
@@ -6,6 +6,7 @@ config CEPH_FS
 =09select LIBCRC32C
 =09select CRYPTO_AES
 =09select CRYPTO
+=09select NETFS_SUPPORT
 =09default n
 =09help
 =09  Choose Y or M here to include support for mounting the
diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index fbfa49db06fd..6d4de969f761 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -12,6 +12,7 @@
 #include <linux/signal.h>
 #include <linux/iversion.h>
 #include <linux/ktime.h>
+#include <linux/netfs.h>
=20
 #include "super.h"
 #include "mds_client.h"
@@ -183,6 +184,162 @@ static int ceph_releasepage(struct page *page, gfp_t =
gfp_flags)
 =09return !PagePrivate(page);
 }
=20
+static void ceph_netfs_expand_readahead(struct netfs_read_request *rreq)
+{
+=09struct inode *inode =3D rreq->mapping->host;
+=09struct ceph_inode_info *ci =3D ceph_inode(inode);
+=09struct ceph_file_layout *lo =3D &ci->i_layout;
+=09u32 blockoff;
+=09u64 blockno;
+
+=09/* Expand the start downward */
+=09blockno =3D div_u64_rem(rreq->start, lo->stripe_unit, &blockoff);
+=09rreq->start =3D blockno * lo->stripe_unit;
+=09rreq->len +=3D blockoff;
+
+=09/* Now, round up the length to the next block */
+=09rreq->len =3D roundup(rreq->len, lo->stripe_unit);
+}
+
+static bool ceph_netfs_clamp_length(struct netfs_read_subrequest *subreq)
+{
+=09struct inode *inode =3D subreq->rreq->mapping->host;
+=09struct ceph_inode_info *ci =3D ceph_inode(inode);
+=09u64 objno, objoff;
+=09u32 xlen;
+
+=09/* Truncate the extent at the end of the current block */
+=09ceph_calc_file_object_mapping(&ci->i_layout, subreq->start, subreq->len=
,
+=09=09=09=09      &objno, &objoff, &xlen);
+=09subreq->len =3D xlen;
+=09return true;
+}
+
+static void finish_netfs_read(struct ceph_osd_request *req)
+{
+=09struct ceph_fs_client *fsc =3D ceph_inode_to_client(req->r_inode);
+=09struct ceph_osd_data *osd_data =3D osd_req_op_extent_osd_data(req, 0);
+=09struct netfs_read_subrequest *subreq =3D req->r_priv;
+=09int num_pages;
+=09int err =3D req->r_result;
+
+=09ceph_update_read_latency(&fsc->mdsc->metric, req->r_start_latency,
+=09=09=09=09 req->r_end_latency, err);
+
+=09dout("%s: result %d subreq->len=3D%zu i_size=3D%lld\n", __func__, req->=
r_result,
+=09     subreq->len, i_size_read(req->r_inode));
+
+=09/* no object means success but no data */
+=09if (err =3D=3D -ENOENT)
+=09=09err =3D 0;
+=09else if (err =3D=3D -EBLOCKLISTED)
+=09=09fsc->blocklisted =3D true;
+
+=09if (err >=3D 0 && err < subreq->len)
+=09=09__set_bit(NETFS_SREQ_CLEAR_TAIL, &subreq->flags);
+
+=09netfs_subreq_terminated(subreq, err);
+
+=09num_pages =3D calc_pages_for(osd_data->alignment, osd_data->length);
+=09ceph_put_page_vector(osd_data->pages, num_pages, false);
+=09iput(req->r_inode);
+}
+
+static void ceph_netfs_issue_op(struct netfs_read_subrequest *subreq)
+{
+=09struct netfs_read_request *rreq =3D subreq->rreq;
+=09struct inode *inode =3D rreq->mapping->host;
+=09struct ceph_inode_info *ci =3D ceph_inode(inode);
+=09struct ceph_fs_client *fsc =3D ceph_inode_to_client(inode);
+=09struct ceph_osd_request *req;
+=09struct ceph_vino vino =3D ceph_vino(inode);
+=09struct iov_iter iter;
+=09struct page **pages;
+=09size_t page_off;
+=09int err =3D 0;
+=09u64 len =3D subreq->len;
+
+=09req =3D ceph_osdc_new_request(&fsc->client->osdc, &ci->i_layout, vino, =
subreq->start, &len,
+=09=09=090, 1, CEPH_OSD_OP_READ,
+=09=09=09CEPH_OSD_FLAG_READ | fsc->client->osdc.client->options->read_from=
_replica,
+=09=09=09NULL, ci->i_truncate_seq, ci->i_truncate_size, false);
+=09if (IS_ERR(req)) {
+=09=09err =3D PTR_ERR(req);
+=09=09req =3D NULL;
+=09=09goto out;
+=09}
+
+=09dout("%s: pos=3D%llu orig_len=3D%zu len=3D%llu\n", __func__, subreq->st=
art, subreq->len, len);
+=09iov_iter_xarray(&iter, READ, &rreq->mapping->i_pages, subreq->start, le=
n);
+=09err =3D iov_iter_get_pages_alloc(&iter, &pages, len, &page_off);
+=09if (err < 0) {
+=09=09dout("%s: iov_ter_get_pages_alloc returned %d\n", __func__, err);
+=09=09goto out;
+=09}
+
+=09/* should always give us a page-aligned read */
+=09WARN_ON_ONCE(page_off);
+=09len =3D err;
+
+=09osd_req_op_extent_osd_data_pages(req, 0, pages, len, 0, false, false);
+=09req->r_callback =3D finish_netfs_read;
+=09req->r_priv =3D subreq;
+=09req->r_inode =3D inode;
+=09ihold(inode);
+
+=09err =3D ceph_osdc_start_request(req->r_osdc, req, false);
+=09if (err)
+=09=09iput(inode);
+out:
+=09ceph_osdc_put_request(req);
+=09if (err)
+=09=09netfs_subreq_terminated(subreq, err);
+=09dout("%s: result %d\n", __func__, err);
+}
+
+static void ceph_init_rreq(struct netfs_read_request *rreq, struct file *f=
ile)
+{
+}
+
+const struct netfs_read_request_ops ceph_readpage_netfs_ops =3D {
+=09.init_rreq=09=09=3D ceph_init_rreq,
+=09.is_cache_enabled=09=3D ceph_is_cache_enabled,
+=09.begin_cache_operation=09=3D ceph_begin_cache_operation,
+=09.issue_op=09=09=3D ceph_netfs_issue_op,
+=09.expand_readahead=09=3D ceph_netfs_expand_readahead,
+=09.clamp_length=09=09=3D ceph_netfs_clamp_length,
+};
+
+/* read a single page, without unlocking it. */
+static int ceph_readpage(struct file *file, struct page *page)
+{
+=09struct inode *inode =3D file_inode(file);
+=09struct ceph_inode_info *ci =3D ceph_inode(inode);
+=09struct ceph_vino vino =3D ceph_vino(inode);
+=09u64 off =3D page_offset(page);
+=09u64 len =3D PAGE_SIZE;
+
+=09if (ci->i_inline_version !=3D CEPH_INLINE_NONE) {
+=09=09/*
+=09=09 * Uptodate inline data should have been added
+=09=09 * into page cache while getting Fcr caps.
+=09=09 */
+=09=09if (off =3D=3D 0) {
+=09=09=09unlock_page(page);
+=09=09=09return -EINVAL;
+=09=09}
+=09=09zero_user_segment(page, 0, PAGE_SIZE);
+=09=09SetPageUptodate(page);
+=09=09unlock_page(page);
+=09=09return 0;
+=09}
+
+=09dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %l=
u\n",
+=09     vino.ino, vino.snap, file, off, len, page, page->index);
+
+=09return netfs_readpage(file, page, &ceph_readpage_netfs_ops, NULL);
+}
+
 /* read a single page, without unlocking it. */
 static int ceph_do_readpage(struct file *filp, struct page *page)
 {
@@ -253,16 +410,6 @@ static int ceph_do_readpage(struct file *filp, struct =
page *page)
 =09return err < 0 ? err : 0;
 }
=20
-static int ceph_readpage(struct file *filp, struct page *page)
-{
-=09int r =3D ceph_do_readpage(filp, page);
-=09if (r !=3D -EINPROGRESS)
-=09=09unlock_page(page);
-=09else
-=09=09r =3D 0;
-=09return r;
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
=20
+#include <linux/netfs.h>
+
 #ifdef CONFIG_CEPH_FSCACHE
=20
 extern struct fscache_netfs ceph_cache_netfs;
@@ -35,11 +37,31 @@ static inline void ceph_fscache_inode_init(struct ceph_=
inode_info *ci)
 =09ci->fscache =3D NULL;
 }
=20
+static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode=
_info *ci)
+{
+=09return ci->fscache;
+}
+
 static inline void ceph_fscache_invalidate(struct inode *inode)
 {
 =09fscache_invalidate(ceph_inode(inode)->fscache);
 }
=20
+static inline bool ceph_is_cache_enabled(struct inode *inode)
+{
+=09struct fscache_cookie *cookie =3D ceph_fscache_cookie(ceph_inode(inode)=
);
+
+=09if (!cookie)
+=09=09return false;
+=09return fscache_cookie_enabled(cookie);
+}
+
+static inline int ceph_begin_cache_operation(struct netfs_read_request *rr=
eq)
+{
+=09struct fscache_cookie *cookie =3D ceph_fscache_cookie(ceph_inode(rreq->=
inode));
+
+=09return fscache_begin_read_operation(rreq, cookie);
+}
 #else
=20
 static inline int ceph_fscache_register(void)
@@ -65,6 +87,11 @@ static inline void ceph_fscache_inode_init(struct ceph_i=
node_info *ci)
 {
 }
=20
+static inline struct fscache_cookie *ceph_fscache_cookie(struct ceph_inode=
_info *ci)
+{
+=09return NULL;
+}
+
 static inline void ceph_fscache_register_inode_cookie(struct inode *inode)
 {
 }
@@ -82,6 +109,15 @@ static inline void ceph_fscache_invalidate(struct inode=
 *inode)
 {
 }
=20
+static inline bool ceph_is_cache_enabled(struct inode *inode)
+{
+=09return false;
+}
+
+static inline int ceph_begin_cache_operation(struct netfs_read_request *rr=
eq)
+{
+=09return -ENOBUFS;
+}
 #endif
=20
 #endif /* _CEPH_CACHE_H */
--=20
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

