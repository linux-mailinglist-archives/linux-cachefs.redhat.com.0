Return-Path: <linux-cachefs-bounces@listman.redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [207.211.30.44])
	by mail.lfdr.de (Postfix) with ESMTP id F045531D9D2
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 13:59:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-N-HfE9VhNBWtgTtUUZaZ0w-1; Wed, 17 Feb 2021 07:59:05 -0500
X-MC-Unique: N-HfE9VhNBWtgTtUUZaZ0w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87779106BB23;
	Wed, 17 Feb 2021 12:59:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7567360853;
	Wed, 17 Feb 2021 12:59:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98DB34EE7F;
	Wed, 17 Feb 2021 12:58:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HCwtTc022551 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 07:58:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E086AFED27; Wed, 17 Feb 2021 12:58:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D89ABFED40
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 912298007DD
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-150-TNpY-BWRO0uhGK_FW8MsHA-1;
	Wed, 17 Feb 2021 07:58:50 -0500
X-MC-Unique: TNpY-BWRO0uhGK_FW8MsHA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 228E564E4D;
	Wed, 17 Feb 2021 12:58:48 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, idryomov@gmail.com
Date: Wed, 17 Feb 2021 07:58:40 -0500
Message-Id: <20210217125845.10319-2-jlayton@kernel.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HCwtTc022551
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 1/6] ceph: disable old fscache readpage
	handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

With the new netfs read helper functions, we won't need a lot of this
infrastructure as it handles the pagecache pages itself. Rip out the
read handling for now, and much of the old infrastructure that deals in
individual pages.

The cookie handling is mostly unchanged, however.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Cc: ceph-devel@vger.kernel.org
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
---
 fs/ceph/addr.c  |  31 +-----------
 fs/ceph/cache.c | 125 ------------------------------------------------
 fs/ceph/cache.h |  91 +----------------------------------
 fs/ceph/caps.c  |   9 ----
 4 files changed, 3 insertions(+), 253 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 950552944436..2b17bb36e548 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -155,8 +155,6 @@ static void ceph_invalidatepage(struct page *page, unsi=
gned int offset,
 =09=09return;
 =09}
=20
-=09ceph_invalidate_fscache_page(inode, page);
-
 =09WARN_ON(!PageLocked(page));
 =09if (!PagePrivate(page))
 =09=09return;
@@ -175,10 +173,6 @@ static int ceph_releasepage(struct page *page, gfp_t g=
)
 =09dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host,
 =09     page, page->index, PageDirty(page) ? "" : "not ");
=20
-=09/* Can we release the page from the cache? */
-=09if (!ceph_release_fscache_page(page, g))
-=09=09return 0;
-
 =09return !PagePrivate(page);
 }
=20
@@ -213,10 +207,6 @@ static int ceph_do_readpage(struct file *filp, struct =
page *page)
 =09=09return 0;
 =09}
=20
-=09err =3D ceph_readpage_from_fscache(inode, page);
-=09if (err =3D=3D 0)
-=09=09return -EINPROGRESS;
-
 =09dout("readpage ino %llx.%llx file %p off %llu len %llu page %p index %l=
u\n",
 =09     vino.ino, vino.snap, filp, off, len, page, page->index);
 =09req =3D ceph_osdc_new_request(osdc, &ci->i_layout, vino, off, &len, 0, =
1,
@@ -241,7 +231,6 @@ static int ceph_do_readpage(struct file *filp, struct p=
age *page)
 =09if (err =3D=3D -ENOENT)
 =09=09err =3D 0;
 =09if (err < 0) {
-=09=09ceph_fscache_readpage_cancel(inode, page);
 =09=09if (err =3D=3D -EBLOCKLISTED)
 =09=09=09fsc->blocklisted =3D true;
 =09=09goto out;
@@ -253,8 +242,6 @@ static int ceph_do_readpage(struct file *filp, struct p=
age *page)
 =09=09flush_dcache_page(page);
=20
 =09SetPageUptodate(page);
-=09ceph_readpage_to_fscache(inode, page);
-
 out:
 =09return err < 0 ? err : 0;
 }
@@ -294,10 +281,8 @@ static void finish_read(struct ceph_osd_request *req)
 =09for (i =3D 0; i < num_pages; i++) {
 =09=09struct page *page =3D osd_data->pages[i];
=20
-=09=09if (rc < 0 && rc !=3D -ENOENT) {
-=09=09=09ceph_fscache_readpage_cancel(inode, page);
+=09=09if (rc < 0 && rc !=3D -ENOENT)
 =09=09=09goto unlock;
-=09=09}
 =09=09if (bytes < (int)PAGE_SIZE) {
 =09=09=09/* zero (remainder of) page */
 =09=09=09int s =3D bytes < 0 ? 0 : bytes;
@@ -307,7 +292,6 @@ static void finish_read(struct ceph_osd_request *req)
 =09=09     page->index);
 =09=09flush_dcache_page(page);
 =09=09SetPageUptodate(page);
-=09=09ceph_readpage_to_fscache(inode, page);
 unlock:
 =09=09unlock_page(page);
 =09=09put_page(page);
@@ -408,7 +392,6 @@ static int start_read(struct inode *inode, struct ceph_=
rw_context *rw_ctx,
 =09=09     page->index);
 =09=09if (add_to_page_cache_lru(page, &inode->i_data, page->index,
 =09=09=09=09=09  GFP_KERNEL)) {
-=09=09=09ceph_fscache_uncache_page(inode, page);
 =09=09=09put_page(page);
 =09=09=09dout("start_read %p add_to_page_cache failed %p\n",
 =09=09=09     inode, page);
@@ -440,10 +423,8 @@ static int start_read(struct inode *inode, struct ceph=
_rw_context *rw_ctx,
 =09return nr_pages;
=20
 out_pages:
-=09for (i =3D 0; i < nr_pages; ++i) {
-=09=09ceph_fscache_readpage_cancel(inode, pages[i]);
+=09for (i =3D 0; i < nr_pages; ++i)
 =09=09unlock_page(pages[i]);
-=09}
 =09ceph_put_page_vector(pages, nr_pages, false);
 out_put:
 =09ceph_osdc_put_request(req);
@@ -471,12 +452,6 @@ static int ceph_readpages(struct file *file, struct ad=
dress_space *mapping,
 =09if (ceph_inode(inode)->i_inline_version !=3D CEPH_INLINE_NONE)
 =09=09return -EINVAL;
=20
-=09rc =3D ceph_readpages_from_fscache(mapping->host, mapping, page_list,
-=09=09=09=09=09 &nr_pages);
-
-=09if (rc =3D=3D 0)
-=09=09goto out;
-
 =09rw_ctx =3D ceph_find_rw_context(fi);
 =09max =3D fsc->mount_options->rsize >> PAGE_SHIFT;
 =09dout("readpages %p file %p ctx %p nr_pages %d max %d\n",
@@ -487,8 +462,6 @@ static int ceph_readpages(struct file *file, struct add=
ress_space *mapping,
 =09=09=09goto out;
 =09}
 out:
-=09ceph_fscache_readpages_cancel(inode, page_list);
-
 =09dout("readpages %p file %p ret %d\n", inode, file, rc);
 =09return rc;
 }
diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
index 2f5cb6bc78e1..9cfadbb86568 100644
--- a/fs/ceph/cache.c
+++ b/fs/ceph/cache.c
@@ -173,7 +173,6 @@ void ceph_fscache_unregister_inode_cookie(struct ceph_i=
node_info* ci)
=20
 =09ci->fscache =3D NULL;
=20
-=09fscache_uncache_all_inode_pages(cookie, &ci->vfs_inode);
 =09fscache_relinquish_cookie(cookie, &ci->i_vino, false);
 }
=20
@@ -194,7 +193,6 @@ void ceph_fscache_file_set_cookie(struct inode *inode, =
struct file *filp)
 =09=09dout("fscache_file_set_cookie %p %p disabling cache\n",
 =09=09     inode, filp);
 =09=09fscache_disable_cookie(ci->fscache, &ci->i_vino, false);
-=09=09fscache_uncache_all_inode_pages(ci->fscache, inode);
 =09} else {
 =09=09fscache_enable_cookie(ci->fscache, &ci->i_vino, i_size_read(inode),
 =09=09=09=09      ceph_fscache_can_enable, inode);
@@ -205,108 +203,6 @@ void ceph_fscache_file_set_cookie(struct inode *inode=
, struct file *filp)
 =09}
 }
=20
-static void ceph_readpage_from_fscache_complete(struct page *page, void *d=
ata, int error)
-{
-=09if (!error)
-=09=09SetPageUptodate(page);
-
-=09unlock_page(page);
-}
-
-static inline bool cache_valid(struct ceph_inode_info *ci)
-{
-=09return ci->i_fscache_gen =3D=3D ci->i_rdcache_gen;
-}
-
-
-/* Atempt to read from the fscache,
- *
- * This function is called from the readpage_nounlock context. DO NOT atte=
mpt to
- * unlock the page here (or in the callback).
- */
-int ceph_readpage_from_fscache(struct inode *inode, struct page *page)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09int ret;
-
-=09if (!cache_valid(ci))
-=09=09return -ENOBUFS;
-
-=09ret =3D fscache_read_or_alloc_page(ci->fscache, page,
-=09=09=09=09=09 ceph_readpage_from_fscache_complete, NULL,
-=09=09=09=09=09 GFP_KERNEL);
-
-=09switch (ret) {
-=09=09case 0: /* Page found */
-=09=09=09dout("page read submitted\n");
-=09=09=09return 0;
-=09=09case -ENOBUFS: /* Pages were not found, and can't be */
-=09=09case -ENODATA: /* Pages were not found */
-=09=09=09dout("page/inode not in cache\n");
-=09=09=09return ret;
-=09=09default:
-=09=09=09dout("%s: unknown error ret =3D %i\n", __func__, ret);
-=09=09=09return ret;
-=09}
-}
-
-int ceph_readpages_from_fscache(struct inode *inode,
-=09=09=09=09  struct address_space *mapping,
-=09=09=09=09  struct list_head *pages,
-=09=09=09=09  unsigned *nr_pages)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09int ret;
-
-=09if (!cache_valid(ci))
-=09=09return -ENOBUFS;
-
-=09ret =3D fscache_read_or_alloc_pages(ci->fscache, mapping, pages, nr_pag=
es,
-=09=09=09=09=09  ceph_readpage_from_fscache_complete,
-=09=09=09=09=09  NULL, mapping_gfp_mask(mapping));
-
-=09switch (ret) {
-=09=09case 0: /* All pages found */
-=09=09=09dout("all-page read submitted\n");
-=09=09=09return 0;
-=09=09case -ENOBUFS: /* Some pages were not found, and can't be */
-=09=09case -ENODATA: /* some pages were not found */
-=09=09=09dout("page/inode not in cache\n");
-=09=09=09return ret;
-=09=09default:
-=09=09=09dout("%s: unknown error ret =3D %i\n", __func__, ret);
-=09=09=09return ret;
-=09}
-}
-
-void ceph_readpage_to_fscache(struct inode *inode, struct page *page)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09int ret;
-
-=09if (!PageFsCache(page))
-=09=09return;
-
-=09if (!cache_valid(ci))
-=09=09return;
-
-=09ret =3D fscache_write_page(ci->fscache, page, i_size_read(inode),
-=09=09=09=09 GFP_KERNEL);
-=09if (ret)
-=09=09 fscache_uncache_page(ci->fscache, page);
-}
-
-void ceph_invalidate_fscache_page(struct inode* inode, struct page *page)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-
-=09if (!PageFsCache(page))
-=09=09return;
-
-=09fscache_wait_on_page_write(ci->fscache, page);
-=09fscache_uncache_page(ci->fscache, page);
-}
-
 void ceph_fscache_unregister_fs(struct ceph_fs_client* fsc)
 {
 =09if (fscache_cookie_valid(fsc->fscache)) {
@@ -329,24 +225,3 @@ void ceph_fscache_unregister_fs(struct ceph_fs_client*=
 fsc)
 =09}
 =09fsc->fscache =3D NULL;
 }
-
-/*
- * caller should hold CEPH_CAP_FILE_{RD,CACHE}
- */
-void ceph_fscache_revalidate_cookie(struct ceph_inode_info *ci)
-{
-=09if (cache_valid(ci))
-=09=09return;
-
-=09/* resue i_truncate_mutex. There should be no pending
-=09 * truncate while the caller holds CEPH_CAP_FILE_RD */
-=09mutex_lock(&ci->i_truncate_mutex);
-=09if (!cache_valid(ci)) {
-=09=09if (fscache_check_consistency(ci->fscache, &ci->i_vino))
-=09=09=09fscache_invalidate(ci->fscache);
-=09=09spin_lock(&ci->i_ceph_lock);
-=09=09ci->i_fscache_gen =3D ci->i_rdcache_gen;
-=09=09spin_unlock(&ci->i_ceph_lock);
-=09}
-=09mutex_unlock(&ci->i_truncate_mutex);
-}
diff --git a/fs/ceph/cache.h b/fs/ceph/cache.h
index 89dbdd1eb14a..10c21317b62f 100644
--- a/fs/ceph/cache.h
+++ b/fs/ceph/cache.h
@@ -29,13 +29,10 @@ int ceph_readpages_from_fscache(struct inode *inode,
 =09=09=09=09struct address_space *mapping,
 =09=09=09=09struct list_head *pages,
 =09=09=09=09unsigned *nr_pages);
-void ceph_readpage_to_fscache(struct inode *inode, struct page *page);
-void ceph_invalidate_fscache_page(struct inode* inode, struct page *page);
=20
 static inline void ceph_fscache_inode_init(struct ceph_inode_info *ci)
 {
 =09ci->fscache =3D NULL;
-=09ci->i_fscache_gen =3D 0;
 }
=20
 static inline void ceph_fscache_invalidate(struct inode *inode)
@@ -43,40 +40,6 @@ static inline void ceph_fscache_invalidate(struct inode =
*inode)
 =09fscache_invalidate(ceph_inode(inode)->fscache);
 }
=20
-static inline void ceph_fscache_uncache_page(struct inode *inode,
-=09=09=09=09=09     struct page *page)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09return fscache_uncache_page(ci->fscache, page);
-}
-
-static inline int ceph_release_fscache_page(struct page *page, gfp_t gfp)
-{
-=09struct inode* inode =3D page->mapping->host;
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09return fscache_maybe_release_page(ci->fscache, page, gfp);
-}
-
-static inline void ceph_fscache_readpage_cancel(struct inode *inode,
-=09=09=09=09=09=09struct page *page)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09if (fscache_cookie_valid(ci->fscache) && PageFsCache(page))
-=09=09__fscache_uncache_page(ci->fscache, page);
-}
-
-static inline void ceph_fscache_readpages_cancel(struct inode *inode,
-=09=09=09=09=09=09 struct list_head *pages)
-{
-=09struct ceph_inode_info *ci =3D ceph_inode(inode);
-=09return fscache_readpages_cancel(ci->fscache, pages);
-}
-
-static inline void ceph_disable_fscache_readpage(struct ceph_inode_info *c=
i)
-{
-=09ci->i_fscache_gen =3D ci->i_rdcache_gen - 1;
-}
-
 #else
=20
 static inline int ceph_fscache_register(void)
@@ -115,62 +78,10 @@ static inline void ceph_fscache_file_set_cookie(struct=
 inode *inode,
 {
 }
=20
-static inline void ceph_fscache_revalidate_cookie(struct ceph_inode_info *=
ci)
-{
-}
-
-static inline void ceph_fscache_uncache_page(struct inode *inode,
-=09=09=09=09=09     struct page *pages)
-{
-}
-
-static inline int ceph_readpage_from_fscache(struct inode* inode,
-=09=09=09=09=09     struct page *page)
-{
-=09return -ENOBUFS;
-}
-
-static inline int ceph_readpages_from_fscache(struct inode *inode,
-=09=09=09=09=09      struct address_space *mapping,
-=09=09=09=09=09      struct list_head *pages,
-=09=09=09=09=09      unsigned *nr_pages)
-{
-=09return -ENOBUFS;
-}
-
-static inline void ceph_readpage_to_fscache(struct inode *inode,
-=09=09=09=09=09    struct page *page)
-{
-}
-
 static inline void ceph_fscache_invalidate(struct inode *inode)
 {
 }
=20
-static inline void ceph_invalidate_fscache_page(struct inode *inode,
-=09=09=09=09=09=09struct page *page)
-{
-}
-
-static inline int ceph_release_fscache_page(struct page *page, gfp_t gfp)
-{
-=09return 1;
-}
-
-static inline void ceph_fscache_readpage_cancel(struct inode *inode,
-=09=09=09=09=09=09struct page *page)
-{
-}
-
-static inline void ceph_fscache_readpages_cancel(struct inode *inode,
-=09=09=09=09=09=09 struct list_head *pages)
-{
-}
-
-static inline void ceph_disable_fscache_readpage(struct ceph_inode_info *c=
i)
-{
-}
-
 #endif
=20
-#endif
+#endif /* _CEPH_CACHE_H */
diff --git a/fs/ceph/caps.c b/fs/ceph/caps.c
index 255a512f1277..ca07dfc60652 100644
--- a/fs/ceph/caps.c
+++ b/fs/ceph/caps.c
@@ -2730,10 +2730,6 @@ static int try_get_cap_refs(struct inode *inode, int=
 need, int want,
 =09=09=09=09*got =3D need | want;
 =09=09=09else
 =09=09=09=09*got =3D need;
-=09=09=09if (S_ISREG(inode->i_mode) &&
-=09=09=09    (need & CEPH_CAP_FILE_RD) &&
-=09=09=09    !(*got & CEPH_CAP_FILE_CACHE))
-=09=09=09=09ceph_disable_fscache_readpage(ci);
 =09=09=09ceph_take_cap_refs(ci, *got, true);
 =09=09=09ret =3D 1;
 =09=09}
@@ -2983,11 +2979,6 @@ int ceph_get_caps(struct file *filp, int need, int w=
ant,
 =09=09}
 =09=09break;
 =09}
-
-=09if (S_ISREG(ci->vfs_inode.i_mode) &&
-=09    (_got & CEPH_CAP_FILE_RD) && (_got & CEPH_CAP_FILE_CACHE))
-=09=09ceph_fscache_revalidate_cookie(ci);
-
 =09*got =3D _got;
 =09return 0;
 }
--=20
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

